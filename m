From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 22:59:20 +0200
Subject: [Buildroot] [git commit] linux: Add Linux Kernel extensions menu
Message-ID: <20110918210214.A644A8D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3011d235185b490e619dd8b01004538c5985b0ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a kernel sub-menu (called "Linux Kernel Extensions"), which makes
possible to patch it or tweak the kernel build step.

 * All linux/linux-ext-*.mk files will be read by the make process.
 * The menu can be customized in "linux/Config.ext.in".

[Peter: small fixes]
Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.ext.in |    3 +++
 linux/Config.in     |    4 ++++
 linux/linux.mk      |    2 ++
 3 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
new file mode 100644
index 0000000..50e801d
--- /dev/null
+++ b/linux/Config.ext.in
@@ -0,0 +1,3 @@
+menu "Linux Kernel Extensions"
+
+endmenu
diff --git a/linux/Config.in b/linux/Config.in
index 537cb54..5655286 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -176,6 +176,10 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+
+# Linux extensions
+source "linux/Config.ext.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index d289b28..f249d96 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -177,6 +177,8 @@ define LINUX_INSTALL_TARGET_CMDS
 	fi
 endef
 
+include linux/linux-ext-*.mk
+
 $(eval $(call GENTARGETS,,linux))
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
