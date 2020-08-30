From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 30 Aug 2020 17:27:43 +0200
Subject: [Buildroot] [PATCH] package/mg: new package
In-Reply-To: <20200830090050.889647-1-troglobit@gmail.com>
References: <20200830090050.889647-1-troglobit@gmail.com>
Message-ID: <CAKcgs2wo8X9Z6Veso26QK8GAkKUPdA19TUarOvsmmMTdjXwaCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joachim,

thanks for your contribution.
Please find a few comments below.

Le dim. 30 ao?t 2020 ? 11:01, Joachim Wiberg <troglobit@gmail.com> a ?crit :
>
> Mg is a small Emacs-like editor with no external dependencies except a
> standard C library.  It weighs in at 130 kiB and is one of a select few
> completely free (public domain) text editors suitable for small and
> embedded systems.
>
> This version is based on the OpenBSD Mg, but with more features, one of
> which being the no-ncurses/termcap support, which heavily reduces the
> impact on a resource constrained system.
>
> Upstream: https://github.com/troglobit/mg/
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/Config.in    |  1 +
>  package/mg/Config.in | 18 ++++++++++++++++++
>  package/mg/mg.hash   |  5 +++++
>  package/mg/mg.mk     | 24 ++++++++++++++++++++++++
>  4 files changed, 48 insertions(+)
>  create mode 100644 package/mg/Config.in
>  create mode 100644 package/mg/mg.hash
>  create mode 100644 package/mg/mg.mk
>
You need to add an entry to the DEVELOPERS file with your name and
package, so that you are identified as the maintainer for this
package. Please take a look at the DEVELOPERS file.

> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..db2563f789 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2431,6 +2431,7 @@ menu "Text editors and viewers"
>         source "package/joe/Config.in"
>         source "package/less/Config.in"
>         source "package/mc/Config.in"
> +       source "package/mg/Config.in"
>         source "package/most/Config.in"
>         source "package/nano/Config.in"
>         source "package/uemacs/Config.in"
> diff --git a/package/mg/Config.in b/package/mg/Config.in
> new file mode 100644
> index 0000000000..11e5bdb273
> --- /dev/null
> +++ b/package/mg/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_MG
> +       bool "mg"
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         Emacs-like text editor (130 kiB)
> +
> +         Mg is a MicroEMACS clone with the goal of being compatible
> +         with GNU Emacs, because there should never be any reason to
> +         learn more than one Emacs flavor.
> +
> +         Unlike many other editors it does not require ncurses, only a
> +         standard C library, making it suitable for really small and
> +         embedded systems.
> +
> +         This version is based on mg2a from OpenBSD, with more features
> +         and, in particular, no requirement on ncurses or termcap.
> +
> +         https://github.com/troglobit/mg/
> diff --git a/package/mg/mg.hash b/package/mg/mg.hash
> new file mode 100644
> index 0000000000..6b3c400faa
> --- /dev/null
> +++ b/package/mg/mg.hash
> @@ -0,0 +1,5 @@
> +# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
I assume you meant: "from:
https://github.com/troglobit/mg/releases/download/v3.4/mg-3.4.tar.gz.md5"

> +md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
It should be two spaces after "md5"

> +# Locally computed:
> +sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
> +sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
For the two lines above, it should be two spaces after "sha256"

> diff --git a/package/mg/mg.mk b/package/mg/mg.mk
> new file mode 100644
> index 0000000000..c8df6eddc6
> --- /dev/null
> +++ b/package/mg/mg.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# mg2a
> +#
> +################################################################################
> +
> +MG_VERSION = 3.4
> +MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
> +MG_LICENSE = Public Domain
> +MG_LICENSE_FILES = UNLICENSE
> +
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +MG_DEPENDENCIES += ncurses
We prefer to force the options, so you should have a "MG_CONF_OPTS =
--with-curses" here

> +else
> +MG_CONF_OPTS += --without-curses
> +endif
> +
> +define MG_INSTALL_TARGET_CMDS
> +       $(INSTALL) -m 0755 -D $(@D)/tutorial $(TARGET_DIR)/usr/share/doc/tutorial
> +       gzip -9 $(TARGET_DIR)/usr/share/doc/tutorial
We prefer not to install documentation on the target to keep the
footprint small. Can you please remove the two lines above?

> +       $(INSTALL) -m 0755 -D $(@D)/src/mg $(TARGET_DIR)/usr/bin/mg
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
One last comment: did you run the the test-pkg script to check for any
potential issues with some architectures and build options?

Can you please send a v2 with the fixes proposed above?

thanks
Gilles.
