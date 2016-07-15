From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 15 Jul 2016 13:45:12 -0400
Subject: [Buildroot] [v3 1/1] package/nginx: Add naxsi module option.
Message-ID: <1468604712-1264-1-git-send-email-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Naxsi is a third party nginx module reads a small subset of simple rules
containing a list of known patterns involved in website vulnerabilities.
This module behaves like a DROP-by-default firewall for nginx.

The reason for the changes to the make file was because naxsi is listed
on github, and even though there is a option to specify a url for a 3rd party
module, this option only seems to work for a local file url.

As such a new comment was added to the menu for external modules, and a new
package that downloads and extracts the module was added under
package/nginx-naxsi.  This is then used with a pre-configure hook to create
a soft symbolic link to the source inside of the nginx-source tree.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
Changes:

v2 - v3:
 - package/nginx-naxsi/Config.in: 
      - Added url to the help section.
 - package/nginx-naxsi/nginx-naxsi.mk:
      - Added Title comment
      - Added licensing
 - package/nginx/nginx.mk: 
      - Removed uneeded pre_configure hook.
      - Nginx now links the module directly from the extractes source

v1 - v2:
 - Moved naxsi module into a seperate package.

 package/nginx-naxsi/Config.in        |  5 +++++
 package/nginx-naxsi/nginx-naxsi.hash |  1 +
 package/nginx-naxsi/nginx-naxsi.mk   | 13 +++++++++++++
 package/nginx/Config.in              |  3 +++
 package/nginx/nginx.mk               |  5 +++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/nginx-naxsi/Config.in
 create mode 100644 package/nginx-naxsi/nginx-naxsi.hash
 create mode 100644 package/nginx-naxsi/nginx-naxsi.mk

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
new file mode 100644
index 0000000..bdcd16d
--- /dev/null
+++ b/package/nginx-naxsi/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_NGINX_NAXSI
+	bool "ngx_http_naxsi_module"
+	help
+	  Enable ngx_http_naxsi_module
+	  https://github.com/nbs-system/naxsi
diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
new file mode 100644
index 0000000..dd7f5cd
--- /dev/null
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -0,0 +1 @@
+sha256	9cc2c09405bc71f78ef26a8b6d70afcea3fccbe8125df70cb0cfc480133daba5	0.54.tar.gz
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
new file mode 100644
index 0000000..6949f30
--- /dev/null
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# nginx-naxsi
+#
+################################################################################
+
+NGINX_NAXSI_VERSION = 0.54
+NGINX_NAXSI_SOURCE = $(NGINX_NAXSI_VERSION).tar.gz
+NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_SOURCE))
+NGINX_NAXSI_LICENSE = GPLv3
+NGINX_NAXSI_LICENSE_FILES = LICENSE
+
+$(eval $(generic-package))
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..c1a3394 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -380,4 +380,7 @@ config BR2_PACKAGE_NGINX_ADD_MODULES
 	help
 	  Space separated list of urls of the additional modules
 
+comment "external modules"
+	source "package/nginx-naxsi/Config.in"
+
 endif
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5eb5488..70ed58e 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -156,6 +156,11 @@ else
 NGINX_CONF_OPTS += --without-http_gzip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_NAXSI),y)
+NGINX_DEPENDENCIES += nginx-naxsi
+NGINX_CONF_OPTS += --add-module=$(NGINX_NAXSI_DIR)/naxsi_src
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
 NGINX_DEPENDENCIES += pcre
 else
-- 
2.7.4
