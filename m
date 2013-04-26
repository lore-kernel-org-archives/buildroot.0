From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 26 Apr 2013 12:25:48 +0100
Subject: [Buildroot] [PATCH] neard: add support for tools
Message-ID: <1366975548-23606-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neard/Config.in |    6 ++++++
 package/neard/neard.mk  |    4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index bcf6171..ec1fcb3 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -14,5 +14,11 @@ config BR2_PACKAGE_NEARD
 
 	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
 
+config BR2_PACKAGE_NEARD_TOOLS
+	bool "neard tools"
+	depends on BR2_PACKAGE_NEARD
+	help
+	  Build and install neard tools.
+
 comment "neard requires a toolchain with WCHAR and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 056875c..cc6aeac 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -13,4 +13,8 @@ NEARD_AUTORECONF = YES
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
 NEARD_CONF_OPT = --disable-traces
 
+ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
+	NEARD_CONF_OPT += --enable-tools
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
