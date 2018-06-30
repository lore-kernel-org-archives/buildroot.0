From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Jun 2018 12:57:33 +0200
Subject: [Buildroot] [PATCH 1/3] systemd: bump to v239
In-Reply-To: <20180629222552.12808-2-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-2-jeremy.rosen@smile.fr>
Message-ID: <b946d2bb-6515-49a8-9610-104a55c2db44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my,

Le 30/06/2018 ? 00:25, J?r?my Rosen a ?crit?:
> * remove upstreamed patches
> * refresh patch 0002 which didn't apply cleanly
> * update patch 0001 to catch more uses of agetty

I believe the patch 0003-fix-am-path-libgcrypt-no-found.patch is not needed
anymore since systemd now use meson. It's not related to this patch though, it
should have been removed while switching to meson build system.

> 
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/0001-fix-getty-unit.patch     |  61 ++++--
>  .../0002-install-don-t-use-ln-relative.patch  |  19 +-
>  ...-include-libmount-h-in-a-header-file.patch |  75 -------
>  .../0005-basic-macros-rename-noreturn.patch   | 201 ------------------
>  package/systemd/systemd.hash                  |   2 +-
>  package/systemd/systemd.mk                    |   2 +-
>  6 files changed, 63 insertions(+), 297 deletions(-)
>  delete mode 100644 package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
>  delete mode 100644 package/systemd/0005-basic-macros-rename-noreturn.patch
> 
> diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
> index b6947626c5..4716679844 100644
> --- a/package/systemd/0001-fix-getty-unit.patch
> +++ b/package/systemd/0001-fix-getty-unit.patch
> @@ -1,21 +1,58 @@
> -From 7deb6387aeb07fa4300fa3cf9d6c039dabd120d7 Mon Sep 17 00:00:00 2001
> -From: Maxime Ripard <maxime.ripard@free-electrons.com>
> -Date: Mon, 31 Jul 2017 10:08:46 -0400
> -Subject: [PATCH] fix-getty-unit
> -
> -Prefer getty to agetty in console setup systemd units
> +From 58dba37de7a2cd6e353f1ada97f1f3bc85ebf87b Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@enst-bretagne.fr>

Please, keep authorship of the patch even if you rebase it on a new systemd version.

> +Date: Fri, 22 Jun 2018 11:19:07 +0200
> +Subject: [PATCH 1/3] Prefer getty to agetty in console setup systemd units

Use -N with git format-patch to omit patch numbers from the subject.
Patches present in the systemd package directory can be removed/added separately.

> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
>  
>  Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>  [aduskett at gmail.com: Update for systemd v237]
>  Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[jeremy.rosen at smile.fr: Update for systemd v238]
> +Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>  ---

[...]

> diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
> index 61a139e2a2..ce3f183537 100644
> --- a/package/systemd/0002-install-don-t-use-ln-relative.patch
> +++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
> @@ -1,7 +1,10 @@
> -From 17560d52e9ec0afebbfe31e694870c6433b36f60 Mon Sep 17 00:00:00 2001
> +From f8757e2d9c7c76c5ec0eaeab4a90b8bd663d6956 Mon Sep 17 00:00:00 2001
>  From: Adam Duskett <Adamduskett@outlook.com>
>  Date: Sun, 31 Dec 2017 12:46:04 -0500
> -Subject: [PATCH] install: don't use ln --relative
> +Subject: [PATCH 2/3] install: don't use ln --relative

Use git format-patch -N

> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
>  
>  Oldish enterprise-class distributions have too old versions of
>  coreutils, with ln not supporting --relative.
> @@ -23,6 +26,8 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>  [tpiepho at impinj.com: Fix add-wants wrapper]
>  Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> +[jeremy.rosen at smile.fr: Update for systemd v239]
> +Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>  ---

[...]

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 82d0e1a027..16c9d9f290 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 237
> +SYSTEMD_VERSION = 239
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))

As you noticed, there is another systemd repository containing an "upstream
maintained stable systemd version" for each release [1].
Do we want to keep the official systemd release + Buildroot patches or sync to
the systemd stable branch when needed.

[1] https://github.com/systemd/systemd-stable

Best regards,
Romain

>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> 
