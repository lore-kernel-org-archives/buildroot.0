From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 20 Oct 2009 22:31:48 +0200
Subject: [Buildroot] [PATCH] libarchive: make bsdtar and bsdcpio binaries
	configurable
Message-ID: <1256070708-18078-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libarchive comes with two binaries, bsdtar and bsdcpio that used
to be installed by default. This change makes this configurable
with the default not to build and install the binaries.
---
 package/libarchive/Config.in     |   15 +++++++++++++++
 package/libarchive/libarchive.mk |    4 ++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index 9154861..079e0f8 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -9,3 +9,18 @@ config BR2_PACKAGE_LIBARCHIVE
 
 comment "libarchive requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBARCHIVE_BSDTAR
+	bool "bsdtar"
+	depends on BR2_PACKAGE_LIBARCHIVE
+	help
+	  The 'bsdtar' program is a full-featured 'tar'
+          replacement built on libarchive.
+
+config BR2_PACKAGE_LIBARCHIVE_BSDCPIO
+	bool "bsdcpio"
+	depends on BR2_PACKAGE_LIBARCHIVE
+	help
+	  The 'bsdcpio' program is a different interface to
+          essentially the same functionality as 'bsdtar'.
+
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 472e34b..32f68f7 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -10,4 +10,8 @@ LIBARCHIVE_LIBTOOL_PATCH = NO
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_INSTALL_TARGET = YES
 
+LIBARCHIVE_CONF_OPT = \
+	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
+	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
+
 $(eval $(call AUTOTARGETS,package,libarchive))
-- 
1.6.5
