From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:21:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version
 1.20
In-Reply-To: <1449437176-30596-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449437176-30596-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151213162117.0720e354@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun,  6 Dec 2015 22:26:16 +0100, J?rg Krause wrote:

> -LIBGPG_ERROR_VERSION = 1.12
> +LIBGPG_ERROR_VERSION = 1.20
>  LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
>  LIBGPG_ERROR_LICENSE = LGPLv2.1+
>  LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
>  LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
> -# we patch src/Makefile.am
> -LIBGPG_ERROR_AUTORECONF = YES
>  LIBGPG_ERROR_GETTEXTIZE = YES

The GETTEXTIZE = YES was added together with AUTORECONF = YES when the
gcc5 compatibility patch was added. So I believe it is probably no
longer needed.

> +# libgpg-error needs to figure out some platform specific properties. The
> +# detection is done during build time, by setting the proper --host value.
> +# To match any of the platform specific syscfg files we must replace the
> +# toolchain's vendor name to 'unknown'.
> +# Note we are overriding the host value set by the autotools package
> +# infrastructure.
> +LIBGPG_ERROR_CONF_OPTS += \
> +	--host=$(subst $(TARGET_VENDOR),unknown,$(GNU_TARGET_NAME))

Unfortunately, this clearly doesn't work well. Since there is no
uclibcgnueabi file, libgpg-error fails to build with uClibc with this
update. It will also fail to build with musl. Basically, with your
bump, libgpg-error will only build on the following platforms:

lock-obj-pub.aarch64-unknown-linux-gnu.h
lock-obj-pub.alpha-unknown-linux-gnu.h
lock-obj-pub.arm-unknown-linux-androideabi.h
lock-obj-pub.arm-unknown-linux-gnueabi.h
lock-obj-pub.arm-unknown-linux-gnueabihf.h
lock-obj-pub.hppa-unknown-linux-gnu.h
lock-obj-pub.i686-pc-linux-gnu.h
lock-obj-pub.m68k-unknown-linux-gnu.h
lock-obj-pub.mips64el-unknown-linux-gnuabi64.h
lock-obj-pub.mipsel-unknown-linux-gnu.h
lock-obj-pub.mips-unknown-linux-gnu.h
lock-obj-pub.or1k-unknown-linux-gnu.h
lock-obj-pub.powerpc64le-unknown-linux-gnu.h
lock-obj-pub.powerpc64-unknown-linux-gnu.h
lock-obj-pub.powerpc-unknown-linux-gnu.h
lock-obj-pub.s390x-ibm-linux-gnu.h
lock-obj-pub.sh4-unknown-linux-gnu.h
lock-obj-pub.sparc64-unknown-linux-gnu.h
lock-obj-pub.sparc-unknown-linux-gnu.h
lock-obj-pub.x86_64-pc-linux-gnu.h
lock-obj-pub.x86_64-pc-linux-gnux32.h

I believe this problem should be reported upstream, as it is a bit
silly to be forced to use the "unknown" vendor tuple, and to have lost
compatibility with uclibc, musl, and many other architecture / variants.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
