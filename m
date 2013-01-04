From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 16:15:49 +0100
Subject: [Buildroot] [PATCH] gnuplot : new package
In-Reply-To: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
References: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20130104161549.718b1c19@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anthony Viallard,

Thanks for submitting this package. It looks almost good.

On Fri,  4 Jan 2013 15:53:13 +0100, Anthony Viallard wrote:
> 
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> ---
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

Hum, why in "Development tools" ? Maybe Graphic libraries and
applications would make more sense here ?

> +GNUPLOT_VERSION = 4.6.0
> +GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
> +GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
> +GNUPLOT_INSTALL_STAGING = YES
> +GNUPLOT_INSTALL_TARGET = YES

This line is not needed.

Please also add the GNUPLOT_LICENSE and GNUPLOT_LICENSE_FILES variables.

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

All patches in Buildroot should have a description and a Signed-off-by
line. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

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

Could you cook a patch for upstream gnuplot that adds a
--{enable,disable}-demo to enable/disable the build of the demos, so
that ultimately we can drop your patch? This is not mandatory to get
your package in Buildroot, but would be nice to have.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
