From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:33:40 +0100
Subject: [Buildroot] [git commit] nginx-dav-ext: new package
Message-ID: <20161204223547.EC5DA8180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e58ae36520f0109bbc171e0cc3872d2b0d1be610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nginx built-in support for webdav is missing support for two commands:
PROPFIND and OPTIONS. This commit adds a new package that provides an
external nginx module with improved webdav support.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas:
 - Remove the BR2_PACKAGE_NGINX_HTTP_DAV_EXT_MODULE sub-option of the
   nginx package. The BR2_PACKAGE_NGINX_DAV_EXT option is sufficient.
 - Move the nginx.mk code together with another external module being
   enabled, nginx-upload.
 - Add LICENSE and LICENSE_FILES variables.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/nginx-dav-ext/Config.in          |  7 +++++++
 package/nginx-dav-ext/nginx-dav-ext.hash |  2 ++
 package/nginx-dav-ext/nginx-dav-ext.mk   | 13 +++++++++++++
 package/nginx/nginx.mk                   |  5 +++++
 5 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ecb8afb..664d0d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1545,6 +1545,7 @@ menu "Networking applications"
 	source "package/nginx/Config.in"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
+	source "package/nginx-dav-ext/Config.in"
 	source "package/nginx-naxsi/Config.in"
 	source "package/nginx-upload/Config.in"
 endmenu
diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
new file mode 100644
index 0000000..bf197dc
--- /dev/null
+++ b/package/nginx-dav-ext/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NGINX_DAV_EXT
+	bool "nginx-dav-ext"
+	select BR2_PACKAGE_EXPAT
+	help
+	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
+
+	  https://github.com/arut/nginx-dav-ext-module
diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
new file mode 100644
index 0000000..ea7eb86
--- /dev/null
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d  nginx-dav-ext-v0.0.3.tar.gz
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
new file mode 100644
index 0000000..61e5bd0
--- /dev/null
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# nginx-dav-ext
+#
+################################################################################
+
+NGINX_DAV_EXT_VERSION = v0.0.3
+NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
+NGINX_DAV_EXT_LICENSE = BSD-2c
+NGINX_DAV_EXT_LICENSE_FILES = ngx_http_dav_ext_module.c
+NGINX_DAV_EXT_DEPENDENCIES = expat
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6563627..79cc4ed 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -245,6 +245,11 @@ NGINX_CONF_OPTS += $(addprefix --add-module=,$(NGINX_UPLOAD_DIR))
 NGINX_DEPENDENCIES += nginx-upload
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_DAV_EXT),y)
+NGINX_CONF_OPTS += --add-module=$(NGINX_DAV_EXT_DIR)
+NGINX_DEPENDENCIES += nginx-dav-ext
+endif
+
 # Debug logging
 NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
 
