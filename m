From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:38:50 +0100
Subject: [Buildroot] [PATCH v2] Bump libxmlrpc to version 1.39.10
In-Reply-To: <1478851086-19073-1-git-send-email-alvaro.gamez@hazent.com>
References: <20161102232646.69bfff3d@free-electrons.com>
 <1478851086-19073-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20161111153850.20bb010f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title of the commit is still not correct, it should be:

	libxmlrpc: bump to 1.39.10

But there are more issues, see below.

On Fri, 11 Nov 2016 08:58:06 +0100, Alvaro G. M wrote:
> Previous version patches are still needed, but they have been upgraded to apply cleanly.
> 
> Bumped version fixes compilation issue on some architectures (arm, microblaze).
> 
> Fixes:
> http://autobuild.buildroot.net/results/c45530f34bf2074bd204c485615124df928f246c

This problem has already been fixed more than two month ago, by commit
aa9fde1c459dbc20b268694eafd7a1d3341dbf76.

In addition, your patch does not work: you have created it on an old
version of Buildroot, which predates commit
aa9fde1c459dbc20b268694eafd7a1d3341dbf76. And therefore, the patch
added in aa9fde1c459dbc20b268694eafd7a1d3341dbf76 no longer applies
(and probably should be removed).

Unfortunately, even after doing this, it still doesn't build with the
following error:

arm-buildroot-linux-gnueabihf-ar cru libxmlrpc_util.a asprintf.o base64.o error.o lock_platform.o lock_pthread.o lock_none.o make_printable.o memblock.o select.o sleep.o string_number.o time.o utf8.o
/bin/bash: arm-buildroot-linux-gnueabihf-ar: command not found
/home/thomas/projets/buildroot/output/build/libxmlrpc-1.39.10/common.mk:112: recipe for target 'libxmlrpc_util.a' failed

Could you please rebase your patch on top of the current next branch,
and test it with the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2016.08-613-ge98b4dd.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBXMLRPC=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
