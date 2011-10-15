From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:33 -0300
Subject: [Buildroot] [PATCH 19/25] wget: bump to version 1.13.4 and
	improvements
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump wget to version 1.13.4
* Enable wget again on !wchar toolchains
* Enable support for gnutls

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/Config.in |    4 ----
 package/wget/wget.mk   |   22 ++++++++++++++++++++--
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 172359c..3877a3a 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
-	depends on BR2_USE_WCHAR
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
 	  http://www.gnu.org/software/wget/
-
-comment "wget requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index c34a51c..b14cd92 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,12 +4,30 @@
 #
 #############################################################
 
-WGET_VERSION = 1.12
+WGET_VERSION = 1.13.4
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 
+# Prefer full-blown wget over busybox
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	WGET_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+	WGET_CONF_OPT += --with-ssl=gnutls \
+		--with-libgnutls-prefix=$(STAGING_DIR)
+	WGET_DEPENDENCIES += gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	WGET_CONF_OPT += --with-ssl --with-libssl-prefix=$(STAGING_DIR)
+	WGET_CONF_OPT += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
 	WGET_DEPENDENCIES += openssl
 endif
 
+# --with-ssl is default
+ifneq ($(BR2_PACKAGE_GNUTLS),y)
+ifneq ($(BR2_PACKAGE_OPENSSL),y)
+	WGET_CONF_OPT += --without-ssl
+endif
+endif
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
