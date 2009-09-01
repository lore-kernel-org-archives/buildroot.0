From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 13:26:51 +0200
Subject: [Buildroot] [git commit master] busybox: add 1.15.0
Message-ID: <20090901112711.638E077735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01f783dc096386b00179a255a63925015f514571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                   |   10 ++++++++--
 package/busybox/busybox-1.15.0-unpack.patch |   12 ++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 package/busybox/busybox-1.15.0-unpack.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index d72ab3d..a6a35e7 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_BUSYBOX
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_14_X
+	default BR2_BUSYBOX_VERSION_1_15_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -22,10 +22,14 @@ choice
 
 	config BR2_BUSYBOX_VERSION_1_13_X
 		bool "BusyBox 1.13.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_RECENT
 
 	config BR2_BUSYBOX_VERSION_1_14_X
 		bool "BusyBox 1.14.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_BUSYBOX_VERSION_1_15_X
+		bool "BusyBox 1.15.x"
 
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
@@ -37,6 +41,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
 	default "1.14.3"	if BR2_BUSYBOX_VERSION_1_14_X
+	default "1.15.0"	if BR2_BUSYBOX_VERSION_1_15_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
@@ -58,6 +63,7 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_13_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_14_X
+	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_15_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
diff --git a/package/busybox/busybox-1.15.0-unpack.patch b/package/busybox/busybox-1.15.0-unpack.patch
new file mode 100644
index 0000000..954618b
--- /dev/null
+++ b/package/busybox/busybox-1.15.0-unpack.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.15.0/archival/libunarchive/data_extract_all.c busybox-1.15.0-unpack/archival/libunarchive/data_extract_all.c
+--- busybox-1.15.0/archival/libunarchive/data_extract_all.c	2009-08-21 00:26:13.000000000 +0200
++++ busybox-1.15.0-unpack/archival/libunarchive/data_extract_all.c	2009-08-30 01:05:39.000000000 +0200
+@@ -132,7 +132,7 @@ void FAST_FUNC data_extract_all(archive_
+ #endif
+ 			lchown(file_header->name, file_header->uid, file_header->gid);
+ 	}
+-	if (S_ISLNK(file_header->mode)) {
++	if (!S_ISLNK(file_header->mode)) {
+ 		/* uclibc has no lchmod, glibc is even stranger -
+ 		 * it has lchmod which seems to do nothing!
+ 		 * so we use chmod... */
-- 
1.6.3.3
