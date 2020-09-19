From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:21:40 +0200
Subject: [Buildroot] [PATCH v3] package/sentry-native: new package
In-Reply-To: <20200915210122.2146978-1-joseph.kogut@gmail.com>
References: <9c2c3a42-5b86-9579-be1d-bd31e61a6e7a@railnova.eu>
 <20200915210122.2146978-1-joseph.kogut@gmail.com>
Message-ID: <20200919232140.1e811f89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 14:01:22 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

I've applied, with some changes, see below.

> diff --git a/package/sentry-native/0001-sentry.h-include-ucontext.h.patch b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
> new file mode 100644
> index 0000000000..9505787245
> --- /dev/null
> +++ b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
> @@ -0,0 +1,27 @@
> +From 6a3b7b28f34c91c72d8b849903d93de2997b82f1 Mon Sep 17 00:00:00 2001
> +From: Joseph Kogut <joseph.kogut@gmail.com>
> +Date: Tue, 8 Sep 2020 11:40:01 -0700
> +Subject: [PATCH] sentry.h: include ucontext.h
> +
> +This is included by signal.h in newer versions of GCC, but results in an

signal.h is not from GCC, but from the C library (in this case, glibc).

> diff --git a/package/sentry-native/sentry-native.hash b/package/sentry-native/sentry-native.hash
> new file mode 100644
> index 0000000000..dffc7aeca3
> --- /dev/null
> +++ b/package/sentry-native/sentry-native.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256  a7d04fe9b9175c30a58ce20ae23b510595045a66884a447dd21ff2d0c749751b  sentry-native-0.4.1.tar.gz
> +sha256  5ef07a3d95f1f779c1597c0fbaecbb7ba242128ff0587ed1e3214c7ac6154523  LICENSE
> diff --git a/package/sentry-native/sentry-native.mk b/package/sentry-native/sentry-native.mk
> new file mode 100644
> index 0000000000..dcfdc1cee5
> --- /dev/null
> +++ b/package/sentry-native/sentry-native.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# sentry-native
> +#
> +################################################################################
> +
> +SENTRY_NATIVE_VERSION = 0.4.1
> +SENTRY_NATIVE_SITE = $(call github,getsentry,sentry-native,$(SENTRY_NATIVE_VERSION))
> +SENTRY_NATIVE_INSTALL_STAGING = YES
> +SENTRY_NATIVE_LICENSE = MIT
> +SENTRY_NATIVE_LICENSE_FILES = LICENSE
> +SENTRY_NATIVE_DEPENDENCIES = libcurl google-breakpad linux-syscall-support

sentry-native does not use linux-syscall-support directly as far as I
can see, and you were anyway not selecting this package in your
Config.in file, so I dropped this.

I've added SENTRY_NATIVE_INSTALL_STAGING = YES, because sentry-native
is essentially a library... so if you don't have it in staging, no
other package can link against it.

> +define SENTRY_NATIVE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m755 -t $(TARGET_DIR)/usr/lib/ \
> +		$(@D)/libsentry.so
> +endef

This was not needed, the default "make install" does the right thing
already, so I dropped that.

As said: applied with those various issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
