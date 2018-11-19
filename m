From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:18:59 +0100
Subject: [Buildroot] [git commit] vmtouch: new package
Message-ID: <20181202071556.AD1B38843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4996f77ae3d59609c816d29c1030340a79902263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/vmtouch/Config.in    | 11 +++++++++++
 package/vmtouch/vmtouch.hash |  5 +++++
 package/vmtouch/vmtouch.mk   | 21 +++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4d98d9b0b..ff95f6aba2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -403,6 +403,9 @@ N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
 
+N:	Brandon Maier <brandon.maier@rockwellcollins.com>
+F:	package/vmtouch/
+
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
diff --git a/package/Config.in b/package/Config.in
index 5a5d840391..6fa09bab32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -131,6 +131,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
 	source "package/valgrind/Config.in"
+	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
 
diff --git a/package/vmtouch/Config.in b/package/vmtouch/Config.in
new file mode 100644
index 0000000000..daae03aa32
--- /dev/null
+++ b/package/vmtouch/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_VMTOUCH
+	bool "vmtouch"
+	depends on BR2_USE_MMU # fork()
+	help
+	  vmtouch is a tool for learning about and controlling
+	  the file system cache of unix and unix-like systems. It
+	  can discover which files the OS is caching, tell the OS
+	  to cache or evict some files or regions of files, lock
+	  files into memory so the OS won't evict them, and more.
+
+	  https://hoytech.com/vmtouch/
diff --git a/package/vmtouch/vmtouch.hash b/package/vmtouch/vmtouch.hash
new file mode 100644
index 0000000000..2b98891d1c
--- /dev/null
+++ b/package/vmtouch/vmtouch.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 d57b7b3ae1146c4516429ab7d6db6f2122401db814ddd9cdaad10980e9c8428c  vmtouch-v1.3.1.tar.gz
+
+# Hash for license files:
+sha256 13258709ed29c17394e0a3ba8c8b9360af35b85231db514f11a0ba385cecd08e  LICENSE
diff --git a/package/vmtouch/vmtouch.mk b/package/vmtouch/vmtouch.mk
new file mode 100644
index 0000000000..856835acd4
--- /dev/null
+++ b/package/vmtouch/vmtouch.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# vmtouch
+#
+################################################################################
+
+VMTOUCH_VERSION = v1.3.1
+VMTOUCH_SITE = $(call github,hoytech,vmtouch,$(VMTOUCH_VERSION))
+VMTOUCH_LICENSE = BSD-3-Clause
+VMTOUCH_LICENSE_FILES = LICENSE
+
+define VMTOUCH_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define VMTOUCH_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr
+endef
+
+$(eval $(generic-package))
