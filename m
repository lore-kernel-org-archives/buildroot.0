From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Tue, 18 Jun 2013 12:22:51 +0200
Subject: [Buildroot] [PATCH] libqmi: new package
Message-ID: <51C034FB.3010605@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libqmi is a glib-based library for talking to WWAN modems and devices which
speak the Qualcomm MSM Interface (QMI) protocol.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---
 package/Config.in        |  1 +
 package/libqmi/Config.in |  6 ++++++
 package/libqmi/libqmi.mk | 24 ++++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/libqmi/Config.in
 create mode 100644 package/libqmi/libqmi.mk

diff --git a/package/Config.in b/package/Config.in
index 5b066dc..426004b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
+source "package/libqmi/Config.in"
 source "package/libserial/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
new file mode 100644
index 0000000..d15025d
--- /dev/null
+++ b/package/libqmi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBQMI
+	bool "libqmi"
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libqmi is a glib-based library for talking to WWAN modems and devices
+	  which speak the Qualcomm MSM Interface (QMI) protocol.
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
new file mode 100644
index 0000000..b343eba
--- /dev/null
+++ b/package/libqmi/libqmi.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libqmi
+#
+################################################################################
+
+LIBQMI_VERSION = 1.4.0
+LIBQMI_SITE    = http://cgit.freedesktop.org/libqmi/snapshot/
+LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.gz
+LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
+LIBQMI_LICENSE_FILES = COPYING
+LIBQMI_INSTALL_STAGING = YES
+LIBQMI_AUTORECONF = YES
+
+LIBQMI_DEPENDENCIES += libglib2
+
+define LIBQMI_CREATE_GTK_DOC_MAKE
+	$(RM) $(@D)/gtk-doc.make
+	echo -e "EXTRA_DIST =\nCLEANFILES =" > $(@D)/gtk-doc.make
+endef
+
+LIBQMI_POST_PATCH_HOOKS += LIBQMI_CREATE_GTK_DOC_MAKE
+
+$(eval $(autotools-package))
-- 
1.8.1.2


-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
