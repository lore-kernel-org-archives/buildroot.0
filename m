From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Dec 2016 16:58:51 +0100
Subject: [Buildroot] [PATCH] [ABO-fix] package/systemd-bootchart: bump
	version
In-Reply-To: <1483197358-27262-1-git-send-email-yann.morin.1998@free.fr>
References: <1483197358-27262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivwTpvLt8JnjqgpWhssY-qeUs41UNKqhJEeD7Z2Jm7fbeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, everyone,

On Sat, Dec 31, 2016 at 4:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Get rid of our patch, applied upstream.
>
> Fixes:
>     http://autobuild.buildroot.net/results/696/696254009f830134ef9398369ca2cbb257b33f52/
>     http://autobuild.buildroot.org/results/aca/aca210de7d3f2eda54e5630206e9ff80d72d85c5/
>     http://autobuild.buildroot.org/results/e5d/e5df8d11bfce4ba7a4c5c760b4784c31c506d8d4/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  ...onfigure-add-option-to-not-build-manpages.patch | 59 ----------------------
>  package/systemd-bootchart/systemd-bootchart.hash   |  2 +-
>  package/systemd-bootchart/systemd-bootchart.mk     |  9 +---
>  3 files changed, 3 insertions(+), 67 deletions(-)
>  delete mode 100644 package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
>
> diff --git a/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch b/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
> deleted file mode 100644
> index ea9f8f2..0000000
> --- a/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 60a581253331ac38721a12495909d073eff703b7 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sat, 13 Aug 2016 18:47:17 +0200
> -Subject: [PATCH] configure: add option to not build manpages
> -
> -Man pages are not always needed, especially on embedded systems.
> -
> -Add a configure option to not build them; by default, build them.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ----
> -Patch sent upstream:
> -    https://github.com/systemd/systemd-bootchart/pull/14
> ----
> - Makefile.am  |  5 ++++-
> - configure.ac | 10 +++++++++-
> - 2 files changed, 13 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index a71f8d8..e6510d5 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -74,7 +74,10 @@ EXTRA_DIST = \
> - MANPAGES = man/bootchart.conf.5 man/systemd-bootchart.1
> - MANPAGES_ALIAS = man/bootchart.conf.d.5
> -
> --man_MANS = $(MANPAGES) $(MANPAGES_ALIAS)
> -+if COND_man
> -+MAYBE_MANPAGES = $(MANPAGES) $(MANPAGES_ALIAS)
> -+endif
> -+man_MANS = $(MAYBE_MANPAGES)
> -
> - man/bootchart.conf.d.5: man/bootchart.conf.5
> -
> -diff --git a/configure.ac b/configure.ac
> -index f8e62d8..90e8b03 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -167,8 +167,16 @@ AC_ARG_WITH([rootlibdir],
> - AC_SUBST([rootprefix], [$with_rootprefix])
> - AC_SUBST([rootlibdir], [$with_rootlibdir])
> -
> -+AC_ARG_ENABLE([man],
> -+        AS_HELP_STRING([--diable-man],[Build the man pages (default: yes)]),
> -+        [build_man=$enableval],
> -+        [build_man=yes])
> -+
> - AC_PATH_PROG([XSLTPROC], [xsltproc])
> --AS_IF([test -z "$XSLTPROC"], AC_MSG_ERROR([*** xsltproc is required for man pages]))
> -+AS_IF([test -z "$XSLTPROC" -a "$build_man" = "yes"],
> -+                [AC_MSG_ERROR([*** xsltproc is required for man pages])])
> -+
> -+AM_CONDITIONAL([COND_man],[test "$build_man" = "yes"])
> -
> - AC_CONFIG_FILES([
> -         Makefile
> ---
> -2.7.4
> -
> diff --git a/package/systemd-bootchart/systemd-bootchart.hash b/package/systemd-bootchart/systemd-bootchart.hash
> index c347ef5..2d2175a 100644
> --- a/package/systemd-bootchart/systemd-bootchart.hash
> +++ b/package/systemd-bootchart/systemd-bootchart.hash
> @@ -1,2 +1,2 @@
>  # sha256 locally computed
> -sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
> +sha256 1ef7b4f440bf53aced26979cf8153482840699c556700671eb5dadb4222c70bd systemd-bootchart-231.tar.xz
> diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
> index 354270e..34ecd30 100644
> --- a/package/systemd-bootchart/systemd-bootchart.mk
> +++ b/package/systemd-bootchart/systemd-bootchart.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -SYSTEMD_BOOTCHART_VERSION = 230
> +SYSTEMD_BOOTCHART_VERSION = 231
>  SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
>  # Do not use the github helper here, the generated tarball is *NOT* the same
>  # as the one uploaded by upstream for the release.
> @@ -14,12 +14,7 @@ SYSTEMD_BOOTCHART_LICENSE_FILES = LICENSE.LGPL2.1
>  SYSTEMD_BOOTCHART_DEPENDENCIES = host-intltool systemd
>
>  # 0001-configure-add-option-to-not-build-manpages.patch
> -SYSTEMD_BOOTCHART_AUTORECONF = YES
> +#SYSTEMD_BOOTCHART_AUTORECONF = YES
Maybe I missed some intents or something but why is this line
commented ? (and more importantly, kept :))
>  SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
>
> -define SYSTEMD_BOOTCHART_INTLTOOLIZE
> -       cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
> -endef
> -SYSTEMD_BOOTCHART_PRE_CONFIGURE_HOOKS = SYSTEMD_BOOTCHART_INTLTOOLIZE
> -
>  $(eval $(autotools-package))
> --
> 2.7.4
>
