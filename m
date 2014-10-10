From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 11:35:38 +0100
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5437B67A.6050700@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/10/2014 11:28 AM, Gustavo Zacarias wrote:
> Update gtk-doc.m4 infra to serial (version) 2.
> Some packages start to need/ship with the new version and can't be
> properly autoreconf'ed, like kmod 18+.
> The file was picked up from kmod-18 itself actually.
> Also add host-pkgconf to DEPENDENCIES since it's required by gtk-doc.m4
> and rather than tweak it we'd prefer to use vanilla - it's actually a
> small price in build time if we are autoreconfiguring anyway.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/automake/automake.mk |  2 +-
>   package/automake/gtk-doc.m4  | 47 ++++++++++++++++++++++++++++++++++----------
>   2 files changed, 38 insertions(+), 11 deletions(-)
>
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 8d7e291..ab17c5d 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -10,7 +10,7 @@ AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>   AUTOMAKE_LICENSE = GPLv2+
>   AUTOMAKE_LICENSE_FILES = COPYING
>
> -HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
> +HOST_AUTOMAKE_DEPENDENCIES = host-autoconf host-pkgconf
>
>   define GTK_DOC_M4_INSTALL
>    $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
> diff --git a/package/automake/gtk-doc.m4 b/package/automake/gtk-doc.m4
> index 2cfa1e7..3675543 100644
> --- a/package/automake/gtk-doc.m4
> +++ b/package/automake/gtk-doc.m4
> @@ -1,16 +1,33 @@
>   dnl -*- mode: autoconf -*-
>
> -# serial 1
> +# serial 2
>
>   dnl Usage:
>   dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
>   AC_DEFUN([GTK_DOC_CHECK],
>   [
> +  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
>     AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
>     AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
>
> +  ifelse([$1],[],[gtk_doc_requires="gtk-doc"],[gtk_doc_requires="gtk-doc >= $1"])
> +  AC_MSG_CHECKING([for gtk-doc])
> +  PKG_CHECK_EXISTS([$gtk_doc_requires],[have_gtk_doc=yes],[have_gtk_doc=no])
> +  AC_MSG_RESULT($have_gtk_doc)
> +
> +  if test "$have_gtk_doc" = "no"; then
> +      AC_MSG_WARN([
> +  You will not be able to create source packages with 'make dist'
> +  because $gtk_doc_requires is not found.])
> +  fi
> +
>     dnl check for tools we added during development
> -  AC_PATH_PROG([GTKDOC_CHECK],[gtkdoc-check])
> +  dnl Use AC_CHECK_PROG to avoid the check target using an absolute path that
> +  dnl may not be writable by the user. Currently, automake requires that the
> +  dnl test name must end in '.test'.
> +  dnl https://bugzilla.gnome.org/show_bug.cgi?id=701638
> +  AC_CHECK_PROG([GTKDOC_CHECK],[gtkdoc-check],[gtkdoc-check.test])
> +  AC_PATH_PROG([GTKDOC_CHECK_PATH],[gtkdoc-check])
>     AC_PATH_PROGS([GTKDOC_REBASE],[gtkdoc-rebase],[true])
>     AC_PATH_PROG([GTKDOC_MKPDF],[gtkdoc-mkpdf])
>
> @@ -27,17 +44,22 @@ AC_DEFUN([GTK_DOC_CHECK],
>                      [use gtk-doc to build documentation [[default=no]]]),,
>       [enable_gtk_doc=no])
>
> -  if test x$enable_gtk_doc = xyes; then
> -    ifelse([$1],[],
> -      [PKG_CHECK_EXISTS([gtk-doc],,
> -                        AC_MSG_ERROR([gtk-doc not installed and --enable-gtk-doc requested]))],
> -      [PKG_CHECK_EXISTS([gtk-doc >= $1],,
> -                        AC_MSG_ERROR([You need to have gtk-doc >= $1 installed to build $PACKAGE_NAME]))])
> -  fi
> -
>     AC_MSG_CHECKING([whether to build gtk-doc documentation])
>     AC_MSG_RESULT($enable_gtk_doc)
>
> +  if test "x$enable_gtk_doc" = "xyes" && test "$have_gtk_doc" = "no"; then
> +    AC_MSG_ERROR([
> +  You must have $gtk_doc_requires installed to build documentation for
> +  $PACKAGE_NAME. Please install gtk-doc or disable building the
> +  documentation by adding '--disable-gtk-doc' to '[$]0'.])
> +  fi
> +
> +  dnl don't check for glib if we build glib
> +  if test "x$PACKAGE_NAME" != "xglib"; then
> +    dnl don't fail if someone does not have glib
> +    PKG_CHECK_MODULES(GTKDOC_DEPS, glib-2.0 >= 2.10.0 gobject-2.0  >= 2.10.0,,[:])
> +  fi
> +
>     dnl enable/disable output formats
>     AC_ARG_ENABLE([gtk-doc-html],
>       AS_HELP_STRING([--enable-gtk-doc-html],
> @@ -52,7 +74,12 @@ AC_DEFUN([GTK_DOC_CHECK],
>       enable_gtk_doc_pdf=no
>     fi
>
> +  if test -z "$AM_DEFAULT_VERBOSITY"; then
> +    AM_DEFAULT_VERBOSITY=1
> +  fi
> +  AC_SUBST([AM_DEFAULT_VERBOSITY])
>
> +  AM_CONDITIONAL([HAVE_GTK_DOC], [test x$have_gtk_doc = xyes])
>     AM_CONDITIONAL([ENABLE_GTK_DOC], [test x$enable_gtk_doc = xyes])
>     AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [test x$enable_gtk_doc_html = xyes])
>     AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [test x$enable_gtk_doc_pdf = xyes])
>

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
