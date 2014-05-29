From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu, 29 May 2014 17:05:33 +0200
Subject: [Buildroot] [PATCH 1/1] sispmctl: new package
Message-ID: <1401375933-23332-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/Config.in            |    1 +
 package/sispmctl/Config.in   |   11 +++++++++++
 package/sispmctl/sispmctl.mk |   17 +++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/sispmctl/Config.in
 create mode 100644 package/sispmctl/sispmctl.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..594cca4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@ source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/sg3_utils/Config.in"
+source "package/sispmctl/Config.in"
 source "package/smartmontools/Config.in"
 source "package/smstools3/Config.in"
 source "package/snowball-hdmiservice/Config.in"
diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
new file mode 100644
index 0000000..98b3c7d
--- /dev/null
+++ b/package/sispmctl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SISPMCTL
+	bool "sispmctl"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_USE_MMU # fork()
+	help
+	  sispmctl is an application enabling the use of the GEMBIRD SiS-PM 
+	  and mSiS(sispm) USB-controlled power-outlet device under Linux. 
+	  Note that the device is also sold under different Names, i.e. as "IntelliPlug" in Germany.
+	  
+	  http://sispmctl.sourceforge.net/
+
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
new file mode 100644
index 0000000..51de0aa
--- /dev/null
+++ b/package/sispmctl/sispmctl.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# sispmctl
+#
+################################################################################
+
+SISPMCTL_VERSION = 3.1
+SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
+SISPMCTL_LICENSE = GPLv2
+SISPMCTL_LICENSE_FILES = LICENCE
+SISPMCTL_DEPENDENCIES = libusb-compat
+
+SISPMCTL_CONF_ENV = HAVELIBUSB=$(STAGING_DIR)/usr/bin/libusb-config
+SISPMCTL_CONF_OPT = --enable-webless \
+		 --disable-dependency-tracking
+
+$(eval $(autotools-package))
-- 
1.7.10.4
