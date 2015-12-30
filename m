From: Juha Rantanen <juha@codercoded.com>
Date: Wed, 30 Dec 2015 17:16:23 +0200
Subject: [Buildroot] [PATCH v2] ACS CCID PC/SC Driver added.
In-Reply-To: <1451475203-23925-2-git-send-email-juha@codercoded.com>
References: <1451475203-23925-2-git-send-email-juha@codercoded.com>
Message-ID: <1451488583-1546-1-git-send-email-juha@codercoded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for acsccid.

Signed-off-by: Juha Rantanen <juha@codercoded.com>
---
Changes v1 -> v2:
  - syntax fixes
  - removed flex and perl deps
  - libusb optional
  - added license

 package/Config.in          |  1 +
 package/acsccid/Config.in  | 12 ++++++++++++
 package/acsccid/acsccid.mk | 22 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/acsccid/Config.in
 create mode 100644 package/acsccid/acsccid.mk

diff --git a/package/Config.in b/package/Config.in
index ef03632..25e574f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -907,6 +907,7 @@ menu "Graphics"
 endmenu
 
 menu "Hardware handling"
+	source "package/acsccid/Config.in"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
new file mode 100644
index 0000000..b5af1d0
--- /dev/null
+++ b/package/acsccid/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ACSCCID
+	bool "acsccid"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  acsccid is a PC/SC driver for Linux/Mac OS X and it supports ACS CCID
+	  smart card readers.
+
+	  http://acsccid.sourceforge.net/
+
+comment "acsccid needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
new file mode 100644
index 0000000..3d24414
--- /dev/null
+++ b/package/acsccid/acsccid.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# acsccid
+#
+################################################################################
+
+ACSCCID_VERSION = 1.1.1
+ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
+ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
+ACSCCID_LICENSE = LGPLv2.1+
+ACSCCID_LICENSE_FILES = COPYING
+ACSCCID_INSTALL_STAGING = YES
+ACSCCID_DEPENDENCIES = pcsc-lite host-perl host-flex host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+ACSCCID_DEPENDENCIES += libusb
+ACSCCID_CONF_OPTS += --enable-libusb
+else
+ACSCCID_CONF_OPTS += --disable-libusb
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
