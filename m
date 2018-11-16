From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 21:45:47 -0200
Subject: [Buildroot] [PATCH 4/5] support/testing/tests: CLANG
 compiler-rt runtime test
References: <1542150146-12188-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bef56ab8382d_7de93ff1366993dc509ea@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In overall it looks good.

On Tue, Nov 13, 2018 at 09:02 PM, Matt Weber wrote:

> This patch adds a test case that
>  1) Builds the complete LLVM and CLANG set of host tools
>  2) Cross-compiles the compiler-rt runtime using CLANG
>  3) Builds a cross-compiled application using CLANG and the libfuzzer
>     compiler-rt library.
>  4) Executes the fuzz application on target and checkes expected output
> 
> Credit to the fuzzer test suite for the tutorial example used as the
> fuzz test application.
> https://github.com/google/fuzzer-test-suite
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/tests/package/test_clang.py | 93 +++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 support/testing/tests/package/test_clang.py

The change to .gitlab-ci.yml (resulting from 'make .gitlab-ci.yml') is missing.

> 
> diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
> new file mode 100644
> index 0000000..9c42c0d
> --- /dev/null
> +++ b/support/testing/tests/package/test_clang.py
> @@ -0,0 +1,93 @@
> +import os
> +import tempfile
> +import subprocess
> +import shutil
> +
> +import infra.basetest
> +
> +FUZZ_TIMEOUT = 120
> +
> +
> +class TestClangBase(infra.basetest.BRTest):
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        # Sanitizers overallocate memory and the minimum that seemed to work was 512MB
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           options=["-m", "512", "-initrd", img])

Here you could merge in the contents of patch 3, as I replied there.

> +        self.emulator.login()
> +
> +    def build_test_prog(self):
> +        hostdir = os.path.join(self.builddir, 'host')
> +        linkerdir = os.path.join(hostdir, 'opt', 'ext-toolchain')
> +        stagingdir = os.path.join(self.builddir, 'staging')
> +        env = os.environ.copy()
> +        env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
> +        clangcpp = os.path.join(hostdir, 'bin', 'clang++')
> +        workdir = os.path.join(tempfile.mkdtemp(suffix='-br2-testing-compiler-rt'))
> +        fuzz_src = os.path.join(workdir, 'fuzz_me.cc')
> +        fuzz_bin = os.path.join(workdir, 'fuzz_me')
> +        with open(fuzz_src, 'w+') as source_file:
> +            source_file.write('#include <stdint.h>\n')
> +            source_file.write('#include <stddef.h>\n')
> +            source_file.write('bool FuzzMe(const uint8_t *Data, size_t DataSize) {\n')
> +            source_file.write('  return DataSize >= 3 &&\n')
> +            source_file.write('      Data[0] == \'F\' &&\n')
> +            source_file.write('      Data[1] == \'U\' &&\n')
> +            source_file.write('      Data[2] == \'Z\' &&\n')
> +            source_file.write('      Data[3] == \'Z\';\n')
> +            source_file.write('}\n')
> +            source_file.write('extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {\n')
> +            source_file.write('  FuzzMe(Data, Size);\n')
> +            source_file.write('  return 0;\n')
> +            source_file.write('}\n')

I dislike this a bit for 2 reasons:

1) The contents of the file would be much more readable in a separate file. See
   for example the changes introduced by commit "ee6b37cf87 support/testing: use
   TestPythonPackageBase for python-incremental";

2) This is a package for the target. The most correct way of handling this IMO
   is to use a package in a br2-external.
   Unfortunately this support is not yet merged to the test infra.
   If you like the idea, you could pull and resend 2 patches of mine: [1] [2]
   Here is a sketch, poorly tested because... well... this test case takes a lot
   of time to run: [3]
   And if you follow this road, you could even move the login() method and use a
   single class: [4]

What do you think about this?

[snip]
> +class TestClangCompilerRT(TestClangBase):
> +    config = \
> +             """

I see that you used test_rust as base.
This test (rust) is the last remaining using a defconfig fragment with
non-standard style.
I just sent a patch to fix it: [5]
Could do the same here?

> +             BR2_aarch64=y

> +             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +             BR2_TOOLCHAIN_EXTERNAL=y

nit: this is not the order after 'make savedefconfig'

> +             BR2_LINUX_KERNEL=y
> +             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +             BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +             BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +             BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

> +             BR2_TARGET_ROOTFS_CPIO=y
> +             BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +             # BR2_TARGET_ROOTFS_TAR is not set
> +             BR2_PACKAGE_COMPILER_RT=y
> +             BR2_PACKAGE_LLVM=y

nit: this is not the order after 'make savedefconfig'


[1] http://patchwork.ozlabs.org/patch/912351/
[2] http://patchwork.ozlabs.org/patch/912354/
[3] https://gitlab.com/RicardoMartincoski/buildroot/commit/62a6f7323149b8ea283962c70b14c47cd4b4bb78
[4] https://gitlab.com/RicardoMartincoski/buildroot/blob/61dca1a1246dcda17ecb1e73fc8fa4d9c1921239/support/testing/tests/package/test_clang.py
[5] http://patchwork.ozlabs.org/patch/999190/


Regards,
Ricardo
