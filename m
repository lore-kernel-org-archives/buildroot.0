From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Aug 2018 19:08:07 +0200
Subject: [Buildroot] [PATCH 1/1] mutt: fix static build with libidn2 and
 libunistring
Message-ID: <20180820170807.21070-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libidn2 is statically build with libunistring support, mutt needs
to add -lunistring to LIBS.
To do that, add a call to PKG_CHECK_MODULES to retrieve this information
from libidn2.pc

Fixes:
 - http://autobuild.buildroot.net/results/177da8f4798f69298db5385957184f1c53cca923

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tatic-build-with-libidn2-and-libunistring.patch | 36 ++++++++++++++++++++++
 package/mutt/mutt.mk                               |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch

diff --git a/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch b/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch
new file mode 100644
index 0000000000..56b90f5e3b
--- /dev/null
+++ b/package/mutt/0001-Fix-static-build-with-libidn2-and-libunistring.patch
@@ -0,0 +1,36 @@
+From 1baceb95bd8e6f35c25bc7afdc6a88c8f6264f3f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 Aug 2018 19:06:08 +0200
+Subject: [PATCH] Fix static build with libidn2 and libunistring
+
+When libidn2 is statically build with libunistring support, mutt needs
+to add -lunistring to LIBS.
+To do that, add a call to PKG_CHECK_MODULES to retrieve this information
+from libidn2.pc
+
+Fixes:
+ - http://autobuild.buildroot.net/results/177da8f4798f69298db5385957184f1c53cca923
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 29252173..2e69ac19 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1341,6 +1341,10 @@ AC_ARG_WITH(idn2, AS_HELP_STRING([--with-idn2=@<:@PFX@:>@],[Use GNU libidn2 for
+             if test "$with_idn2" != "yes" ; then
+               CPPFLAGS="$CPPFLAGS -I$with_idn2/include"
+               LDFLAGS="$LDFLAGS -L$with_idn2/lib"
++            else
++              PKG_CHECK_MODULES([LIBIDN2], libidn2,
++                                 [CPPFLAGS="$CPPFLAGS $LIBIDN2_CFLAGS"
++                                 LIBS="$LIBIDN2_LIBS"])
+             fi
+           fi
+         ],
+-- 
+2.14.1
+
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 1c3021ece1..9918b45e64 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -8,8 +8,10 @@ MUTT_VERSION = 1.10.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-MUTT_DEPENDENCIES = ncurses
+MUTT_DEPENDENCIES = host-pkgconf ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
+# We're patching configure.ac
+MUTT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
-- 
2.14.1
