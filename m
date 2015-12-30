From: Juha Rantanen <juha@codercoded.com>
Date: Wed, 30 Dec 2015 13:33:23 +0200
Subject: [Buildroot] [PATCH 1/1] ACS CCID PC/SC Driver added.
In-Reply-To: <1451475203-23925-1-git-send-email-juha@codercoded.com>
References: <1451475203-23925-1-git-send-email-juha@codercoded.com>
Message-ID: <1451475203-23925-2-git-send-email-juha@codercoded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Juha Rantanen <juha@codercoded.com>
---
 package/Config.in          |  1 +
 package/acsccid/Config.in  | 11 +++++++++++
 package/acsccid/acsccid.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/acsccid/Config.in
 create mode 100644 package/acsccid/acsccid.mk

diff --git a/package/Config.in b/package/Config.in
index bc6099d..c35cf17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -906,6 +906,7 @@ menu "Graphics"
 endmenu
 
 menu "Hardware handling"
+	source "package/acsccid/Config.in"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
new file mode 100644
index 0000000..9635a99
--- /dev/null
+++ b/package/acsccid/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ACSCCID
+    bool "acsccid"
+    depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+    select BR2_PACKAGE_PCSC_LITE
+    select BR2_PACKAGE_LIBUSB
+    select BR2_PACKAGE_FLEX
+    select BR2_PACKAGE_PERL
+    help
+      acsccid is a PC/SC driver for Linux/Mac OS X and it supports ACS CCID smart card readers.
+
+      http://acsccid.sourceforge.net/
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
new file mode 100644
index 0000000..1325e73
--- /dev/null
+++ b/package/acsccid/acsccid.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# acsccid
+#
+#############################################################
+ACSCCID_VERSION = 1.1.1
+ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
+ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
+ACSCCID_INSTALL_STAGING = YES
+ACSCCID_INSTALL_TARGET = YES
+ACSCCID_CONF_OPTS = --enable-shared
+ACSCCID_DEPENDENCIES = pcsc-lite libusb flex perl host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.1.4
