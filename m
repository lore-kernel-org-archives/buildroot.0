From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2011 23:51:42 +0200
Subject: [Buildroot] [PATCH] add QWT library: Qt Widgets for Technical
 Applications
In-Reply-To: <1312491761-15130-1-git-send-email-ivan.kuten@promwad.com>
References: <1312491761-15130-1-git-send-email-ivan.kuten@promwad.com>
Message-ID: <20110804235142.0c92f1af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ivan,

Thanks for this patch!

Le Fri, 5 Aug 2011 00:02:41 +0300,
Ivan Kuten <ivan.kuten@promwad.com> a ?crit :

> Hi, please consider adding QWT package to Buildroot.

This place is for the commit log, not for the contents of an e-mail. It
will persist for the eternity.

> diff --git a/package/Config.in b/package/Config.in
> index 7112e05..6f9a671 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -117,6 +117,7 @@ source "package/sdl_gfx/Config.in"
>  
>  comment "other GUIs"
>  source "package/qt/Config.in"
> +source "package/qwt/Config.in"
>  source "package/x11r7/Config.in"

I guess the package should rather be in Libraries -> Graphics

>  comment "X libraries and helper libraries"
> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> new file mode 100644
> index 0000000..5c53152
> --- /dev/null
> +++ b/package/qwt/Config.in
> @@ -0,0 +1,10 @@
> +comment "Qwt requires Qt to be installed"
> +	depends on !BR2_PACKAGE_QT
> +
> +menuconfig BR2_PACKAGE_QWT
> +	bool "Qwt"

lowercase: qwt.

> +	depends on BR2_PACKAGE_QT
> +	help
> +	  Qt Widgets for Technical Applications

I am not sure whether we should use a "depends on" or a "select"
dependency here. Normally, for dependencies on libraries, we use a
"select" dependency, but it's true that Qt is such a major choice in
the system that we may not want to have Qt automatically selected in
the back of the user.

> +	  http://qwt.sourceforge.net/
> diff --git a/package/qwt/qwt-6.0.0-disable-svg-designer.patch b/package/qwt/qwt-6.0.0-disable-svg-designer.patch
> new file mode 100644
> index 0000000..54515e0
> --- /dev/null
> +++ b/package/qwt/qwt-6.0.0-disable-svg-designer.patch

All patches need to have a proper description + Signed-off-by line.

> @@ -0,0 +1,40 @@
> +diff -urN qwt-6.0.0/qwtconfig.pri qwt-6.0.0_new/qwtconfig.pri
> +--- qwt-6.0.0/qwtconfig.pri	2011-04-15 13:51:11.000000000 +0300
> ++++ qwt-6.0.0_new/qwtconfig.pri	2011-07-26 16:33:44.063285248 +0300
> +@@ -79,7 +79,7 @@
> + # export a plot to a SVG document
> + ######################################################################
> + 
> +-QWT_CONFIG     += QwtSvg
> ++QWT_CONFIG     -= QwtSvg
> + 
> + ######################################################################
> + # You can use the MathML renderer of the Qt solutions package to 
> +@@ -98,7 +98,7 @@
> + # Otherwise you have to build it from the designer directory.
> + ######################################################################
> + 
> +-QWT_CONFIG     += QwtDesigner
> ++QWT_CONFIG     -= QwtDesigner
> + 
> + ######################################################################
> + # If you want to auto build the examples, enable the line below
> +diff -urN qwt-6.0.0/src/src.pro qwt-6.0.0_new/src/src.pro
> +--- qwt-6.0.0/src/src.pro	2011-04-15 13:51:11.000000000 +0300
> ++++ qwt-6.0.0_new/src/src.pro	2011-07-26 16:33:44.019285248 +0300
> +@@ -214,13 +214,13 @@
> + 
> + # Install directives
> + 
> +-target.path    = $${QWT_INSTALL_LIBS}
> ++target.path    = /usr/lib/
> + 
> + doc.files      = $${QWT_ROOT}/doc/html 
> + unix:doc.files += $${QWT_ROOT}/doc/man
> + doc.path       = $${QWT_INSTALL_DOCS}
> + 
> +-INSTALLS       = target doc
> ++INSTALLS       = target
> + 
> + CONFIG(lib_bundle) {
> + 
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> new file mode 100644
> index 0000000..2ac038d
> --- /dev/null
> +++ b/package/qwt/qwt.mk

This package makefile doesn't use the proper infrastructure, so it is
unsuitable for merging in the current version of Buildroot. Could you
rework it to use the GENTARGETS infrastructure, as documented at
http://buildroot.org/downloads/buildroot.html#generic-tutorial ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
