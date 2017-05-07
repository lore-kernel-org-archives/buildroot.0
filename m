From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 7 May 2017 23:07:31 +0200
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <dd7ec6aa-0778-8e92-b031-cbc82c982005@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this the review I had written a few days ago. Since the patch has just
been applied, I've reworded it as a list of proposed improvements and
request for clarifications.

On 20/03/2017 21:36, Thomas Petazzoni wrote:
> This commit adds the core of a new testing infrastructure that allows to
> perform runtime testing of Buildroot generated systems. This
> infrastructure uses the Python unittest logic as its foundation.

Good we have this on master now!

Things that I already commented about and for which I plan to send patches:
- remove smart_open
- document code
- better reporting

[...]

> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> new file mode 100644
> index 0000000..c3f645c
> --- /dev/null
> +++ b/support/testing/infra/__init__.py
> @@ -0,0 +1,89 @@
> +import contextlib
> +import os
> +import re
> +import sys
> +import tempfile
> +import subprocess
> +from urllib2 import urlopen, HTTPError, URLError
> +
> +ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"

Since you renamed artefacts to artifacts, it's probably good to rename
in the URL too (and update the server). Sure it's a minor nit, but since
it's an URL that should stay available for long, better having it fixed
as soon as possible.

[...]

> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> new file mode 100644
> index 0000000..7c476cb
> --- /dev/null
> +++ b/support/testing/infra/emulator.py
> @@ -0,0 +1,135 @@
> +import socket
> +import subprocess
> +import telnetlib
> +
> +import infra
> +import infra.basetest
> +
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
> +    # 'builtin'. 'builtin' means a pre-built kernel image will be
> +    # downloaded from ARTEFACTS_URL and suitable options are
> +    # automatically passed to qemu and added to the kernel cmdline. So
> +    # far only armv5, armv7 and i386 builtin kernels are available.
> +    # If None, then no kernel is used, and we assume a bootable device
> +    # will be specified.
> +    #
> +    # kernel_cmdline: array of kernel arguments to pass to Qemu -append option
> +    #
> +    # options: array of command line options to pass to Qemu
> +    #
> +    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
> +        if arch in ["armv7", "armv5"]:
> +            qemu_arch = "arm"
> +        else:
> +            qemu_arch = arch
> +
> +        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> +                    "-serial", "telnet::1234,server",
> +                    "-display", "none"]
> +
> +        if options:
> +            qemu_cmd += options
> +
> +        if kernel_cmdline is None:
> +            kernel_cmdline = []
> +
> +        if kernel:
> +            if kernel == "builtin":
> +                if arch in ["armv7", "armv5"]:
> +                    kernel_cmdline.append("console=ttyAMA0")
> +
> +                if arch == "armv7":
> +                    kernel = infra.download(self.downloaddir,
> +                                            "kernel-vexpress")
> +                    dtb = infra.download(self.downloaddir,
> +                                         "vexpress-v2p-ca9.dtb")
> +                    qemu_cmd += ["-dtb", dtb]
> +                    qemu_cmd += ["-M", "vexpress-a9"]
> +                elif arch == "armv5":
> +                    kernel = infra.download(self.downloaddir,
> +                                            "kernel-versatile")
> +                    qemu_cmd += ["-M", "versatilepb"]
> +
> +            qemu_cmd += ["-kernel", kernel]

I'm OK with the "builtin" logic, but I really dislike it being
hard-coded in Emulator.boot(). It's acceptable for the moment since we
have only very few builtin kernels. Should we add more in the future, I
think we should at least have a sort of "database" of builtin kernels,
perhaps in the form of an associative array.

> diff --git a/support/testing/run-tests b/support/testing/run-tests
> new file mode 100755
> index 0000000..339bb66
> --- /dev/null
> +++ b/support/testing/run-tests
> @@ -0,0 +1,83 @@
> +#!/usr/bin/env python2
> +import argparse
> +import sys
> +import os
> +import nose2
> +
> +from infra.basetest import BRTest
> +
> +def main():
> +    parser = argparse.ArgumentParser(description='Run Buildroot tests')
> +    parser.add_argument('testname', nargs='*',
> +                        help='list of test cases to execute')
> +    parser.add_argument('--list', '-l', action='store_true',
> +                        help='list of available test cases')
> +    parser.add_argument('--all', '-a', action='store_true',
> +                        help='execute all test cases')
> +    parser.add_argument('--stdout', '-s', action='store_true',
> +                        help='log everything to stdout')
> +    parser.add_argument('--output', '-o',
> +                        help='output directory')
> +    parser.add_argument('--download', '-d',
> +                        help='download directory')
> +    parser.add_argument('--keep', '-k',
> +                        help='keep build directories',
> +                        action='store_true')

Stylish note: I would put the one-letter form before the long form. This
is not only my personal taste, but also what the manpages usually do,
and what Python does with the automatically-added -h/--help parameter:

  $ ./support/testing/run-tests
  [...]
  optional arguments:
    -h, --help            show this help message and exit
    --list, -l            list of available test cases

I'll send a patch.

-- 
Luca
