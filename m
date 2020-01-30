From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2020 11:26:53 +0100
Subject: [Buildroot] [git commit] package/nginx-modsecurity: new package
Message-ID: <20200130102513.3CCE284F15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d35873ab0ce5921974239354f8c6e1b4ccc6e565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The name of the package diverges slightly from upstream to maintain
consistency with other nginx modules already present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/nginx-modsecurity/Config.in              | 15 +++++++++++++++
 package/nginx-modsecurity/nginx-modsecurity.hash |  4 ++++
 package/nginx-modsecurity/nginx-modsecurity.mk   | 14 ++++++++++++++
 package/nginx/nginx.mk                           |  5 +++++
 6 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 513afd32e5..e0a85579ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -957,6 +957,7 @@ F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@essensium.com>
 F:	package/libmodsecurity/
+F:	package/nginx-modsecurity/
 
 N:	Ga??l Portay <gael.portay@collabora.com>
 F:	package/qt5/qt5virtualkeyboard/
diff --git a/package/Config.in b/package/Config.in
index c4e89d3ff3..7c1a2aa7bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2077,6 +2077,7 @@ menu "Networking applications"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
 	source "package/nginx-dav-ext/Config.in"
+	source "package/nginx-modsecurity/Config.in"
 	source "package/nginx-naxsi/Config.in"
 	source "package/nginx-upload/Config.in"
 endmenu
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
new file mode 100644
index 0000000000..68f6a81045
--- /dev/null
+++ b/package/nginx-modsecurity/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NGINX_MODSECURITY
+	bool "nginx-modsecurity"
+	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
+	depends on !BR2_STATIC_LIBS # libmodsecurity
+	select BR2_PACKAGE_PCRE # libmodsecurity
+	select BR2_PACKAGE_LIBMODSECURITY
+	help
+	  The ModSecurity-nginx connector is the connection
+	  point between nginx and libmodsecurity
+	  (ModSecurity v3).
+
+	  https://github.com/SpiderLabs/ModSecurity-nginx
+
+comment "nginx-modsecurity needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
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
index 0000000000..6d33403d66
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
+NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
+NGINX_MODSECURITY_LICENSE = Apache-2.0
+NGINX_MODSECURITY_LICENSE_FILES = LICENSE
+NGINX_MODSECURITY_DEPENDENCIES = libmodsecurity
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 59fddbb42e..5c828d3bb0 100644
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
 
