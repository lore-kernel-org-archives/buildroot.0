From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 20:47:50 +0200
Subject: [Buildroot] [PATCH 1/2] libdebian-installer: new package
In-Reply-To: <1458298843-21326-1-git-send-email-benoit.allard@greenbone.net>
References: <1458298843-21326-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160330204750.04c7c1fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 12:00:42 +0100, Beno?t Allard wrote:

> diff --git a/package/libdebian-installer/libdebian-installer.mk b/package/libdebian-installer/libdebian-installer.mk
> new file mode 100644
> index 0000000..b542659
> --- /dev/null
> +++ b/package/libdebian-installer/libdebian-installer.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libdebian-installer
> +#
> +################################################################################
> +
> +
> +LIBDEBIAN_INSTALLER_VERSION = 0.104
> +LIBDEBIAN_INSTALLER_SOURCE = libdebian-installer_$(LIBDEBIAN_INSTALLER_VERSION).tar.xz
> +LIBDEBIAN_INSTALLER_SITE = http://snapshot.debian.org/archive/debian-debug/20160218T034808Z/pool/main/libd/libdebian-installer/

Another possibility could be to fetch from the Git repository at
https://anonscm.debian.org/cgit/d-i/libdebian-installer.git/, but I'm
fine with snapshot.debian.org.

> +LIBDEBIAN_INSTALLER_LICENSE = GPLv2

License is GPLv2+.

> +LIBDEBIAN_INSTALLER_LICENSE_FILES = debian/copyright
> +LIBDEBIAN_INSTALLER_INSTALL_STAGING = YES
> +# Provided files are too old (missing reference to newly added source files)
> +LIBDEBIAN_INSTALLER_AUTORECONF = YES
> +LIBDEBIAN_INSTALLER_DEPENDENCIES = check host-pkgconf

Unfortunately, the following configuration doesn't build here:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBDEBIAN_INSTALLER=y
# BR2_TARGET_ROOTFS_TAR is not set

I get the following failure:

libtool: link: /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -shared  -fPIC -DPIC  .libs/exec.o .libs/hash.o .libs/log.o .libs/mem.o .libs/mem_chunk.o .libs/package.o .libs/package_parser.o .libs/packages.o .libs/packages_parser.o .libs/parser.o .libs/parser_rfc822.o .libs/slist.o .libs/string.o .libs/tree.o .libs/utils.o  -Wl,--whole-archive system/.libs/libsystem.a -Wl,--no-whole-archive   -Os -Wl,--version-script=./libdebian-installer.ver -Wl,--no-undefined-version   -Wl,-soname -Wl,libdebian-installer.so.4 -o .libs/libdebian-installer.so.4.0.7
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: di_system_subarch_analyze_guess: undefined version: LIBDI_4.7
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: failed to set dynamic section sizes: Bad value

Also, I'm concerned by a few other things:

 * The configure.ac script calls dpkg-architecture. Not only this means
   that the configure script assumes it will be run on Debian (which is
   not guaranteed in Buildroot), but it breaks when cross-compiling:
   the target architecture is not the one of the build machine.

 * In src/system/, you will see that there are a number of architecture
   specific files, which probably means that libdebian-installer is not
   going to build properly for all target architectures.

Could you investigate those issues/concerns, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
