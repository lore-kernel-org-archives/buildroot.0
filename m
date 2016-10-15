From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:51:05 +0200
Subject: [Buildroot] [PATCH 11/13] wvdial: remove deprecated package
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                         |  7 +++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/wvdial/0001-uClibc-scandir.patch | 23 -----------------------
 package/wvdial/Config.in                 | 17 -----------------
 package/wvdial/wvdial.hash               |  2 --
 package/wvdial/wvdial.mk                 | 32 --------------------------------
 7 files changed, 7 insertions(+), 76 deletions(-)
 delete mode 100644 package/wvdial/0001-uClibc-scandir.patch
 delete mode 100644 package/wvdial/Config.in
 delete mode 100644 package/wvdial/wvdial.hash
 delete mode 100644 package/wvdial/wvdial.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0c47992..b5fb49f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_WVDIAL
+	bool "wvdial removed"
+	select BR2_LEGACY
+	help
+	  wvdial is not maintained anymore since about 2009. It also
+	  doesn't build anymore with recent compilers (GCC 5+).
+
 config BR2_PACKAGE_WEBKITGTK24
 	bool "webkitgtk 2.4.x removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 71b0456..d8c6583 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1348,7 +1348,6 @@ F:	package/sconeserver/
 F:	package/sound-theme-borealis/
 F:	package/sound-theme-freedesktop/
 F:	package/vlc/
-F:	package/wvdial/
 F:	package/wvstreams/
 F:	package/xscreensaver/
 F:	package/zmqpp/
diff --git a/package/Config.in b/package/Config.in
index cdaf9e3..b7cb970 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1628,7 +1628,6 @@ endif
 	source "package/wireshark/Config.in"
 	source "package/wpa_supplicant/Config.in"
 	source "package/wpan-tools/Config.in"
-	source "package/wvdial/Config.in"
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
diff --git a/package/wvdial/0001-uClibc-scandir.patch b/package/wvdial/0001-uClibc-scandir.patch
deleted file mode 100644
index b611e94..0000000
--- a/package/wvdial/0001-uClibc-scandir.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix wvdial so that it works with scandir as defined in uClibc.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/wvmodemscan.cc b/wvmodemscan.cc
---- a/wvmodemscan.cc	2009-09-29 18:27:28.000000000 +0100
-+++ b/wvmodemscan.cc	2012-07-28 14:03:56.359729660 +0100
-@@ -495,13 +495,13 @@ static int fileselect(const struct diren
- 	// (no internal ISDN support)   || !strncmp(e->d_name, "ttyI", 4);
- }
- 
--#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 10)
-+#if defined(__UCLIBC__) || (defined(__GLIBC__) && __GLIBC_PREREQ(2, 10))
- static int filesort(const dirent **e1, const dirent **e2)
- #else
- static int filesort(const void *_e1, const void *_e2)
- #endif
- {
--#if !(defined(__GLIBC__) && __GLIBC_PREREQ(2, 10))
-+#if !(defined(__UCLIBC__) || (defined(__GLIBC__) && __GLIBC_PREREQ(2, 10)))
-     dirent const * const *e1 = (dirent const * const *)_e1;
-     dirent const * const *e2 = (dirent const * const *)_e2;
- #endif
diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
deleted file mode 100644
index 0c13202..0000000
--- a/package/wvdial/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_PACKAGE_WVDIAL
-	bool "wvdial"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # wvstreams
-	depends on !BR2_STATIC_LIBS # wvstreams
-	depends on !BR2_TOOLCHAIN_USES_MUSL # wvstreams
-	select BR2_PACKAGE_WVSTREAMS
-	help
-	  wvdial is an intelligent Point-to-Point Protocol dialer
-
-	  http://wvdial.googlecode.com/
-
-comment "wvdial needs a glibc or uClibc toolchain w/ C++, dynamic library"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/wvdial/wvdial.hash b/package/wvdial/wvdial.hash
deleted file mode 100644
index ac49209..0000000
--- a/package/wvdial/wvdial.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82  wvdial-1.61.tar.bz2
diff --git a/package/wvdial/wvdial.mk b/package/wvdial/wvdial.mk
deleted file mode 100644
index e89dfc5..0000000
--- a/package/wvdial/wvdial.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# wvdial
-#
-################################################################################
-
-WVDIAL_VERSION = 1.61
-WVDIAL_SITE = http://wvdial.googlecode.com/files
-WVDIAL_SOURCE = wvdial-$(WVDIAL_VERSION).tar.bz2
-WVDIAL_DEPENDENCIES = wvstreams
-
-WVDIAL_LICENSE = LGPLv2
-WVDIAL_LICENSE_FILES = COPYING.LIB
-
-# N.B. parallel make fails
-WVDIAL_MAKE = $(MAKE1)
-
-WVDIAL_MAKE_ENV += $(TARGET_CONFIGURE_OPTS) \
-	WVSTREAMS_INC="$(STAGING_DIR)/usr/include" \
-	WVSTREAMS_LIB="$(STAGING_DIR)/usr/lib"
-
-define WVDIAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) -C $(@D)
-endef
-
-define WVDIAL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(WVDIAL_MAKE_ENV) $(WVDIAL_MAKE) \
-		prefix="$(TARGET_DIR)/usr" PPPDIR="$(TARGET_DIR)/etc/ppp/peers" \
-		install -C $(@D)
-endef
-
-$(eval $(generic-package))
-- 
2.9.3
