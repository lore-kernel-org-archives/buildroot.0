From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 May 2012 16:23:12 -0300
Subject: [Buildroot] [PATCH 1/2] ocf-linux: new package
In-Reply-To: <1336159393-17052-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336159393-17052-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336159393-17052-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the ocf-linux package and linux kernel extension.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.ext.in            |   12 ++++++++++++
 linux/linux-ext-ocf-linux.mk   |   21 +++++++++++++++++++++
 package/Config.in              |    1 +
 package/ocf-linux/Config.in    |   12 ++++++++++++
 package/ocf-linux/ocf-linux.mk |   21 +++++++++++++++++++++
 5 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 linux/linux-ext-ocf-linux.mk
 create mode 100644 package/ocf-linux/Config.in
 create mode 100644 package/ocf-linux/ocf-linux.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 172fa76..943c380 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -23,6 +23,18 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
+# ocf-linux
+config BR2_LINUX_KERNEL_EXT_OCF_LINUX
+	bool "Open Cryptographic Framework (OCF)"
+	select BR2_PACKAGE_OCF_LINUX
+	help
+	  OCF-Linux Kernel part.
+
+	  Select this option to patch your kernel with OCF for
+	  hardware-accelerated crypto support for available drivers.
+	  Some libraries need to have OCF also enabled for them,
+	  for example OpenSSL.
+
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
        bool "RTAI Real-time patch"
diff --git a/linux/linux-ext-ocf-linux.mk b/linux/linux-ext-ocf-linux.mk
new file mode 100644
index 0000000..83e26ef
--- /dev/null
+++ b/linux/linux-ext-ocf-linux.mk
@@ -0,0 +1,21 @@
+##################################################
+# Linux OCF extension
+#
+# Patch the linux kernel with OCF
+##################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_OCF_LINUX),y)
+LINUX_DEPENDENCIES += ocf-linux
+
+# Prepare kernel patch
+# The linux-3.2.1.patch is just the main inclusion, most of the code
+# resides in the ocf/ subdir.
+define OCF_LINUX_PREPARE_KERNEL
+	support/scripts/apply-patches.sh $(LINUX_DIR) \
+		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
+	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
+endef
+
+LINUX_PRE_PATCH_HOOKS += OCF_LINUX_PREPARE_KERNEL
+
+endif #BR2_LINUX_EXT_OCF_LINUX
diff --git a/package/Config.in b/package/Config.in
index 1cd9789..968cacc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,6 +279,7 @@ source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
+source "package/ocf-linux/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
 endmenu
diff --git a/package/ocf-linux/Config.in b/package/ocf-linux/Config.in
new file mode 100644
index 0000000..3c3a08e
--- /dev/null
+++ b/package/ocf-linux/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OCF_LINUX
+	bool "ocf-linux"
+	help
+	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
+	  Framework (OCF). This port aims to bring full asynchronous HW/SW
+	  crypto acceleration to the Linux kernel and applications
+	  running under Linux.
+
+	  You need to enable the OCF linux kernel extension or provide
+	  a prepatched kernel to make this option useful.
+	  
+	  http://ocf-linux.sourceforge.net/
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
new file mode 100644
index 0000000..e615225
--- /dev/null
+++ b/package/ocf-linux/ocf-linux.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# ocf-linux
+#
+#############################################################
+
+OCF_LINUX_VERSION = 20120127
+OCF_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
+OCF_LINUX_INSTALL_STAGING = YES
+
+define OCF_LINUX_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+define OCF_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
