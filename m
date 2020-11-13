From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Nov 2020 21:00:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: disable -Werror
Message-ID: <20201113200039.519577-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5c17226f12eba104d907693ec37fc101cc6d447f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Add-an-option-to-disable-Werror.patch | 55 +++++++++++++++++++
 package/libpam-tacplus/libpam-tacplus.mk      |  3 +
 2 files changed, 58 insertions(+)
 create mode 100644 package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch

diff --git a/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch b/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
new file mode 100644
index 0000000000..80da2f35b4
--- /dev/null
+++ b/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
@@ -0,0 +1,55 @@
+From 88c78901503d50d0a62d85c96994ca4d67ab61e0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 13 Nov 2020 20:50:27 +0100
+Subject: [PATCH] Add an option to disable -Werror
+
+Allow the user to disable -Werror to avoid the following build failure
+with gcc 4.8:
+
+libtac/lib/magic.c:138:13: error: ignoring return value of 'read', declared with attribute warn_unused_result [-Werror=unused-result]
+             (void) read(rfd, &seed, sizeof(seed));
+             ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5c17226f12eba104d907693ec37fc101cc6d447f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 3 +++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0be3cdb..4a137e9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,7 +8,11 @@
+ 
+ ACLOCAL_AMFLAGS = -I config
+ AUTOMAKE_OPTIONS = subdir-objects
+-AM_CFLAGS = -Wall -Wextra -Werror
++AM_CFLAGS = -Wall -Wextra
++
++if ENABLE_WERROR
++AM_CFLAGS += -Werror
++endif
+ 
+ if TACC
+ bin_PROGRAMS = tacc
+diff --git a/configure.ac b/configure.ac
+index d0c5eba..dd8a966 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,6 +100,9 @@ AC_SUBST(pamdir)
+ AC_ARG_ENABLE(doc, AS_HELP_STRING([--disable-doc], [do not build docs]))
+ AM_CONDITIONAL(DOC, test "x$enable_doc" != "xno")
+ 
++AC_ARG_ENABLE(werror, AS_HELP_STRING([--disable-werror], [do not build with -Werror]))
++AM_CONDITIONAL(ENABLE_WERROR, test "x$enable_werror" != "xno")
++
+ dnl --------------------------------------------------------------------
+ dnl Switch for run-time debugging
+ AC_ARG_ENABLE(runtime-debugging, [AS_HELP_STRING([--enable-runtime-debugging],
+-- 
+2.28.0
+
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 4e1f8bd173..9dd8466bf2 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -14,7 +14,10 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
 # Fetching from github, we need to generate the configure script
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
 
 $(eval $(autotools-package))
-- 
2.28.0
