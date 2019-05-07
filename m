From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 7 May 2019 23:12:10 +0200
Subject: [Buildroot] [PATCH v7 5/5] testing/tests: CLANG compiler-rt
 runtime test
In-Reply-To: <20190501194032.765-6-matthew.weber@rockwellcollins.com>
References: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
 <20190501194032.765-6-matthew.weber@rockwellcollins.com>
Message-ID: <3f14fe0c-d2a1-4502-b94d-0045e4c06e5b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 01/05/2019 ? 21:40, Matt Weber a ?crit?:
> This patch adds a test case that
>  1) Builds the complete LLVM and CLANG set of host tools
>  2) Cross-compiles the compiler-rt runtime using CLANG
>  3) Builds a cross-compiled application using CLANG and the libfuzzer
>     compiler-rt library.
>  4) Executes the fuzz application (part of the libfuzzer package) on
>     target and checks expected output

Can you provide an example of expected output of fuzz_me ?
I tried on x86_64 bit but I get an error: AddressSanitizer: heap-buffer-overflow

I'm testing with aarch64 at the moment.

> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> [with the entire series applied on next branch:
>  https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/121908178
>  NOTE: this test case takes longer than test_rust, ~2 hours in my host
>  machine with all tarballs previously downloaded]
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---

[snip]

6814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
> new file mode 100644
> index 0000000000..7d6f83b4d3
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libfuzzer
> +#
> +################################################################################
> +
> +LIBFUZZER_VERSION = 64e4d9aa19a8d33b61882154addbf8419d7416e1
> +LIBFUZZER_SITE = $(call github,google,fuzzer-test-suite,$(LIBFUZZER_VERSION))
> +LIBFUZZER_LICENSE = Apache-2.0
> +LIBFUZZER_LICENSE_FILES = LICENSE
> +LIBFUZZER_DEPENDENCIES = compiler-rt
> +
> +define LIBFUZZER_BUILD_CMDS
> +	$(HOST_DIR)/bin/clang++ -mcpu=cortex-a53 --sysroot=$(STAGING_DIR) \

There is no -mcpu option with clang++, I had to use -march=x86-64 instead.

> +		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \

Using $(HOST_DIR)/opt/ext-toolchain expect an external toolchain (this is the
case during the test), but it doesn't work for internal toolchain or external
pre-installed toolchain.

Clang++ is using the path provided by -B to find crtbegin.o. This object file is
not copied when using a pre-installed toolchain.

https://pastebin.com/Wm59Z9nz

Best regards,
Romain

> +		$(@D)/tutorial/fuzz_me.cc \
> +		-o $(@D)/fuzz_me
> +endef
> +
> +define LIBFUZZER_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/fuzz_me $(TARGET_DIR)/usr/bin/fuzz_me
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
> new file mode 100644
> index 0000000000..84a2528b00
> --- /dev/null
> +++ b/support/testing/tests/package/test_clang.py
> @@ -0,0 +1,46 @@
> +import os
> +
> +import infra.basetest
> +
> +FUZZ_TIMEOUT = 120
> +
> +
> +class TestClangCompilerRT(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_COMPILER_RT=y
> +        BR2_PACKAGE_LLVM=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_LIBFUZZER=y
> +        """
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        # Sanitizers overallocate memory and the minimum that seemed to work was 512MB
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a53", "-m", "512", "-initrd", img])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        self.login()
> +
> +        # The test case verifies both that the application executes and that
> +        # the symbolizer is working to decode the stack trace
> +        cmd = "fuzz_me 2>&1 | grep _M_replace"
> +        _, exit_code = self.emulator.run(cmd, FUZZ_TIMEOUT)
> +        self.assertEqual(exit_code, 0)
> 
