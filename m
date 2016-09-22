From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Thu, 22 Sep 2016 14:55:18 +0530
Subject: [Buildroot] [PATCH v2 1/2] ustream-ssl: new package
Message-ID: <1474536319-12268-1-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ustream-ssl has support for polarssl and cyassl
but since polarssl is made obsolete by mbedtls and cyassl
is not present in buildroot, we have not added support for it.

Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 Changes v1 -> v2:
   - No changes

 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/ustream-ssl/Config.in      | 12 ++++++++++++
 package/ustream-ssl/ustream-ssl.mk | 20 ++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/ustream-ssl/Config.in
 create mode 100644 package/ustream-ssl/ustream-ssl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 605af96..d85d3db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1158,6 +1158,9 @@ F:	package/gssdp/
 F:	package/gupnp/
 F:	package/gupnp-av/
 
+N:	Rahul Jain <rahul.jain@imgtec.com>
+F:	package/ustream-ssl
+
 N:	Renaud Aubin <root@renaud.io>
 F:	package/libhttpparser/
 
diff --git a/package/Config.in b/package/Config.in
index a9f6bc7..3421fd1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ menu "Crypto"
 	source "package/polarssl/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
+	source "package/ustream-ssl/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
new file mode 100644
index 0000000..540e436
--- /dev/null
+++ b/package/ustream-ssl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_USTREAM_SSL
+	bool "ustream-ssl"
+	depends on !BR2_STATIC_LIBS #libubox
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	help
+	  ustream SSL wrapper
+
+	  https://git.openwrt.org/?p=project/ustream-ssl.git;a=summary
+
+comment "ustream-ssl needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
new file mode 100644
index 0000000..d8f8aed
--- /dev/null
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ustream-ssl
+#
+################################################################################
+
+USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
+USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
+USTREAM_SSL_LICENSE = ISC
+USTREAM_SSL_INSTALL_STAGING = YES
+USTREAM_SSL_DEPENDENCIES = libubox
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+USTREAM_SSL_DEPENDENCIES += mbedtls
+USTREAM_SSL_CONF_OPTS += -DMBEDTLS=ON
+else
+USTREAM_SSL_DEPENDENCIES += openssl
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
