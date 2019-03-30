From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 30 Mar 2019 00:33:46 -0300
Subject: [Buildroot] [PATCH v3 4/4] support/testing: test_optee.py: test
 optee boot and testsuite
References: <20190322095818.19914-4-etienne.carriere@linaro.org>
Message-ID: <5c9ee39a76ba3_29f73fa56c0d01a0437d9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Looks good, except for the chdir stuff.
Also a lot of nits below.

On Fri, Mar 22, 2019 at 06:58 AM, Etienne Carriere wrote:

[snip]
> ---
>  support/testing/tests/package/test_optee.py | 42 +++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 support/testing/tests/package/test_optee.py

Please run flake8 and fix the warning it generates.
test_optee.py:9:1: E302 expected 2 blank lines, found 1

Please run 'make .gitlab-ci.yml'. BTW the same is also missing in the defconfig
patch 2.

> 
> diff --git a/support/testing/tests/package/test_optee.py b/support/testing/tests/package/test_optee.py
> new file mode 100644
> index 0000000000..44cee74fd8
> --- /dev/null
> +++ b/support/testing/tests/package/test_optee.py
> @@ -0,0 +1,42 @@
> +import os
> +
> +import infra.basetest
> +
> +# This test enforces locally built emulator to prevent old Qemu to
> +# dump secure trace to stdio and corrupting trace synchro expected
> +# through pexpect.
> +
> +class TestOptee(infra.basetest.BRTest):
> +
> +    with open(os.path.join(os.getcwd(), 'configs',
> +                           'qemu_arm_vexpress_tz_defconfig'),
> +              'r') as config_file:

Regarding the use of open(), I see no better option here.

Regarding the use of os.getcwd(), I would prefer to have my patch applied
before this one:
http://patchwork.ozlabs.org/patch/992697/
So here you could use:
    with open(infra.basepath('configs/qemu_armv7a_tz_virt_defconfig'), 'r') as config_file:
This way we would keep the logic to get any path in a single point in the test
infra.
But this suggestion depends on what the maintainers think about my patch.
If you like the idea you can add my patch to your series.

> +        config = "".join(line for line in config_file if line[:1] != '#') + \
> +                 """

nit: for consistence with all other test cases, please use one less indent:
        config = "".join(line for line in config_file if line[:1] != '#') + \
            """

> +                 BR2_PACKAGE_HOST_QEMU=y
> +                 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

Shouldn't these 2 lines be in the config_emulator below ...

> +                 BR2_TOOLCHAIN_EXTERNAL=y
> +                 """
> +    config_emulator = ''

... like this?
     config_emulator = \
         """
         BR2_PACKAGE_HOST_QEMU=y
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """

But see my question on patch 3 before changing this.

> +
> +    def test_run(self):
> +
> +        qemu_options = ['-machine', 'virt,secure=on']
> +        qemu_options.extend(['-cpu', 'cortex-a15'])
> +        qemu_options.extend(['-m', '1024'])
> +        qemu_options.extend(['-semihosting-config', 'enable,target=native'])
> +        qemu_options.extend(['-bios', 'bl1.bin'])
> +
> +        # This test expects Qemu is run from the image direcotry

s/direcotry/directory/

> +        os.chdir(os.path.join(self.builddir, 'images'))

This is not good.
When running multiple test cases, it will make any test case that runs after
this one to fail, see:

$ ./support/testing/run-tests -o o -k \
  tests.core.test_post_scripts.TestPostScripts \
  tests.package.test_optee.TestOptee
20:14:02 TestOptee                                Starting
20:17:01 TestOptee                                Cleaning up
.20:17:01 TestPostScripts                          Starting
E
======================================================================
ERROR: test_run (tests.core.test_post_scripts.TestPostScripts)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/ricardo/src/buildroot/support/testing/infra/basetest.py", line 76, in setUp
    super(BRTest, self).setUp()
  File "/home/ricardo/src/buildroot/support/testing/infra/basetest.py", line 62, in setUp
    self.b.configure(make_extra_opts=["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
  File "/home/ricardo/src/buildroot/support/testing/infra/builder.py", line 48, in configure
    raise SystemError("Cannot olddefconfig")
SystemError: Cannot olddefconfig

A better solution is to add a new optional parameter to Emulator.boot method,
perhaps named "cwd" that defaults to None and is passed to pexpect.spawn(...,
cwd=cwd) (not tested).
This way the Emulator class is aware that qemu must run from a directory, only
for the test cases that pass this.

> +
> +        self.emulator.boot(arch='armv7', options=qemu_options, local=True)
> +        self.emulator.login()
> +
> +        # Trick traces since xtest prints "# " which corrupts emulator run
> +        # method. Tests are dumped only if test fails.
> +        cmd = 'echo "Silent test takes a while, be patient..."; ' + \
> +              'xtest -t regression > /tmp/xtest.log ||' + \
> +              '(cat /tmp/xtest.log && false)'
> +        output, exit_code = self.emulator.run(cmd, timeout=240)

'output' is currently not tested.
It's better to use the convention:
        _, exit_code = self.emulator.run(cmd, timeout=240)

> +        self.assertEqual(exit_code, 0)
> -- 
> 2.17.1


Regards,
Ricardo
