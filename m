From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Dec 2012 14:28:38 +0100
Subject: [Buildroot] [PATCH] fluxbox: fix build against imlib2
In-Reply-To: <1355077123-5948-2-git-send-email-s.martin49@gmail.com>
References: <1355077123-5948-1-git-send-email-s.martin49@gmail.com>
 <1355077123-5948-2-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMM+9EmA_XtMnHKZDszMRYEk8dnTWKo74VMVgkDZ5Z1QSTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

2012/12/9 Samuel Martin <s.martin49@gmail.com>:
> * fix configure.in to take care of the given imlib2-prefix
> * disable imlib2 support if imlib2 is not part of the selection
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/fluxbox/fluxbox-1.3.2-fix-configure.patch | 19 +++++++++++++++++++
>  package/fluxbox/fluxbox.mk                        | 10 +++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 package/fluxbox/fluxbox-1.3.2-fix-configure.patch
>
> diff --git a/package/fluxbox/fluxbox-1.3.2-fix-configure.patch b/package/fluxbox/fluxbox-1.3.2-fix-configure.patch
> new file mode 100644
> index 0000000..2cb8273
> --- /dev/null
> +++ b/package/fluxbox/fluxbox-1.3.2-fix-configure.patch
> @@ -0,0 +1,19 @@
> +Avoid to call the imlib2-config that may be installed on the host system
> +(even when --with-imlib2-prefix or --with-imlib2-exec-prefix is passed to
> +the configure script), which totally screws up the resulting linker flags.
> +
> +Inspired by: http://git.fluxbox.org/fluxbox.git/commit/?id=b178bed60b5bd8b2c9ed0cbc67fd729ff3820589
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +--- fluxbox-1.3.2.orig/configure.in    2012-10-21 16:11:59.445749396 +0200
> ++++ fluxbox-1.3.2/configure.in 2012-10-21 16:35:27.658390856 +0200
> +@@ -443,8 +443,6 @@ if test x$enable_imlib2 = "xyes"; then
> +       [
> +          IMLIB2=true
> +          AC_DEFINE(HAVE_IMLIB2, [], [Imlib2 support])
> +-         IMLIB2_LIBS=`imlib2-config --libs`
> +-         IMLIB2_CFLAGS=`imlib2-config --cflags`
> +          LIBS="$LIBS $IMLIB2_LIBS"
> +          CXXFLAGS="$CXXFLAGS $IMLIB2_CFLAGS"
> +        ], [ AC_MSG_RESULT(no)]
> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
> index 356c5a2..04ffb91 100644
> --- a/package/fluxbox/fluxbox.mk
> +++ b/package/fluxbox/fluxbox.mk
> @@ -10,11 +10,19 @@ FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBO
>  FLUXBOX_LICENSE = MIT
>  FLUXBOX_LICENSE_FILES = COPYING
>
> +FLUXBOX_AUTORECONF = YES
> +
>  FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
>                    --x-libraries=$(STAGING_DIR)/usr/lib
> -
>  FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>
> +ifeq ($(BR2_PACKAGE_IMLIB2),y)
> +FLUXBOX_CONF_OPT += --enable-imlib2 --with-imlib2-prefix=$(STAGING_DIR)/usr
> +FLUXBOX_DEPENDENCIES += imlib2
> +else
> +FLUXBOX_CONF_OPT += --disable-imlib2
> +endif
> +
>  define FLUXBOX_INSTALL_XSESSION_FILE
>         [ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
>                 package/fluxbox/xsession $(TARGET_DIR)/root/.xsession
> --
> 1.8.0.1
>



-- 
Sam
