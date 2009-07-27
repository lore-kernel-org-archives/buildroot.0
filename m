From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 27 Jul 2009 18:07:50 +0200
Subject: [Buildroot] [PATCH 2/2] linux: make modules_install conditional
In-Reply-To: <1248710870-7709-1-git-send-email-daniel@caiaq.de>
References: <1248710870-7709-1-git-send-email-daniel@caiaq.de>
Message-ID: <1248710870-7709-2-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For very small initramfs systems, the kernel modules installation should
be conditional so it can be switched off on demand. This new value
defaults to 'y', so it shouldn't break any exisiting config.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 Makefile                        |    2 +-
 target/linux/Config.in          |    6 ++++++
 target/linux/Config.in.advanced |    5 +++++
 3 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index dbeede5..65bf853 100644
--- a/Makefile
+++ b/Makefile
@@ -256,7 +256,7 @@ else
 include toolchain/*/*.mk
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX),y)
+ifeq ($(BR2_PACKAGE_LINUX_MODULES_INSTALL),y)
 TARGETS+=linux26-modules
 endif
 
diff --git a/target/linux/Config.in b/target/linux/Config.in
index c79fca2..3cde3e0 100644
--- a/target/linux/Config.in
+++ b/target/linux/Config.in
@@ -30,4 +30,10 @@ config BR2_PACKAGE_LINUX_FORMAT
 	  If the above setting is empty, you can change the default
 	  board-imposed value by passing LINUX26_FORMAT=<string> to
 	  make.
+
+config BR2_PACKAGE_LINUX_MODULES_INSTALL
+	bool
+	depends on BR2_PACKAGE_LINUX
+	default y
+
 endif
diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 3a171b5..6574670 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -360,6 +360,11 @@ config BR2_LINUX26_VERSION
 	default "$(BR2_KERNEL_CURRENT_VERSION)"if				BR2_LINUX_2_6_STABLE
 	default "$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
 
+config BR2_PACKAGE_LINUX_MODULES_INSTALL
+	bool "Install Linux kernel modules to target"
+	depends on BR2_PACKAGE_LINUX
+	default y
+
 menu "Linux Kernel Configuration"
 
 choice
-- 
1.6.3.1
