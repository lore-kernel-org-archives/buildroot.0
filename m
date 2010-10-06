From: Patrik =?iso-8859-1?q?Dahlstr=F6m?= <patrikd@telia.com>
Date: Wed, 6 Oct 2010 09:45:37 +0200
Subject: [Buildroot] [PATCH] pcmciautils: added package
Message-ID: <201010060945.37426.patrikd@telia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject: [PATCH] pcmciautils: added package
Date: Wednesday 06 October 2010, 09:41:18
From: "Patrik Dahlstr?m" <risca88@gmail.com>
To: buildroot at busybox.net
CC: Patrik Dahlstr?m <patrikd@telia.com>

---
 package/Config.in                  |    1 +
 package/pcmciautils/Config.in      |   24 +++++++++++++++++++++
 package/pcmciautils/pcmciautils.mk |   41 
++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 package/pcmciautils/Config.in
 create mode 100644 package/pcmciautils/pcmciautils.mk

diff --git a/package/Config.in b/package/Config.in
index 5e08d59..c75932b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,6 +177,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
+source "package/pcmciautils/Config.in"
 source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
diff --git a/package/pcmciautils/Config.in b/package/pcmciautils/Config.in
new file mode 100644
index 0000000..022558a
--- /dev/null
+++ b/package/pcmciautils/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_PCMCIAUTILS
+	bool "pcmciautils"
+	select BR2_PACKAGE_LIBSYSFS
+	depends on BR2_PACKAGE_UDEV
+	help
+	  Set of tools needed to use PC-card slots usually found in laptops
+
+comment "pcmciautils requires udev"
+	depends on !BR2_PACKAGE_UDEV
+
+if BR2_PACKAGE_PCMCIAUTILS
+
+config BR2_PACKAGE_PCMCIAUTILS_STARTUP
+	bool "Build socket-startup script"
+	default y
+	help
+	  Enable this if you need the socket-startup script
+ 
+	  You don't need it if the socket driver does not select
+	  PCCARD_NONSTATIC -- that is the case for many embedded systems --
+	  and for yenta_socket if the cardbus bridge is either below a
+	  PCI-PCI bridge, or where the PCI bus is not equivalent to the host
+	  bus (e.g. on PPC)
+endif
diff --git a/package/pcmciautils/pcmciautils.mk 
b/package/pcmciautils/pcmciautils.mk
new file mode 100644
index 0000000..532b5ea
--- /dev/null
+++ b/package/pcmciautils/pcmciautils.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# pcmciautils
+#
+#############################################################
+PCMCIAUTILS_VERSION:=017
+PCMCIAUTILS_SOURCE:=pcmciautils-$(PCMCIAUTILS_VERSION).tar.gz
+PCMCIAUTILS_SITE:=http://www.kernel.org/pub/linux/utils/kernel/pcmcia/
+PCMCIAUTILS_DEPENDENCIES = libsysfs
+
+ifeq ($(BR2_PACKAGE_PCMCIAUTILS_STARTUP),y)
+	BR2_PACKAGE_PCMCIAUTILS_BUILD_STARTUP=true
+else
+	BR2_PACKAGE_PCMCIAUTILS_BUILD_STARTUP=false
+endif
+
+ifeq ($(BR2_PREFER_STATIC),y)
+	BR2_PACKAGE_PCMCIAUTILS_BUILD_STATIC=true
+else
+	BR2_PACKAGE_PCMCIAUTILS_BUILD_STATIC=false
+endif
+
+define PCMCIAUTILS_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C "$(@D)" \
+		STARTUP=$(BR2_PACKAGE_PCMCIAUTILS_BUILD_STARTUP) \
+		UDEV="true" \
+		STATIC=$(BR2_PACKAGE_PCMCIAUTILS_BUILD_STATIC) \
+		DESTDIR="$(TARGET_DIR)" \
+		HOSTCC="$(HOSTCC)" \
+		V="true"
+endef
+
+define PCMCIAUTILS_INSTALL_TARGET_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C "$(@D)" \
+		DESTDIR="$(TARGET_DIR)" \
+		INSTALL="$(INSTALL)" \
+		INSTALL_PROGRAM="$(INSTALL)" \
+		install
+endef
+
+$(eval $(call GENTARGETS,package,pcmciautils))
-- 
1.7.3.1

Hi!

my current mail-provided doesn't play nice with git send-email so I had to 
send using a different mail and then forward with the mail registered to 
buildroot mailing list. Sorry for the delay, this patch have been done for a 
week now.

MvH
Patrik Dahlstr?m
Ordf?rande - http://www.studentfiket.com/
Penga-Mas (Kass?r) - Dalarnas Nation

"Alla djur, utom m?nniskan, vet att livets huvudsakliga mening ?r att njuta av 
det! --Samuel Butler
