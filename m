From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 17:07:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libglib2: bump to version
 2.60.0
In-Reply-To: <20190415225541.3002-1-aduskett@gmail.com>
References: <20190415225541.3002-1-aduskett@gmail.com>
Message-ID: <20190426170751.18c6c159@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Apr 2019 18:55:41 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Changes include:
>   - Moving to the meson build system, as autoconf is no longer supported.
>   - Add 0002-Only-build-tests-if-certain-conditions-are-met.patch
>   - Add 0003-remove-cpp-requirement.patch because c++ is not needed.
>   - Add 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch to prevent
>     a false error when compiling against older gcc versions.
>     (https://gitlab.gnome.org/GNOME/glib/issues/1744)
>   - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch as the
>     switch to meson makes this obsolete.
>   - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk
>   - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk
> 
> All tests pass:
> ./utils/test-pkg -c ./defconfig
>            br-arm-full [1/6]: OK

Unfortunately, the following defconfig doesn't build here:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBGLIB2=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails with:

[669/1014] Generating test_resources2.o with a custom command.
FAILED: gio/tests/test_resources2.o 
objcopy --add-symbol _g_binary_test1_resource_data=.data:0 gio/tests/test_resources.o gio/tests/test_resources2.o
objcopy: unrecognized option '--add-symbol'
Usage: objcopy [option(s)] in-file [out-file]
 Copies a binary file, possibly transforming it in the process
[...]
 srec symbolsrec verilog tekhex binary ihex
[670/1014] Linking target gio/tests/async-close-output-stream.
[671/1014] Linking target gio/tests/contexts.
[672/1014] Linking target gio/tests/libresourceplugin.so.
[673/1014] Linking target gio/tests/cancellable.
[674/1014] Linking target gio/tests/buffered-output-stream.
[675/1014] Compiling C object 'gio/tests/bcb7ac7@@buffered-input-stream at exe/buffered-input-stream.c.o'.
[676/1014] Generating symbol file 'gio/tests/gdbus-object-manager-example/bfe1c9a@@gdbus-example-objectmanager at sha/libgdbus-example-objectmanager.so.symbols'.
[677/1014] Compiling C object 'gio/tests/bcb7ac7@@converter-stream at exe/converter-stream.c.o'.
ninja: build stopped: subcommand failed.
make[1]: *** [/home/test/outputs/glib/build/host-libglib2-2.60.1/.stamp_built] Error 1

So, apparently, it's using the --add-symbol option of objcopy, which
doesn't exist in this ancient objcopy version:

$ objcopy --version
GNU objcopy (GNU Binutils for Debian) 2.22

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
