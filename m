From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  7 Dec 2015 21:33:09 +0100
Subject: [Buildroot] [PATCH v1] read-edid: bump version to 3.0.2
Message-ID: <1449520389-23420-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update hash
- change from autotools to cmake package
- update license info
- enable get-edid command (i2c build)
- add patch fixing install error because of missing file COPYING

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/read-edid/0001-Fix-install-file-list.patch | 29 ++++++++++++++++++++++
 package/read-edid/Config.in                        |  2 --
 package/read-edid/read-edid.hash                   |  2 +-
 package/read-edid/read-edid.mk                     | 13 +++++-----
 4 files changed, 36 insertions(+), 10 deletions(-)
 create mode 100644 package/read-edid/0001-Fix-install-file-list.patch

diff --git a/package/read-edid/0001-Fix-install-file-list.patch b/package/read-edid/0001-Fix-install-file-list.patch
new file mode 100644
index 0000000..622e97d
--- /dev/null
+++ b/package/read-edid/0001-Fix-install-file-list.patch
@@ -0,0 +1,29 @@
+From 562f48bee3443bda0ac257f2b0c52a72208163e0 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 7 Dec 2015 21:20:38 +0100
+Subject: [PATCH] Fix install file list.
+
+Fixes:
+  CMake Error at cmake_install.cmake:40 (file):
+    file INSTALL cannot find
+    ".../build/read-edid-3.0.2/COPYING".
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7bf4561..2b9bc86 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,5 +13,5 @@ endif ()
+ add_subdirectory (parse-edid)
+ 
+ INSTALL(FILES get-edid.1 DESTINATION share/man/man1)
+-INSTALL(FILES AUTHORS ChangeLog COPYING README DESTINATION
++INSTALL(FILES AUTHORS ChangeLog README DESTINATION
+ 	share/doc/read-edid)
+-- 
+2.1.4
+
diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
index a4668e6..c830e17 100644
--- a/package/read-edid/Config.in
+++ b/package/read-edid/Config.in
@@ -10,6 +10,4 @@ config BR2_PACKAGE_READ_EDID
 	  which turns the raw binary information into an
 	  XF86Config-compatible monitor section.
 
-	  Notice that the get-edid tool is only available on x86.
-
 	  http://polypux.org/projects/read-edid/
diff --git a/package/read-edid/read-edid.hash b/package/read-edid/read-edid.hash
index 2c5501c..3005217 100644
--- a/package/read-edid/read-edid.hash
+++ b/package/read-edid/read-edid.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c1b5d839fe6349efc183b3a3d33a8be1cd0dfea3c94015a86159d8aaeb6e9dd7	read-edid-1.4.2.tar.gz
+sha256 c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f read-edid-3.0.2.tar.gz
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index f047e79..3e38f50 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-READ_EDID_VERSION = 1.4.2
+READ_EDID_VERSION = 3.0.2
 READ_EDID_SITE = http://www.polypux.org/projects/read-edid
-READ_EDID_LICENSE = GPLv2
-READ_EDID_LICENSE_FILES = COPYING
+READ_EDID_LICENSE = BSD-like
+READ_EDID_LICENSE_FILES = LICENSE
 
-define READ_EDID_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
+# disable classic get-edid support (needs libx86)
+READ_EDID_CONF_OPTS += -DCLASSICBUILD=OFF
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.1.4
