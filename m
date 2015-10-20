From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 20 Oct 2015 19:40:55 -0300
Subject: [Buildroot] [PATCH] libglib2: disable tests and update configure
	options
Message-ID: <1445380855-31482-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Sometimes if host-python is around it doesn't work too well with the
distro python (Gentoo, FC20 at least) leading to build failures.

This failure is very hard to trigger, it's normally easier to do so by
enabling top-level parallel builds.

Fixes:
http://autobuild.buildroot.net/results/0f8/0f881e322b7f9d244b8dd2440ba0afd3a8418027/

While at it update the configure options to avoid any host
libraries/tools from leaking in, new naming conventions and options.
And remove dead code dealing with the nothreaded variant.

Signed-off-by: Gustavo Zacarias <gustavozacarias@free-electrons.com>
---
 package/libglib2/0002-disable-tests.patch | 43 +++++++++++++++++++++++++++++++
 package/libglib2/libglib2.mk              | 12 ++++-----
 2 files changed, 48 insertions(+), 7 deletions(-)
 create mode 100644 package/libglib2/0002-disable-tests.patch

diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
new file mode 100644
index 0000000..7bf4bb6
--- /dev/null
+++ b/package/libglib2/0002-disable-tests.patch
@@ -0,0 +1,43 @@
+Disable tests, some of them need python and sometimes host-python
+gets mixed with distro python leading to build failures.
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff -Nura glib-2.46.1.orig/gio/Makefile.am glib-2.46.1/gio/Makefile.am
+--- glib-2.46.1.orig/gio/Makefile.am	2015-10-20 16:59:03.042212468 -0300
++++ glib-2.46.1/gio/Makefile.am	2015-10-20 17:32:26.763146133 -0300
+@@ -233,7 +233,7 @@
+ platform_deps += win32/libgiowin32.la
+ endif
+ 
+-SUBDIRS += . tests
++SUBDIRS += .
+ 
+ if HAVE_FAM
+ SUBDIRS += fam
+diff -Nura glib-2.46.1.orig/glib/Makefile.am glib-2.46.1/glib/Makefile.am
+--- glib-2.46.1.orig/glib/Makefile.am	2015-10-20 16:59:03.066213318 -0300
++++ glib-2.46.1/glib/Makefile.am	2015-10-20 17:33:23.537155988 -0300
+@@ -33,8 +33,8 @@
+ MAYBE_PCRE = pcre 
+ endif
+ 
+-SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . tests
+-DIST_SUBDIRS = libcharset gnulib pcre update-pcre tests
++SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre .
++DIST_SUBDIRS = libcharset gnulib pcre update-pcre
+ 
+ AM_CPPFLAGS = 				\
+ 	$(glib_INCLUDES) 		\
+diff -Nura glib-2.46.1.orig/Makefile.am glib-2.46.1/Makefile.am
+--- glib-2.46.1.orig/Makefile.am	2015-10-20 16:59:03.003211087 -0300
++++ glib-2.46.1/Makefile.am	2015-10-20 17:32:20.923939420 -0300
+@@ -6,7 +6,7 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
+ 
+-SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
++SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
+ DIST_SUBDIRS = $(SUBDIRS) build
+ 
+ bin_SCRIPTS = glib-gettextize
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f9fbade..8f6ca83 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -86,15 +86,13 @@ LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
+	--disable-coverage \
 	--disable-dtrace \
+	--disable-fam \
+	--disable-libelf \
+	--disable-selinux \
 	--disable-systemtap \
-	--disable-gcov \
-	--disable-modular-tests
-
-LIBGLIB2_CONF_OPTS += --disable-modular-tests
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-LIBGLIB2_CONF_OPTS += --with-threads=none --disable-threads
-endif
+	--disable-xattr
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
 
-- 
2.4.10
