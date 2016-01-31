From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 10:40:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/openobex: fix broken download URL,
	add hash
Message-ID: <1454233253-22601-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream only provides a zip file for version 1.5.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openobex/Config.in   |  2 +-
 package/openobex/openobex.mk | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 5f606fe..2b8cf38 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_OPENOBEX
 	  Free open source implementation of the Object Exchange (OBEX)
 	  protocol.
 
-	  http://www.openobex.org
+	  http://sourceforge.net/projects/openobex
 
 if BR2_PACKAGE_OPENOBEX
 
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 82bfd43..b50dbb7 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-OPENOBEX_VERSION = 1.5
-OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
+OPENOBEX_VERSION_MAJOR = 1.5
+OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
+OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
+OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
 # Libraries seems to be released under LGPLv2.1+,
 # while other material is under GPLv2+.
 OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
@@ -15,6 +17,12 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_AUTORECONF = YES
 OPENOBEX_INSTALL_STAGING = YES
 
+define OPENOBEX_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
+	mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
+	$(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
+endef
+
 OPENOBEX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
 	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
-- 
2.7.0
