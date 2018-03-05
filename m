From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 5 Mar 2018 20:46:59 +0100
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.29
Message-ID: <20180305194659.GA15733@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release adds a lot of bugfixes for x86_64 and aarch64.
It integrates gettext-tiny useful to be used with libintl stub.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2: fixes compile issues with msgfmt/msgmerge
---
 ...0001-utils-fix-compile-of-msgfmt-msgmerge.patch | 48 ++++++++++++++++++++++
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch

diff --git a/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch b/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch
new file mode 100644
index 0000000..968d682
--- /dev/null
+++ b/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch
@@ -0,0 +1,48 @@
+From 01e9f2f202a0afc658bfd82c0ff1770de7900bb1 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Mon, 5 Mar 2018 20:29:56 +0100
+Subject: [PATCH] utils: fix compile of msgfmt/msgmerge
+
+The host utils are missing the dependencies, the target
+utils need libiconv enabled.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ utils/Makefile.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/utils/Makefile.in b/utils/Makefile.in
+index 99241845f..2f8d1c96a 100644
+--- a/utils/Makefile.in
++++ b/utils/Makefile.in
+@@ -83,7 +83,9 @@ utils_OUT := $(top_builddir)utils
+ DEPS-ldconfig := $(utils_DIR)/chroot_realpath.c
+ DEPS-ldconfig.host := $(DEPS-ldconfig)
+ DEPS-msgfmt := $(utils_DIR)/poparser.c $(utils_DIR)/StringEscape.c
++DEPS-msgfmt.host := $(DEPS-msgfmt)
+ DEPS-msgmerge := $(utils_DIR)/poparser.c $(utils_DIR)/StringEscape.c
++DEPS-msgmerge.host := $(DEPS-msgmerge)
+ 
+ utils_OBJ := getconf
+ ifeq ($(HAVE_SHARED),y)
+@@ -96,7 +98,7 @@ utils_OBJ += iconv
+ utils_LOCALE_OBJ += $(utils_OUT)/locale
+ endif
+ 
+-ifeq ($(UCLIBC_HAS_LIBINTL),y)
++ifeq ($(UCLIBC_HAS_LIBINTL)$(UCLIBC_HAS_LIBICONV),yy)
+ utils_OBJ += msgfmt msgmerge
+ endif
+ 
+@@ -141,7 +143,7 @@ ifeq ($(UCLIBC_HAS_LOCALE),y)
+ 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/iconv$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/iconv
+ 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/locale$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/locale
+ endif
+-ifeq ($(UCLIBC_HAS_LIBINTL),y)
++ifeq ($(UCLIBC_HAS_LIBINTL)$(UCLIBC_HAS_LIBICONV),yy)
+ 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/msgmerge$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/msgmerge
+ 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/msgfmt$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/msgfmt
+ 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/xgettext $(PREFIX)$(DEVEL_PREFIX)bin
+-- 
+2.16.1
+
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0a15683..14f71d0 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  a1504ddc34a29cc9bfd1f5a7419c4b63bb510d9e2faed81618d1b596ceb0a5a9        uClibc-ng-1.0.28.tar.xz
+sha256  e014e34abb13e97ca81694927f8ba95484cca2d3abac64b71f1a7981a96cb99c        uClibc-ng-1.0.29.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c5b0c6b..8d198f6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.28
+UCLIBC_VERSION = 1.0.29
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.1.4
