From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:46:17 -0300
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
References: <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b7796915aa8_1c373ff168005f0c91983@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:35 AM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/infra/emulator.py
[snip]
> +    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
> +        if arch in ["armv7", "armv5"]:
> +            qemu_arch = "arm"

Support for arch="i386" from test_iso9660 is missing here:
        else:
            qemu_arch = arch

ERROR: test_run (tests.fs.test_iso9660.TestIso9660SyslinuxInternal)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v1/support/testing/tests/fs/test_iso9660.py", line 157, in test_run
    self.builddir, internal=True)
  File "/tmp/testing-v1/support/testing/tests/fs/test_iso9660.py", line 30, in test_mount_internal_external
    emulator.boot(arch="i386", options=["-cdrom", img])
  File "/tmp/testing-v1/support/testing/infra/emulator.py", line 39, in boot
    qemu_cmd = ["qemu-system-{}".format(qemu_arch),
UnboundLocalError: local variable 'qemu_arch' referenced before assignment

> +
> +        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> +                    "-serial", "telnet::1234,server",
> +                    "-display", "none"]
[snip]
> +++ b/support/testing/run-tests
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env python

Maybe we can do for now as scanpypi does:
#!/usr/bin/python2

[snip]
> +import string

Not used.

[snip]
> +    if not os.path.exists(args.output):
> +        print "The selected output directory does not exist"
> +        return 1
> +
> +    BRTest.outputdir = args.output

Maybe changing this line to:
    BRTest.outputdir = os.path.abspath(args.output)
would fix the use of relative path with some testcases.

$ support/testing/run-tests -d dl -o $(readlink -f output) \
  tests.core.test_post_scripts.TestPostScripts
...
OK

$ support/testing/run-tests -d dl -o output \
  tests.core.test_post_scripts.TestPostScripts
...
FAIL: test_run (tests.core.test_post_scripts.TestPostScripts)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v1/support/testing/tests/core/test_post_scripts.py", line 34, in test_run
    self.check_post_log_file(f, "target")
  File "/tmp/testing-v1/support/testing/tests/core/test_post_scripts.py", line 21, in check_post_log_file
    self.assertEqual(lines[0], os.path.join(self.builddir, what))
AssertionError: '/tmp/testing-v1/output/TestPostScripts/target' != 'output/TestPostScripts/target'

Regards,
Ricardo
