From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 2 Sep 2009 10:01:08 +0200
Subject: [Buildroot] [git commit master] libarchive package added
Message-ID: <20090902080207.798FF776DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32518793e17357fced65c928308ffdcebe142563
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://code.google.com/p/libarchive/

[Peter: removed conditional target install, added wchar dependency]

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    2 ++
 package/Config.in                |    1 +
 package/libarchive/Config.in     |   11 +++++++++++
 package/libarchive/libarchive.mk |   15 +++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/libarchive/Config.in
 create mode 100644 package/libarchive/libarchive.mk

diff --git a/CHANGES b/CHANGES
index 414aa16..9180864 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,7 @@
 2009.11, Not yet released:
 
+	New packages: libarchive
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#527: misc fixes for dnsmasq package
diff --git a/package/Config.in b/package/Config.in
index f5f7760..cf4db52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ menu "Compressors / decompressors"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/gzip/Config.in"
 endif
+source "package/libarchive/Config.in"
 source "package/lzo/Config.in"
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
new file mode 100644
index 0000000..9154861
--- /dev/null
+++ b/package/libarchive/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBARCHIVE
+	bool "libarchive"
+	depends on BR2_USE_WCHAR
+	help
+	  Libarchive is a reusable C library for reading and writing a
+	  variety of streaming archive formats.
+
+	  http://code.google.com/p/libarchive/
+
+comment "libarchive requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
new file mode 100644
index 0000000..72590fd
--- /dev/null
+++ b/package/libarchive/libarchive.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libarchive (reusable C library for archive formats)
+#
+#############################################################
+LIBARCHIVE_VERSION = 2.7.1
+LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
+LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
+LIBARCHIVE_LIBTOOL_PATCH = NO
+LIBARCHIVE_INSTALL_STAGING = YES
+LIBARCHIVE_INSTALL_TARGET = YES
+
+LIBARCHIVE_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,libarchive))
-- 
1.6.3.3
