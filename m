From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 21:56:07 -0300
Subject: [Buildroot] [PATCH] strongswan: bump to version 5.2.1
Message-ID: <1418691367-12528-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/Config.in       | 17 +++++++++++++----
 package/strongswan/strongswan.hash |  2 ++
 package/strongswan/strongswan.mk   |  9 ++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 package/strongswan/strongswan.hash

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 3b0f47f..c1b7f41 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -110,13 +110,22 @@ config BR2_PACKAGE_STRONGSWAN_SQL
 
 endif
 
-config BR2_PACKAGE_STRONGSWAN_TOOLS
-	bool "Enable additional utilities (openac, scepclient and pki)"
+config BR2_PACKAGE_STRONGSWAN_PKI
+	bool "Enable pki certificate utility"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_SCEP
+	bool "Enable SCEP client tool"
 	default y
 
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
-	bool "Enable additional utilities (found in directory scripts)"
-	depends on BR2_PACKAGE_STRONGSWAN_CHARON || BR2_PACKAGE_STRONGSWAN_TOOLS
+	bool "Enable additional utilities (found in scripts directory)"
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_VICI
+	bool "Enable vici/swanctl"
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 	default y
 
 endif
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
new file mode 100644
index 0000000..f434530
--- /dev/null
+++ b/package/strongswan/strongswan.hash
@@ -0,0 +1,2 @@
+# From http://download.strongswan.org/strongswan-5.2.1.tar.bz2.md5
+md5	dd3717c0aa59ab4591ca1812941ebb82	strongswan-5.2.1.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index bb1d268..f1fe3cc 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.1.3
+STRONGSWAN_VERSION = 5.2.1
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
@@ -28,8 +28,11 @@ STRONGSWAN_CONF_OPTS +=
 	--enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
 	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
 	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
-	--enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no)                  \
-	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
+	--enable-pki=$(if $(BR2_PACKAGE_STRONGSWAN_PKI),yes,no)                      \
+	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no)              \
+	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)              \
+	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)                    \
+	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
 STRONGSWAN_CONF_OPTS +=               \
-- 
2.0.4
