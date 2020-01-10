From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Fri, 10 Jan 2020 15:00:17 +0100
Subject: [Buildroot] [PATCH 2/2] nginx-modsecurity: new package
In-Reply-To: <20200110140017.15045-1-frank.vanbever@essensium.com>
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
Message-ID: <20200110140017.15045-2-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the modsecurity-nginx nxinx module.
The name of the package diverges slightly from upstream to maintain
consistency with other nginx modules already present.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/nginx-modsecurity/Config.in              | 10 ++++++++++
 package/nginx-modsecurity/nginx-modsecurity.hash |  4 ++++
 package/nginx-modsecurity/nginx-modsecurity.mk   | 14 ++++++++++++++
 package/nginx/nginx.mk                           |  5 +++++
 6 files changed, 35 insertions(+)
 create mode 100644 package/nginx-modsecurity/Config.in
 create mode 100644 package/nginx-modsecurity/nginx-modsecurity.hash
 create mode 100644 package/nginx-modsecurity/nginx-modsecurity.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 534f4d746c..998347c77d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -957,6 +957,7 @@ F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@essensium.com>
 F:	package/libmodsecurity/
+F:	package/nginx-modsecurity/
 
 N:	Ga?l Portay <gael.portay@collabora.com>
 F:	package/qt5/qt5virtualkeyboard/
diff --git a/package/Config.in b/package/Config.in
index 190cc4217c..03f8cdf891 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2075,6 +2075,7 @@ menu "External nginx modules"
 	source "package/nginx-dav-ext/Config.in"
 	source "package/nginx-naxsi/Config.in"
 	source "package/nginx-upload/Config.in"
+	source "package/nginx-modsecurity/Config.in"
 endmenu
 endif
 	source "package/ngircd/Config.in"
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
new file mode 100644
index 0000000000..cfefefce0c
--- /dev/null
+++ b/package/nginx-modsecurity/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NGINX_MODSECURITY
+	bool "nginx-modsecurity"
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBMODSECURITY
+	help
+	  The ModSecurity-nginx connector is the connection
+	  point between nginx and libmodsecurity
+	  (ModSecurity v3).
+
+	  https://github.com/SpiderLabs/ModSecurity-nginx
diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
new file mode 100644
index 0000000000..d2dd266ac1
--- /dev/null
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -0,0 +1,4 @@
+# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.1/modsecurity-nginx-v1.0.1.tar.gz.sha256
+sha256 def45a8db5bc9da14765eda75363457209a86c89538ccf5bfbd3aa02fa10833c modsecurity-nginx-v1.0.1.tar.gz
+# Localy calculated
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
new file mode 100644
index 0000000000..f1c4106047
--- /dev/null
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# nginx-modsecurity
+#
+################################################################################
+
+NGINX_MODSECURITY_VERSION = 1.0.1
+NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
+NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/$(NGINX_MODSECURITY_VERSION)
+NGINX_MODSECURITY_LICENSE = Apache-2.0
+NGINX_MODSECURITY_LICENSE_FILES = LICENSE
+NGINX_MODSECURITY_DEPENDENCIES = libmodsecurity
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index f895b78779..a9eac57adc 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -250,6 +250,11 @@ NGINX_DEPENDENCIES += nginx-naxsi
 NGINX_CONF_OPTS += --add-module=$(NGINX_NAXSI_DIR)/naxsi_src
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_MODSECURITY),y)
+NGINX_DEPENDENCIES += nginx-modsecurity
+NGINX_CONF_OPTS += --add-module=$(NGINX_MODSECURITY_DIR)
+endif
+
 # Debug logging
 NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
 
-- 
2.20.1
