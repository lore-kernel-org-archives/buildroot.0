From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 11 Jan 2019 12:44:26 +0100
Subject: [Buildroot] [v2] linux: add option to enable support for Device
 Tree overlays
In-Reply-To: <20190105105909.31359-1-titouan.christophe@railnova.eu>
References: <20190105105909.31359-1-titouan.christophe@railnova.eu>
Message-ID: <20190111114426.9888-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to compile device trees in Linux with symbol generation
such that device tree overlays can be loaded on the target system

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1->v2:
* Make the option more specific about DT Overlays
  (rather than simply describing DT symbols generation)
* Remove indentation in linux.mk to fit code style
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 932aa62991..bf21d80368 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -392,6 +392,14 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 
+config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
+	bool "Build Device Tree with overlay support"
+	default n
+	help
+	  If enabled, pass the "-@" option to the device tree compiler,
+	  such that symbols are generated in the compiled Device Tree.
+	  Choose this option to support Device Tree overlays on the target system.
+
 endif
 
 config BR2_LINUX_KERNEL_INSTALL_TARGET
diff --git a/linux/linux.mk b/linux/linux.mk
index 6bf2b88038..950698f336 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -381,6 +381,10 @@ ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 # reproducibility, we use our owns rather than the host ones.
 LINUX_DEPENDENCIES += host-bison host-flex
 
+ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
+LINUX_MAKE_ENV += DTC_FLAGS=-@
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
-- 
2.19.2
