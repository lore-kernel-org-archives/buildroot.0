From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Feb 2020 16:48:05 +0100
Subject: [Buildroot] [PATCH 1/1] utils/show-progress: add tool to show
 build progress at runtime
In-Reply-To: <20190807203502.27269-1-vadim4j@gmail.com>
References: <20190807203502.27269-1-vadim4j@gmail.com>
Message-ID: <989f7e1a-4aff-6ba6-d909-5662511f5876@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vadim,

 We finally got to this patch :-)

On 07/08/2019 22:35, Vadim Kochan wrote:
> This might be useful to watch the amount of built and selected
> packages and some progress about it. So added python script which
> prints progress and build stats. The sample of output is:
> 
> Press Ctrl-C to exit ...
> 
> Building: output/qemu_x86_64
>  ##################################------------------------------ [ 42.42% 14/33]
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

 I tried it twice and it failed both times....


 First I tried with an in-tree build, and that failed with:

Traceback (most recent call last):
  File "/home/arnout/src/buildroot/utils/show-progress", line 104, in <module>
    main()
  File "/home/arnout/src/buildroot/utils/show-progress", line 83, in main
    pkgs = get_pkgs_list(os.path.realpath(build_dir))
  File "/home/arnout/src/buildroot/utils/show-progress", line 46, in get_pkgs_list
    pkg_list = json.loads(p.communicate()[0])
  File "/usr/lib64/python3.7/json/__init__.py", line 348, in loads
    return _default_decoder.decode(s)
  File "/usr/lib64/python3.7/json/decoder.py", line 337, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
  File "/usr/lib64/python3.7/json/decoder.py", line 355, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

(for in-tree build, the '-C build_dir' shouldn't be there; so I'd make the
build_dir optional and assume in-tree build if it's not provided.)


 Second, with out-of-tree build, it failed with:

Traceback (most recent call last):
  File "/home/arnout/src/buildroot/utils/show-progress", line 104, in <module>
    main()
  File "/home/arnout/src/buildroot/utils/show-progress", line 83, in main
    pkgs = get_pkgs_list(os.path.realpath(build_dir))
  File "/home/arnout/src/buildroot/utils/show-progress", line 46, in get_pkgs_list
    pkg_list = json.loads(p.communicate()[0])
  File "/usr/lib64/python3.7/json/__init__.py", line 348, in loads
    return _default_decoder.decode(s)
  File "/usr/lib64/python3.7/json/decoder.py", line 337, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
  File "/usr/lib64/python3.7/json/decoder.py", line 355, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 51421 (char 51420)

 That's probably a python3 issue. In fact, the script should explicitly call
python3. We don't want deprecated stuff.


 We also discussed a bit about whether this should be integrated in brmake, but
it seems quite difficult so let's just get a working version in first :-)

 Regards,
 Arnout

> ---
>  utils/show-progress | 106 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100755 utils/show-progress
> 
> diff --git a/utils/show-progress b/utils/show-progress
> new file mode 100755
> index 0000000000..1395664696
> --- /dev/null
> +++ b/utils/show-progress
> @@ -0,0 +1,106 @@
> +#!/usr/bin/env python
> +
> +from __future__ import print_function
> +import subprocess
> +import json
> +import time
> +import sys
> +import os
> +
> +do_exit = False
> +
> +class Package:
> +    def __init__(self):
> +        self.build_dir = ""
> +        self.version = ""
> +        self.type = ""
> +        self.name = ""
> +
> +    def get_full_name(self):
> +        if self.version != "":
> +            return self.name + "-" + self.version
> +        return self.name
> +
> +    def is_built(self):
> +        return os.path.exists(self.build_dir + "/build/" + \
> +                self.get_full_name() + "/.stamp_" + self.type + "_installed")
> +
> +def usage():
> +    print("""Usage: show-progress [-h] PATH
> +
> +Shows progress about selected and built packages.
> +PATH must point to the output folder with generated Makefile.
> +
> +Example usage:
> + $ show-progress output/qemu_x86_64
> +""")
> +    sys.exit(0)
> +
> +def get_pkgs_list(build_dir):
> +    cmd = ["make", "-C", build_dir, "-s", "--no-print-directory", "show-info"]
> +    results = []
> +
> +    with open(os.devnull, 'wb') as devnull:
> +        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
> +                             universal_newlines=True)
> +        pkg_list = json.loads(p.communicate()[0])
> +
> +        for p in pkg_list:
> +            if pkg_list[p]["type"] == "rootfs" or pkg_list[p]["virtual"]:
> +                continue
> +
> +            pkg = Package()
> +            pkg.version = pkg_list[p]["version"]
> +            pkg.build_dir = build_dir
> +            pkg.name = p
> +
> +            if pkg_list[p]["install_images"]:
> +                pkg.type = "images"
> +            elif pkg_list[p]["install_staging"] and not pkg_list[p]["install_target"]:
> +                pkg.type = "staging"
> +            else:
> +                pkg.type = pkg_list[p]["type"]
> +
> +            results.append(pkg)
> +
> +    return results
> +
> +def progress(ready, total):
> +    max_len = 60
> +    perc = ready / (total * 1.0)
> +    fill = int(round(perc * max_len))
> +    line = '#' * fill + '-' * (60 - fill)
> +    line = line + '[{:>7.2%} {: >2d}/{}]'.format(perc, ready, total)
> +    print('\r', line, end='')
> +    sys.stdout.flush()
> +
> +def main():
> +    if "-h" in sys.argv or "--help" in sys.argv or len(sys.argv) == 1:
> +        usage()
> +
> +    build_dir = sys.argv[1]
> +
> +    pkgs = get_pkgs_list(os.path.realpath(build_dir))
> +    total = len(pkgs)
> +
> +    print("Press Ctrl-C to exit ...\n")
> +    print("Building: " + build_dir)
> +
> +    while not do_exit:
> +        ready = 0
> +
> +        for p in pkgs:
> +            if p.is_built():
> +                ready = ready + 1
> +
> +        progress(ready, total)
> +        time.sleep(1)
> +
> +        if ready == total:
> +            print("Done")
> +            break
> +
> +try:
> +    main()
> +except KeyboardInterrupt:
> +    do_exit = True
> 
