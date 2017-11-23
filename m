From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:13:04 +0100
Subject: [Buildroot] [PATCH] schedtop: new package
In-Reply-To: <1509822714-17178-1-git-send-email-sergio.prado@e-labworks.com>
References: <1509822714-17178-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171123231304.397647bc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Nov 2017 17:11:54 -0200, Sergio Prado wrote:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Thanks for this contribution! See a few comments/suggestions below.

> diff --git a/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch b/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch
> new file mode 100644
> index 000000000000..d0dc278dfb70
> --- /dev/null
> +++ b/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch
> @@ -0,0 +1,54 @@
> +From 845e74ffc0d280163b66d81df963b4c3738f9666 Mon Sep 17 00:00:00 2001
> +From: Sergio Prado <sergio.prado@e-labworks.com>
> +Date: Sun, 29 Oct 2017 13:20:10 -0200
> +Subject: [PATCH] Fix build with Boost Filesystem library V3
> +
> +In version 3 of the boost filesystem library, string() is a member of
> +path(), not directory_entry.
> +
> +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

What about using
https://github.com/ghaskins/schedtop/pull/1/commits/19d9d3d16e4731c97f1395ba2127fe48a46bb765
which does pretty much the same thing, but with additional fixes ?

> diff --git a/package/schedtop/schedtop.mk b/package/schedtop/schedtop.mk
> new file mode 100644
> index 000000000000..656e3716f26b
> --- /dev/null
> +++ b/package/schedtop/schedtop.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# schedtop
> +#
> +################################################################################
> +
> +SCHEDTOP_VERSION = 68dee649f96b3bf6db883de67f68ccc0b45cbc6e
> +SCHEDTOP_SITE = $(call github,ghaskins,schedtop,$(SCHEDTOP_VERSION))
> +SCHEDTOP_LICENSE = GPL-2.0
> +SCHEDTOP_LICENSE_FILES = COPYING
> +
> +SCHEDTOP_DEPENDENCIES = boost ncurses
> +
> +SCHEDTOP_MAKE_ENV = $(TARGET_MAKE_ENV) OBJDIR="$(@D)/obj" LIBRARIES="-lboost_system"

Why do you need to customize OBJDIR ?

The LIBRARIES change would be taken care of if a patch like
https://github.com/ghaskins/schedtop/pull/1/commits/19d9d3d16e4731c97f1395ba2127fe48a46bb765
is used.

> +# uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +SCHEDTOP_MAKE_ENV += LIBRARIES+=" -latomic"

Are you sure += in shell as the expected result ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
