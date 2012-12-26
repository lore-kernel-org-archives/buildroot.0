From: Marcin Bis <marcin@bis.org.pl>
Date: Wed, 26 Dec 2012 09:55:47 +0100
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <20121226094937.3c2b9383@skate>
References: <CAOPBCFULJTm7iooZ8=nnpMoooaRq=1PK11hhYyyGVr=DdM2e2w@mail.gmail.com>
 <20121226070612.GC7402@sapphire.tkos.co.il>
 <20121226094937.3c2b9383@skate>
Message-ID: <CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/Config.in       |    1 +
 package/usbip/Config.in |   33 +++++++++++++++++++++++++++++++++
 package/usbip/usbip.mk  |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d556b2..c773c46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
+source "package/usbip/Config.in"
 source "package/ushare/Config.in"
 source "package/vde2/Config.in"
 source "package/vpnc/Config.in"
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000..7abf1d1
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_USBIP
+	bool "usbip"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSYSFS
+	help
+	  Userspace tools for sharing USB devices over TCP/IP network.
+
+	  http://usbip.sourceforge.net/
+
+	  Depends on glib.
+
+	  Note: For exporting or connecting to exported USB devices
+	  additional kernel drivers are needed (available since 2.6.28
+	  under Stagging).
+
+comment "usbip requires a toolchain with WCHAR support"
+        depends on !BR2_USE_WCHAR
+
+if BR2_PACKAGE_USBIP
+
+config BR2_USBIP_CLIENT
+	bool "usbip client"
+	default y
+	help
+	  the client part of usbip
+
+config BR2_USBIP_SERVER
+	bool "usbip server"
+	help
+	  the server part of usbip
+
+endif
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000..d1f7021
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# usbip
+#
+#############################################################
+
+USBIP_VERSION = 0.1.7
+USBIP_SITE = http://downloads.sourceforge.net/project/usbip/usbip/$(USBIP_VERSION)
+USBIP_LICENSE = GPLv2+
+USBIP_LICENSE_FILES = COPYING
+USBIP_CONF_OPT = --without-tcpwrappers
+USBIP_DEPENDENCIES = libglib2 libsysfs
+
+#The userspace applications are in the src/ subdirectory.
+USBIP_SUBDIR = src
+#Running autogen.sh is needed to create configure script.
+USBIP_AUTORECONF = YES
+
+ifneq ($(BR2_USBIP_CLIENT),y)
+        USBIP_TOREMOVE += usbip
+endif
+ifneq ($(BR2_USBIP_SERVER),y)
+        USBIP_TOREMOVE += usbipd bind_driver
+endif
+
+define USBIP_CLEANUP_AFTER_INSTALL
+        rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(USBIP_TOREMOVE))
+endef
+
+USBIP_POST_INSTALL_TARGET_HOOKS += USBIP_CLEANUP_AFTER_INSTALL
+
+$(eval $(autotools-package))
