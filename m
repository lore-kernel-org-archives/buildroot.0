From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 16:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] libedit: bump to version 20170329-3.1
Message-ID: <20180429145126.3618-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove LIBEDIT_POST_EXTRACT_HOOKS
- Rebase patch
- Remove --enable-widec (deprecated, wide char is always enabled)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libedit/0001-check-bsd-functions-in-libbsd.patch |  6 ++++--
 package/libedit/libedit.hash                             |  3 ++-
 package/libedit/libedit.mk                               | 11 +----------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/package/libedit/0001-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
index de452a5c24..7438340d48 100644
--- a/package/libedit/0001-check-bsd-functions-in-libbsd.patch
+++ b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
@@ -1,5 +1,7 @@
 configure: on Linux, the BSD functions require linking against libbsd
 
+Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
+(Rebased against 20170329-3.1)
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 (Rebased against 20150325-3.1)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
@@ -15,6 +17,6 @@ diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure
 +# Search for libbsd for *vis functions
 +AC_CHECK_LIB([bsd], [vis])
 +
- AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat fgetln vis strvis strunvis __secure_getenv secure_getenv])
- 
+ AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat getline vis strvis strunvis __secure_getenv secure_getenv])
+
  # strlcpy
diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index 4bfb8afce8..e8136df9c4 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 c88a5e4af83c5f40dda8455886ac98923a9c33125699742603a88a0253fcc8c5 libedit-20150325-3.1.tar.gz
+sha256 91f2d90fbd2a048ff6dad7131d9a39e690fd8a8fd982a353f1333dd4017dd4be libedit-20170329-3.1.tar.gz
+sha256 9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649 COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 51ca87d4db..bbdc871b35 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20150325-3.1
+LIBEDIT_VERSION = 20170329-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
@@ -14,15 +14,6 @@ LIBEDIT_LICENSE_FILES = COPYING
 # We're patching configure.ac
 LIBEDIT_AUTORECONF = YES
 
-# Needed for autoreconf to work properly
-define LIBEDIT_FIXUP_M4_DIR
-	mkdir $(@D)/m4
-endef
-LIBEDIT_POST_EXTRACT_HOOKS += LIBEDIT_FIXUP_M4_DIR
-
-# Doesn't really support !wchar, but support is disabled otherwise
-LIBEDIT_CONF_OPTS += --enable-widec
-
 # musl is ISO 10646 compliant but doesn't define __STDC_ISO_10646__,
 # so let's define it manually
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-- 
2.14.1
