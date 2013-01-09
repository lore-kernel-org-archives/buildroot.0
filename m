From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jan 2013 00:40:16 +0100
Subject: [Buildroot] [PATCH 1/2] gnuplot : new package
In-Reply-To: <1357577933-26446-1-git-send-email-viallard@syscom-instruments.com>
References: <1357577933-26446-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <50EDFFE0.20604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Anthony,

  Thank you for your patch. Looks good, a few remarks below.

On 01/07/13 17:58, Anthony Viallard wrote:
>
> Signed-off-by: Anthony Viallard<viallard@syscom-instruments.com>
> ---
>   package/Config.in             |    1 +
>   package/gnuplot/Config.in     |    6 ++++++
>   package/gnuplot/gnuplot.mk    |   28 ++++++++++++++++++++++++++++
>   package/gnuplot/gnuplot.patch |   26 ++++++++++++++++++++++++++
>   4 files changed, 61 insertions(+)
>   create mode 100644 package/gnuplot/Config.in
>   create mode 100644 package/gnuplot/gnuplot.mk
>   create mode 100644 package/gnuplot/gnuplot.patch
>
> diff --git a/package/Config.in b/package/Config.in
> index b312a3e..90cfb5e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -108,6 +108,7 @@ menu "Graphic libraries and applications (graphic/text)"
>
>   comment "Graphic applications"
>   source "package/rrdtool/Config.in"
> +source "package/gnuplot/Config.in"

  The menus should be sorted alphabetically, so gnuplot should come 
before rrdtool.

>
>   comment "graphic libraries"
>   source "package/directfb/Config.in"
> diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
> new file mode 100644
> index 0000000..603c194
> --- /dev/null
> +++ b/package/gnuplot/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_GNUPLOT
> +	bool "gnuplot"
> +	help
> +	  A portable command-line driven graphing utility.
> +
> +	  http://www.gnuplot.info/
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> new file mode 100644
> index 0000000..40c3021
> --- /dev/null
> +++ b/package/gnuplot/gnuplot.mk
> @@ -0,0 +1,28 @@
> +#############################################################
> +#
> +# gnuplot
> +#
> +#############################################################
> +GNUPLOT_VERSION = 4.6.0
> +GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
> +GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)

  sourceforge URLs should use the automatic mirror selection:
http://downloads.sourceforge.net/project/gnuplot/gnuplot/

> +
> +GNUPLOT_INSTALL_STAGING = YES
> +
> +GNUPLOT_LICENSE = gnuplot license (open source)
> +GNUPLOT_LICENSE_FILES = Copyright
> +
> +GNUPLOT_CONF_OPT = --without-x \
> +		--disable-raise-console \

  Why is this option set?

> +		--disable-mouse \
> +	        --without-tutorial \
> +		--without-demo --disable-demo \

  These don't exist (yet)

> +	        --without-row-help \

  Why is this option set?

> +		--disable-history-file \
> +	        --without-lisp-files \
> +	        --disable-wxwidgets \
> +	        --without-lua \
> +		--without-latex \
> +	        --without-cairo
> +
> +$(eval $(autotools-package))
> diff --git a/package/gnuplot/gnuplot.patch b/package/gnuplot/gnuplot.patch
> new file mode 100644
> index 0000000..7053a46
> --- /dev/null
> +++ b/package/gnuplot/gnuplot.patch

  Patch files should be named something like:

gnuplot-0001-disable-demo-and-tutorial.patch

but your second patch does that correctly already. I think you can safely 
merge that into a single commit.


  Regards,
  Arnout


> @@ -0,0 +1,26 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index bc0f2b2..5c00fe5 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,7 +1,7 @@
> + ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> + AUTOMAKE_OPTIONS = foreign 1.2h
> +
> +-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> ++SUBDIRS = config m4 term src $(LISPDIR) man tutorial share
> +
> + EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
> +diff --git a/Makefile.in b/Makefile.in
> +index 71118bc..86df133 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -250,7 +250,7 @@ top_build_prefix = @top_build_prefix@
> + top_builddir = @top_builddir@
> + top_srcdir = @top_srcdir@
> + AUTOMAKE_OPTIONS = foreign 1.2h
> +-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> ++SUBDIRS = config m4 term src $(LISPDIR) man tutorial share
> + EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
> + VERSION configure.vms pm3d win


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
