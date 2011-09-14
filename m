From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 14:56:14 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] linux: Add Linux Kernel extensions
	menu
In-Reply-To: <patchbomb.1316004973@localhost6.localdomain6>
References: <patchbomb.1316004973@localhost6.localdomain6>
Message-ID: <5b4cf688a9f447364de6.1316004974@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a kernel sub-menu (called "Linux Kernel Extensions"), which makes
possible to patch it or tweak the kernel build step.

 * All linux/linux-ext-*.mk files will be read by the make process.
 * The menu can be customized in "linux/Config.ext.in".

Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/Config.ext.in |  3 +++
 linux/Config.in     |  4 ++++
 linux/linux.mk      |  2 ++
 3 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 linux/Config.ext.in

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
new file mode 100644
--- /dev/null
+++ b/linux/Config.ext.in
@@ -0,0 +1,3 @@
+menu "Linux Kernel Extensions"
+
+endmenu
diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -176,6 +176,10 @@
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+
+# Linux extensions (Xenomai)
+source "linux/Config.ext.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -177,6 +177,8 @@
 	fi
 endef
 
+include linux/linux-ext-*.mk
+
 $(eval $(call GENTARGETS,,linux))
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
