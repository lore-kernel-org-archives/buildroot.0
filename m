From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:54:41 +0100
Subject: [Buildroot] [git commit branch/next] ustream-ssl: new package
Message-ID: <20161105223210.2C0C881735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdb8f8231b0418c91bb800b59afa89f182a36081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ustream-ssl has support for polarssl and cyassl
but since polarssl is made obsolete by mbedtls and cyassl
is not present in buildroot, we have not added support for it.

Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/ustream-ssl/Config.in      | 12 ++++++++++++
 package/ustream-ssl/ustream-ssl.mk | 21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..a24110e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -912,6 +912,7 @@ menu "Crypto"
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
index 0000000..b83d129
--- /dev/null
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ustream-ssl
+#
+################################################################################
+
+USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
+USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
+USTREAM_SSL_LICENSE = ISC
+USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
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
