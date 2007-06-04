From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 4 Jun 2007 17:29:57 +0200
Subject: [Buildroot] Soft float toolchain on ARM
In-Reply-To: <000601c7a6ba$0bd959b0$016efea9@SDW>
References: <46631CAE.4090305@lambsys.com> <000601c7a6ba$0bd959b0$016efea9@SDW>
Message-ID: <20070604152957.GA19514@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-04 11:07 -0400 schrieb Stuart Wood:

> using soft-float. Does anyone have the magic combination of versions for
> uClibc, gcc, etc. that provide a stable working toolchain?

Works fine here, EABI:

BR2_ARM_TYPE="GENERIC_ARM"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_KERNEL_HEADERS_2_6_20=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.20"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_17=y
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_1_2=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
BR2_GCC_SHARED_LIBGCC=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

with

diff -urN gcc-4.1.1/gcc/config/arm/linux-eabi.h gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h
--- gcc-4.1.1/gcc/config/arm/linux-eabi.h       2006-10-22 11:11:49.000000000 -0700
+++ gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h      2006-10-24 21:34:01.000000000 -0700
@@ -45,7 +45,7 @@
    The ARM10TDMI core is the default for armv5t, so set
    SUBTARGET_CPU_DEFAULT to achieve this.  */
 #undef SUBTARGET_CPU_DEFAULT
-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi

 #undef SUBTARGET_EXTRA_LINK_SPEC
 #define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"

applied.

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
