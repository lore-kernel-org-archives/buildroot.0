From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:51:31 -0300
Subject: [Buildroot] [PATCH 3/5] support/testing: add fs tests
References: <1486467363-19881-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b77aa33486_1c373ff16a953ae4923fd@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:36 AM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/conf/minimal-x86-qemu-kernel.config
[snip]

I observed sometimes a testcase fails when it shouldn't.

This emulated system displays some time after boot this message:
Switched to clocksource tsc

When the testcase is small there is a chance the message arrives when 'echo $?'
is being issued.

I took a look at the kernel and I didn't find compile-time configs to avoid
this message.
There are some options for bootargs that maybe could help:
 clocksource=tsc
 loglevel=0
 quiet
But qemu can only use -append when -kernel is used too.

The only config I found that could workaround the error is
# CONFIG_PRINTK is not set
of course it is a big change, and it would need CONFIG_EXPERT=y and it would
also change few more lines in the defconfig.

But I will be happy with any other solution.


Here is how I reproduce the error, but I think its occurrence will depend a lot
on the host machine.

running (after fixing the arch in emulator and also changing the expected
return code to 0):
$ for i in $(seq 1 100); do echo $i ; support/testing/run-tests -d dl \
  -o $(readlink -f output) -k tests.fs.test_iso9660.TestIso9660GrubInternal \
  || break; done

eventually leads to:
======================================================================
ERROR: test_run (tests.fs.test_iso9660.TestIso9660GrubInternal)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v1/support/testing/tests/fs/test_iso9660.py", line 120, in test_run
    exit_code = test_touch_file(self.emulator)
  File "/tmp/testing-v1/support/testing/tests/fs/test_iso9660.py", line 41, in test_touch_file
    _, exit_code = emulator.run("touch test")
  File "/tmp/testing-v1/support/testing/infra/emulator.py", line 131, in run
    exit_code = int(exit_code)
ValueError: invalid literal for int() with base 10: 'echo $?'

----------------------------------------------------------------------
Ran 1 test in 2.789s

log when the test is OK (most of times)
---
mount | grep 'rootfs on / type rootfs'
rootfs on / type rootfs (rw)
# echo $?
0
# > command terminated, status 0
 > running 'touch test'
touch test
# echo $?
0
# > command terminated, status 0
---

log when the test FAILS
---
rootfs on / type rootfs (rw)
# echo $?
0
# > command terminated, status 0
 > running 'touch test'
touch test
# Switched to clocksource tsc
echo $?
0
#
---

[snip]
> +++ b/support/testing/tests/fs/test_iso9660.py
[snip]
> +    emulator.boot(arch="i386", options=["-cdrom", img])

See my comment in patch 1.

[snip]
> +def test_touch_file(emulator):
> +    _, exit_code = emulator.run("touch test")
> +    return exit_code
[snip]
> +class TestIso9660Grub2Internal(infra.basetest.BRTest):
[snip]
> +        exit_code = test_touch_file(self.emulator)
> +        self.assertEqual(exit_code, 1)

Same comment as in TestIso9660SyslinuxInternal below.

> +
> +class TestIso9660GrubInternal(infra.basetest.BRTest):
[snip]
> +        exit_code = test_touch_file(self.emulator)
> +        self.assertEqual(exit_code, 1)

Same comment as in TestIso9660SyslinuxInternal below.

[snip]
> +class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
[snip]
> +        exit_code = test_touch_file(self.emulator)
> +        self.assertEqual(exit_code, 1)
> +
> +class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
[snip]
> +        exit_code = test_touch_file(self.emulator)
> +        self.assertEqual(exit_code, 1)

This testcase fails for me like this (after fixing arch in emulator):
======================================================================
FAIL: test_run (tests.fs.test_iso9660.TestIso9660SyslinuxInternal)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v1/support/testing/tests/fs/test_iso9660.py", line 161, in test_run
    self.assertEqual(exit_code, 1)
AssertionError: 0 != 1

I am not sure if in this case the rootfs should be read-only or not, but this
differs from your previous iteration:

    def run_external(self):
[snip]
        (r, s) = self.s.run("touch test")
        self.assertEqual(s, 1)

    def run_internal(self):
[snip]
        (r, s) = self.s.run("touch test")
        self.assertEqual(s, 0)

Regards,
Ricardo
