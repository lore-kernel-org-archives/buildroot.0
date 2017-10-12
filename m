From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Oct 2017 21:34:29 +0200
Subject: [Buildroot] [PATCH] luksmeta: new package
Message-ID: <20171012193429.25977-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |  1 +
 package/luksmeta/Config.in     | 17 +++++++++++++++++
 package/luksmeta/luksmeta.hash |  3 +++
 package/luksmeta/luksmeta.mk   | 15 +++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/luksmeta/Config.in
 create mode 100644 package/luksmeta/luksmeta.hash
 create mode 100644 package/luksmeta/luksmeta.mk

diff --git a/package/Config.in b/package/Config.in
index aa0f2d7f8e..fd553a1080 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -442,6 +442,7 @@ endmenu
 	source "package/lshw/Config.in"
 	source "package/lsscsi/Config.in"
 	source "package/lsuio/Config.in"
+	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
 	source "package/mdadm/Config.in"
diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
new file mode 100644
index 0000000000..62e1f3e42f
--- /dev/null
+++ b/package/luksmeta/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LUKSMETA
+	bool "luksmeta"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
+	depends on BR2_USE_MMU # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # cryptsetup -> lvm2
+	select BR2_PACKAGE_CRYPTSETUP
+	help
+	  LUKSMeta is a simple library and utility for storing
+	  metadata in the LUKSv1 header.
+
+	  https://github.com/latchset/luksmeta
+
+comment "luksmeta needs a glibc or uClibc toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
new file mode 100644
index 0000000000..f5d756405a
--- /dev/null
+++ b/package/luksmeta/luksmeta.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0154af98e7302a172060d83d24b6d87557a822c39ba3e911461bb1a6d3a22d51  luksmeta-8.tar.bz2
+sha256 4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
new file mode 100644
index 0000000000..33671e469a
--- /dev/null
+++ b/package/luksmeta/luksmeta.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# luksmeta
+#
+################################################################################
+
+LUKSMETA_VERSION = 8
+LUKSMETA_SOURCE = luksmeta-$(LUKSMETA_VERSION).tar.bz2
+LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSMETA_VERSION)
+LUKSMETA_LICENSE = LGPL-2.1+
+LUKSMETA_LICENSE_FILES = COPYING
+LUKSMETA_DEPENDENCIES = host-pkgconf cryptsetup
+LUKSMETA_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.11.0
