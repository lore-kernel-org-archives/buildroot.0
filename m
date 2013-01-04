From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 04 Jan 2013 19:01:53 +0100
Subject: [Buildroot] [PATCH] gnuplot : new package
In-Reply-To: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
References: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <50E71911.301@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.01.2013 15:53, schrieb Anthony Viallard:
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
Tested-by: Stephan Hoffmann <sho@relinux.de>
> ---
Built and made simple functional test on beaglebone
>  package/Config.in             |    1 +
>  package/gnuplot/Config.in     |    7 +++++++
>  package/gnuplot/gnuplot.mk    |   13 +++++++++++++
>  package/gnuplot/gnuplot.patch |   26 ++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+), 0 deletion(-)
>  create mode 100644 package/gnuplot/Config.in
>  create mode 100644 package/gnuplot/gnuplot.mk
>  create mode 100644 package/gnuplot/gnuplot.patch
>
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -70,6 +70,7 @@ endif
>  source "toolchain/gcc/Config.in.2"
>  source "package/gettext/Config.in"
>  source "package/gmp/Config.in"
> +source "package/gnuplot/Config.in"
>  source "package/gperf/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/grep/Config.in"
> diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
> new file mode 100644
> index 0000000..281bb65
> --- /dev/null
> +++ b/package/gnuplot/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_GNUPLOT
> +	bool "gnuplot"
> +	help
> +	  A portable command-line driven graphing utility.
> +
> +	  http://www.gnuplot.info/
> +
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> new file mode 100644
> index 0000000..2f05624
> --- /dev/null
> +++ b/package/gnuplot/gnuplot.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# gnuplot
> +#
> +#############################################################
> +GNUPLOT_VERSION = 4.6.0
> +GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
> +GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
> +GNUPLOT_INSTALL_STAGING = YES
> +GNUPLOT_INSTALL_TARGET = YES
> +GNUPLOT_CONF_OPT = --without-x \
> +		--disable-raise-console \
> +		--disable-mouse \
> +	        --without-tutorial \
> +		--without-demo --disable-demo \
> +	        --without-row-help \
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
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
