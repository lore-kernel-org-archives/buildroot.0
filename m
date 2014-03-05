From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 07:23:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] imagemagick: disable documentation
In-Reply-To: <1393796026-21985-1-git-send-email-romain.naour@openwide.fr>
References: <1393796026-21985-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5316C2DD.5070507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/14 22:33, Romain Naour wrote:
> Add --disable-docs option in the configure script.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: Add an option in configure script
>     instead of patching the Makefile (Arnout)
>     upstream status: it's not sent yet
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...gick-02-configure-Add-disable-docs-option.patch | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 package/imagemagick/imagemagick-02-configure-Add-disable-docs-option.patch
> 
> diff --git a/package/imagemagick/imagemagick-02-configure-Add-disable-docs-option.patch b/package/imagemagick/imagemagick-02-configure-Add-disable-docs-option.patch
> new file mode 100644
> index 0000000..2febccd
> --- /dev/null
> +++ b/package/imagemagick/imagemagick-02-configure-Add-disable-docs-option.patch
> @@ -0,0 +1,77 @@
> +The manual and html data are unconditionally installed on target.
> +Some users may only want the executable.
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + Makefile.am  | 16 ++++++++++++++--
> + configure.ac |  8 ++++++++
> + 2 files changed, 22 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index c74a870..f2fa4e0 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -156,19 +156,25 @@ pkgconfig_DATA = \
> + %- at MAGICK_MAJOR_VERSION@. at MAGICK_ABI_SUFFIX@.pc: %.pc
> + 	cp -f $^ $@
> + 
> ++# Architecture independent data files installed in the package's data directory
> ++docdir = $(DOCUMENTATION_PATH)
> ++
> + # Manual pages to install
> ++if INSTALL_DOC
> + man_MANS = \
> + 	$(MAGICK_MANS) \
> + 	$(WAND_MANS) \
> + 	$(MAGICKPP_MANS) \
> + 	$(UTILITIES_MANS)
> + 
> +-# Architecture independent data files installed in the package's data directory
> +-docdir = $(DOCUMENTATION_PATH)
> + doc_DATA = \
> + 	LICENSE \
> + 	ChangeLog \
> + 	NEWS.txt
> ++else
> ++man_MANS =
> ++doc_DATA =

 I believe the else is unnecessary, no?

> ++endif
> + 
> + if MAINTAINER_MODE
> + MAINTAINER_TARGETS = \
> +@@ -236,7 +242,13 @@ pkgdocdir = $(DOCUMENTATION_PATH)
> + DOCDIRSDOXYGEN = www/api/MagickCore www/api/MagickWand
> + DOCDIRSMANUAL = images images/patterns www www/api www/source www/Magick++
> + DOCDIRS= $(DOCDIRSMANUAL) $(DOCDIRSDOXYGEN)
> ++
> ++if INSTALL_DOC
> + HTML_INSTALL_DATA_TARGETS = install-data-html
> ++else !INSTALL_DOC
> ++HTML_INSTALL_DATA_TARGETS =
> ++endif !INSTALL_DOC
> ++
> + install-data-html:
> + 	$(mkinstalldirs) $(DESTDIR)$(pkgdocdir)
> + 	$(INSTALL_DATA) $(srcdir)/index.html $(DESTDIR)$(pkgdocdir)
> +diff --git a/configure.ac b/configure.ac
> +index 445bccf..a2b5d0e 100755
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3173,6 +3173,14 @@ esac
> + AC_DEFINE_UNQUOTED(DOCUMENTATION_PATH,"$DEFINE_DOCUMENTATION_PATH",[Directory where ImageMagick documents live.])
> + AC_SUBST(DOCUMENTATION_PATH)
> + 
> ++#
> ++# Enable/Disable documentation
> ++AC_ARG_ENABLE([docs],
> ++  [AS_HELP_STRING([--disable-docs],
> ++    [disable building of documentation])],
> ++  wantdocs=$enableval, wantdocs=detect)

 I think the wantdocs=detect is unneeded (there is no autodetection
possible here...).


 Regards,
 Arnout

> ++AM_CONDITIONAL([INSTALL_DOC], [test "$wantdocs" = "xyes"])
> ++
> + # Subdirectory to place architecture-dependent configuration files
> + CONFIGURE_RELATIVE_PATH="${PACKAGE_NAME}-${MAGICK_MAJOR_VERSION}"
> + AC_DEFINE_UNQUOTED(CONFIGURE_RELATIVE_PATH,"$CONFIGURE_RELATIVE_PATH",[Subdirectory of lib where architecture-dependent configuration files live.])
> +-- 
> +1.8.5.3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
