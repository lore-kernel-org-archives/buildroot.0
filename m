From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Fri, 16 Nov 2018 09:52:53 -0600
Subject: [Buildroot] [PATCH v2 1/1] vmtouch: new package
In-Reply-To: <20181115174250.109988-1-brandon.maier@rockwellcollins.com>
References: <20181115174250.109988-1-brandon.maier@rockwellcollins.com>
Message-ID: <20181116155253.4233-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

---
Changes v1 -> v2:
  - Switch to v1.3.1 and drop patches
  - Add myself to DEVELOPERS
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/vmtouch/Config.in    | 11 +++++++++++
 package/vmtouch/vmtouch.hash |  5 +++++
 package/vmtouch/vmtouch.mk   | 21 +++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/vmtouch/Config.in
 create mode 100644 package/vmtouch/vmtouch.hash
 create mode 100644 package/vmtouch/vmtouch.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da489..3d0b9b270c 100644
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
index b60e7700ad..5d92fa5911 100644
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
-- 
2.19.0
