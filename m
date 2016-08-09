From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Aug 2016 17:49:36 -0300
Subject: [Buildroot] [PATCH] libtasn1: add upstream build fix patch
Message-ID: <1470775776-18685-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Under certain circumstances the build will fail because some warnings
are treated as errors, such as:

./parser_aux.h:97:1: error: inlining failed in call to '_asn1_set_down':
call is unlikely and code size would grow [-Werror=inline]
ASN1.y:437:59: error: called from here [-Werror=inline]
cc1: all warnings being treated as errors

Add upstream patch to address this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...configure-don-t-add-Werror-to-build-flags.patch | 28 ++++++++++++++++++++++
 package/libtasn1/libtasn1.mk                       |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch

diff --git a/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch b/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
new file mode 100644
index 0000000..387ba7a
--- /dev/null
+++ b/package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
@@ -0,0 +1,28 @@
+From dd091c8af163213e12aa92f61bc4916e0f102633 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:45:33 +0200
+Subject: [PATCH] configure: don't add -Werror to build flags
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: upstream
+
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a14e04..066f5fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,8 +70,6 @@ AC_ARG_ENABLE([gcc-warnings],
+ )
+ 
+ if test "$gl_gcc_warnings" = yes; then
+-  gl_WARN_ADD([-Werror], [WERROR_CFLAGS])
+-
+   nw="$nw -Wsystem-headers"         # Don't let system headers trigger warnings
+   nw="$nw -Wc++-compat"             # We don't care strongly about C++ compilers
+   nw="$nw -Wtraditional"            # Warns on #elif which we use often
+-- 
+2.7.3
+
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index c51d8c0..2987fb2 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -12,5 +12,7 @@ LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
+# For 0001-configure-don-t-add-Werror-to-build-flags.patch
+LIBTASN1_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.7.3
