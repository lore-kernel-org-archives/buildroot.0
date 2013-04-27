From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:46 -0300
Subject: [Buildroot] [PATCH 3/6] cryptodev: add new virtual
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1367093389-23877-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/cryptodev/Config.in    | 37 +++++++++++++++++++++++++++++++++++++
 package/cryptodev/cryptodev.mk | 24 ++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/cryptodev/Config.in
 create mode 100644 package/cryptodev/cryptodev.mk

diff --git a/package/Config.in b/package/Config.in
index c8badad..c0cca5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -384,6 +384,7 @@ endmenu
 
 menu "Crypto"
 source "package/beecrypt/Config.in"
+source "package/cryptodev/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
new file mode 100644
index 0000000..3f08e9e
--- /dev/null
+++ b/package/cryptodev/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_CRYPTODEV
+	bool "cryptodev support"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Select the desired cryptodev implementation.
+
+if BR2_PACKAGE_CRYPTODEV
+
+choice
+	prompt "cryptodev variant"
+	default BR2_PACKAGE_CRYPTODEV_LINUX if !BR2_microblaze
+	help
+	  Select the cryptodev implementation.
+
+config BR2_PACKAGE_CRYPTODEV_LINUX
+	bool "cryptodev-linux"
+	depends on !BR2_microblaze
+	help
+	  Cryptodev-linux is a device that allows access to Linux kernel
+	  cryptographic drivers; thus allowing userspace applications
+	  to take advantage of hardware accelerators.
+
+	  http://cryptodev-linux.org/index.html
+
+config BR2_PACKAGE_OCF_LINUX
+	bool "ocf-linux"
+	help
+	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
+	  Framework (OCF). This port aims to bring full asynchronous HW/SW
+	  crypto acceleration to the Linux kernel and applications
+	  running under Linux.
+
+	  http://ocf-linux.sourceforge.net/
+
+endchoice
+
+endif
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
new file mode 100644
index 0000000..b6f4a42
--- /dev/null
+++ b/package/cryptodev/cryptodev.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# Virtual cryptodev package
+#
+#############################################################
+
+CRYPTODEV_SOURCE =
+
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+CRYPTODEV_DEPENDENCIES += cryptodev-linux
+endif
+
+ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
+CRYPTODEV_DEPENDENCIES += ocf-linux
+endif
+
+ifeq ($(CRYPTODEV_DEPENDENCIES),)
+define CRYPTODEV_CONFIGURE_CMDS
+	echo "No CRYPTODEV implementation defined. Configuration error"
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.8.1.5
