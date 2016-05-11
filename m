From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:11:07 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <5731B8FC.8070403@zacarias.com.ar>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
 <20160509232119.668c0b36@free-electrons.com>
 <5731B8FC.8070403@zacarias.com.ar>
Message-ID: <20160511231107.1679ba7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 07:33:32 -0300, Gustavo Zacarias wrote:

> What's the failure you're seeing by dropping autoreconf/gettextize?
> On my end it seems to build just fine.

I get:

  CCLD     rrdcached
/home/test/outputs/rrdtool/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: rrd_tool.o: undefined reference to symbol 'libintl_gettext'
/home/test/outputs/rrdtool/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so.8: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

When building rrdtool 1.6.0 with autoreconf/gettextize disabled, using
the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RRDTOOL=y
# BR2_TARGET_ROOTFS_TAR is not set

built in the chroot that I use to run the autobuilder testing.

Re-adding autoreconf/gettextize fixes the problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
