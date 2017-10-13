From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 07:59:31 +0200
Subject: [Buildroot] [git commit] luksmeta: new package
Message-ID: <20171013055308.4955B80F83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f3bcb4f5a97faa615692e904f26143e9fc31a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add DEVELOPERS entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/luksmeta/Config.in     | 17 +++++++++++++++++
 package/luksmeta/luksmeta.hash |  3 +++
 package/luksmeta/luksmeta.mk   | 15 +++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52a2c6a..942abcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ F:	package/fscryptctl/
 F:	package/jo/
 F:	package/jose/
 F:	package/libfastjson/
+F:	package/luksmeta/
 F:	package/lzop/
 F:	package/memtool/
 F:	package/mosquitto/
diff --git a/package/Config.in b/package/Config.in
index 40f496a..d4cf627 100644
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
index 0000000..62e1f3e
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
index 0000000..f5d7564
--- /dev/null
+++ b/package/luksmeta/luksmeta.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0154af98e7302a172060d83d24b6d87557a822c39ba3e911461bb1a6d3a22d51  luksmeta-8.tar.bz2
+sha256 4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
new file mode 100644
index 0000000..33671e4
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
