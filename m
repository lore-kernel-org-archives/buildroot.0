From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 5 Mar 2017 00:26:56 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <00b34c21-2baa-6f93-9032-e3946481af68@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/02/2017 12:35, Thomas Petazzoni wrote:
> This commit adds the core of a new testing infrastructure that allows to
> perform runtime testing of Buildroot generated systems. This
> infrastructure uses the Python unittest logic as its foundation.
> 
> This core infrastructure commit includes the following aspects:
> 
>  - A base test class, called BRTest, defined in
>    support/testing/infra/basetest.py. This base test class inherited
>    from the Python provided unittest.TestCase, and must be subclassed by
>    all Buildroot test cases.
> 
>    Its main purpose is to provide the Python unittest setUp() and
>    tearDown() methods. In our case, setUp() takes care of building the
>    Buildroot system described in the test case, and instantiate the
>    Emulator object in case runtime testing is needed. The tearDown()
>    method simply cleans things up (stop the emulator, remove the output
>    directory).
> 
>  - A Builder class, defined in support/testing/infra/builder.py, simply
>    responsible for building the Buildroot system in each test case.
> 
>  - An Emulator class, defined in support/testing/infra/emulator.py,
>    responsible for running the generated system under Qemu, allowing
>    each test case to run arbitrary commands inside the emulated system.
> 
>  - A run-tests script, which is the entry point to start the tests.
> 
> Even though I wrote the original version of this small infrastructure, a
> huge amount of rework and improvement has been done by Maxime
> Hadjinlian, and squashed into this patch. So many thanks to Maxime for
> cleaning up and improving my Python code!
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I finally had a closer look to this work, and generally speaking the
infrastructure quite straightforward. I have several remarks (see
below), but most of them are minor, coding style and the like.

Disclaimer: I know python only at a very very basic level.

And since it's likely that several Buildroot users have little python
experience, I think documenting the code here is more important than in
most make and kconfig code. So I propose a few lines of documentation
below. I'd propose more, but for that I'll wait for a consensus on the
general approach.

The only thing I don't like very much is the output format. It's very
unpleasant and I'd like it to be nicer. But since we are using a testing
framework I guess this is non trivial. In this case I'll gladly accept
what we have: runtime testing with unpleasant output is _a lot_ better
that no runtime testing.

> +++ b/support/testing/infra/__init__.py
> @@ -0,0 +1,61 @@
> +import contextlib
> +import os
> +import sys
> +import tempfile
> +import subprocess
> +from urllib2 import urlopen, HTTPError, URLError
> +
> +ARTEFACTS_URL = "http://autobuild.buildroot.net/artefacts/"

I think the usual spelling is "artifacts".

> + at contextlib.contextmanager
> +def smart_open(filename=None):
> +    if filename and filename != '-':
> +        fhandle = open(filename, 'a+')
> +    else:
> +        fhandle = sys.stdout
> +
> +    try:
> +        yield fhandle
> +    finally:
> +        if fhandle is not sys.stdout:
> +            fhandle.close()

contextmanager and yield took me some time and research to understand
what this function is. For non-pythonists, I'd add a comment such as:

"""
Return a file-like object that can be written to using the 'with'
keyword, as in the example:
  with infra.smart_open("test.log") as outfile:
    outfile.write("Hello, world!\n")
"""

Also, since it creates a writable thing (not a readable one), a name
like open_for_writing() would be more understandable.

> +def filepath(relpath):
> +    return os.path.join(os.getcwd(), "support/testing", relpath)
> +
> +def download(dldir, filename):
> +    finalpath = os.path.join(dldir, filename)
> +    if os.path.exists(finalpath):
> +        return finalpath
> +
> +    if not os.path.exists(dldir):
> +        os.makedirs(dldir)
> +
> +    tmpfile = tempfile.mktemp(dir=dldir)
> +    print "Downloading to {}".format(tmpfile)
> +
> +    try:
> +        url_fh = urlopen(os.path.join(ARTEFACTS_URL, filename))
> +        with open(tmpfile, "w+") as tmpfile_fh:
> +            tmpfile_fh.write(url_fh.read())

I think this code read()s the whole file in RAM, then writes it all out.
This might be a problem if we download large files. Is there any
pythonic way to read-and-write in chunks without much added code? Come
on pythonists, I'm sure you can do it with at most one extra line... :)

> +def get_elf_arch_tag(builddir, prefix, fpath, tag):
> +    cmd = ["host/usr/bin/{}-readelf".format(prefix),
> +           "-A", os.path.join("target", fpath)]
> +    out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
> +    for line in out.splitlines():
> +        line = line.strip()
> +        if not line.startswith(tag):
> +            continue
> +        return line.split(":")[1].strip()
> +    return None

A small example as documentation would help. Draft proposal:

"""
Runs the cross readelf on 'fpath', then extracts the value of tag 'tag'.
Example:
  >>> get_elf_arch_tag('output', 'arm-none-linux-gnueabi-',
                       'bin/busybox', 'Tag_CPU_arch')
  v5TEJ
  >>>
"""

> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> new file mode 100644
> index 0000000..4f72e2f
> --- /dev/null
> +++ b/support/testing/infra/builder.py
> @@ -0,0 +1,50 @@
> +import os
> +import shutil
> +import subprocess
> +
> +import infra
> +
> +class Builder(object):
> +    def __init__(self, config, builddir, logtofile):
> +        self.config = config
> +        self.builddir = builddir
> +        self.logtofile = logtofile
> +
> +    def build(self):
> +        if not os.path.isdir(self.builddir):
> +            os.makedirs(self.builddir)
> +
> +        log = "{}-build.log".format(self.builddir)
> +        if self.logtofile is None:
> +            log = None

I think there's a bug here. The 'logtofile' variable in BRTest is always
assigned to True or False, then passed to Builder. So self.logfile here
is never None, and this if never matches.

> +
> +        config_file = os.path.join(self.builddir, ".config")
> +        with open(config_file, "w+") as cfd:
> +            cfd.write(self.config)

I wonder what the 'd' in "cfd" means...

> +        cmd = ["make",
> +               "-C", os.getcwd(),
> +               "O={}".format(self.builddir),
> +               "olddefconfig"]

Why do we need to add "-C" + os.getcwd()? I think this is equivalent to
"-C ." in shell, which is the default make behaviour.

> +# TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
> +# with the qemu machine.
> +class Emulator(object):
> +
> +    def __init__(self, builddir, downloaddir, logtofile):
> +        self.qemu = None
> +        self.__tn = None
> +        self.downloaddir = downloaddir
> +        self.log = ""
> +        self.log_file = "{}-run.log".format(builddir)
> +        if logtofile is None:
> +            self.log_file = None
> +
> +    # Start Qemu to boot the system
> +    #
> +    # arch: Qemu architecture to use
> +    #
> +    # kernel: path to the kernel image, or the special string
> +    # 'builtin' in which case a pre-built kernel image will be used
> +    # (so far only armv5 and armv7 kernels are available). If None,
> +    # then no kernel is used, and we assume a bootable device will be
> +    # specified.

When first reading this, I understood that the 'builtin' kernels are
provided by qemu. Instead, they are provided by some server that is
related to the Buildroot project (currently free-electrons.com).

So I'd rephrase as:

    # kernel: path to the kernel image, or the special string
    # 'builtin'.
    # 'builtin' means a pre-built kernel image will be
    # downloaded from <BASEURL> and suitable options are automatically
    # passed to qemu and added to the kernel cmdline. So far only armv5
    # and armv7 builtin kernels are available.
    # If None, then no kernel is used, and we assume a bootable device
    # will be specified.

> +    #
> +    # kernel_cmdline: array of kernel arguments to pass to Qemu -append option
> +    #
> +    # options: array of command line options to pass to Qemu
> +    #
> +    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
> +        if arch in ["armv7", "armv5"]:
> +            qemu_arch = "arm"
> +
> +        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> +                    "-serial", "telnet::1234,server",
> +                    "-display", "none"]
> +
> +        if options:
> +            qemu_cmd += options

If the default value for 'options' were '[]', the if would not be
needed. Not it is because 'None' is not iterable.

> +
> +        if kernel_cmdline is None:
> +            kernel_cmdline = []

If the default value for 'kernel_cmdline' were '[]', these two lines
could be removed entrely.

> +    # Wait for the login prompt to appear, and then login as root with
> +    # the provided password, or no password if not specified.
> +    def login(self, password=None):
> +        with infra.smart_open(self.log_file) as lfh:
> +            lfh.write("> waiting for login\n")
> +
> +        self.__read_until("buildroot login:", 10)
> +        if "buildroot login:" not in self.log:
> +            with infra.smart_open(self.log_file) as lfh:
> +                lfh.write("==> System does not boot")
> +            raise SystemError("System does not boot")
> +
> +        with infra.smart_open(self.log_file) as lfh:
> +            lfh.write("> log in\n")

smart_open() is called 3 times in login(), 2 in run() and a few more
timer elsewhere in this class. Can't we open the file once in the
constructor and the just write to it?

> +    # Run the given 'cmd' on the target
> +    # return a tuple (output, exit_code)
> +    def run(self, cmd):
> +        with infra.smart_open(self.log_file) as lfh:
> +            lfh.write("> running '{}'\n".format(cmd))
> +
> +        self.__write("{}\n".format(cmd))

I think this simpler form is equally legal:

  self.__write(cmd + "\n")

> +    def showlog(self):
> +        print "=== Full log ==="
> +        print self.log
> +        print "================"

Unused function.

> +def main():
> +    parser = argparse.ArgumentParser(description='Run Buildroot tests')
[...]
> +    if args.download is None:
> +        print "Missing download directory, please use -d/--download"
> +        return 1

It would be nice to use an environment variable as a default for the
download dir. It might be BR2_DL_DIR itself, i.e. sharing the existing
Buildroot package download dir. I bet most people set BR2_DL_DIR in
their ~/.bashrc.

> +    if not os.path.exists(args.output):
> +        print "The selected output directory does not exist"
> +        return 1

If the download directory does not exist is is created. Why is the
output directory handled differently?

And again, it would be nice to default to an environment variable, e.g.
BR2_RUNTIME_TESTS_OUTPUT_DIR.

> +    BRTest.outputdir = args.output
> +
> +    if args.all is False and len(args.testname) == 0:
> +        print "No test selected"
> +        return 1

I like programs that print their usage whenever the command line has
errors (in addition to telling what the error is).

IOW (untested):

    if args.all is False and len(args.testname) == 0:
        print "No test selected"
+       print ""
+       parser.print_help()
        return 1

-- 
Luca
