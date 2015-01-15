From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 11:30:17 -0300
Subject: [Buildroot] [PATCH 2/7] distcc: remove deprecated package
In-Reply-To: <1421332222-15098-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421332222-15098-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421332222-15098-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated since feb 2014 and it'll be a year for the 2015.02
release so remove it.
And it's basically useless without a target toolchain.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy         |  8 ++++++++
 package/Config.in        |  3 ---
 package/distcc/Config.in | 11 -----------
 package/distcc/distcc.mk | 19 -------------------
 4 files changed, 8 insertions(+), 33 deletions(-)
 delete mode 100644 package/distcc/Config.in
 delete mode 100644 package/distcc/distcc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index db8c3b1..9bd2fde 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_DISTCC
+	bool "distcc target package removed"
+	select BR2_LEGACY
+	help
+	  The distcc target package has been removed, it's been
+	  deprecated for some time now and was essentially useless
+	  without a target toolchain.
+
 config BR2_PACKAGE_HASERL_VERSION_0_8_X
 	bool "haserl 0.8.x version removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 319ffd6..a8e09f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -109,9 +109,6 @@ menu "Development tools"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
-endif
-	source "package/distcc/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/findutils/Config.in"
 endif
 	source "package/flex/Config.in"
diff --git a/package/distcc/Config.in b/package/distcc/Config.in
deleted file mode 100644
index 08e1ab3..0000000
--- a/package/distcc/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DISTCC
-	bool "distcc"
-	# needs fork()
-	depends on BR2_USE_MMU
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	help
-	  Distributed compiler client and server.  Allows you to
-	  distribute compilation of C code across several machines
-	  on a network.
-
-	  http://distcc.samba.org/
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
deleted file mode 100644
index eae5fb8..0000000
--- a/package/distcc/distcc.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# distcc
-#
-################################################################################
-
-DISTCC_VERSION = 2.18.3
-DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
-DISTCC_SITE = http://distcc.googlecode.com/files
-DISTCC_CONF_OPTS = --with-included-popt --without-gtk --without-gnome
-DISTCC_LICENSE = GPLv2+
-DISTCC_LICENSE_FILES = COPYING
-
-define DISTCC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
-	$(INSTALL) -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
-endef
-
-$(eval $(autotools-package))
-- 
2.0.5
