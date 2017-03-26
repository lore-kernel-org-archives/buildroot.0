From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 26 Mar 2017 23:54:01 +0200
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
	infrastructure
In-Reply-To: <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <9ae44859-b8aa-2676-1eea-c36778858960@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

only a minor nit that I noticed while reviewing patch 5.

On 20/03/2017 21:36, Thomas Petazzoni wrote:
[...]
> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> new file mode 100644
> index 0000000..c3f645c
> --- /dev/null
> +++ b/support/testing/infra/__init__.py
[...]
> +def get_elf_prog_interpreter(builddir, prefix, fpath):
> +    cmd = ["host/usr/bin/{}-readelf".format(prefix),
> +           "-l", os.path.join("target", fpath)]
> +    out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
> +    regexp = re.compile("^ *\[Requesting program interpreter: (.*)\]$")
> +    for line in out.splitlines():
> +        m = regexp.match(line)
> +        if not m:
> +            continue
> +        return m.group(1)
> +    return None

This should be documented, just like get_elf_arch_tag() above. Proposal
(unchecked):

"""
Runs the cross readelf on 'fpath' to extract the program interpreter
name and returns it.
Example:
>>> get_elf_prog_interpreter('output', 'arm-none-linux-gnueabi-',
                     'bin/busybox')
/lib/ld-uClibc.so.0
>>>
"""

-- 
Luca
