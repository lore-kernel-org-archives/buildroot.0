From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 11 Jul 2016 13:56:16 -0400
Subject: [Buildroot] [PATCH 1/1] package/nginx: Add naxsi module option.
Message-ID: <1468259776-26584-1-git-send-email-aduskett@codeblue.com>
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
module, this option only seems to work for a local file url.  As such
a EXTRA_DOWNLOADS and POST_EXTRACT_HOOKS was added to the makefile
so that the module is first downloaded and then extracted into the
nginx source directory, and then the module source is added to the
config options.  This was the cleanest solution I could find, if anybody
thinks of a cleaner solution please let me know.

The hash for the module was also added to nginx.hash.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/nginx/Config.in  |  5 +++++
 package/nginx/nginx.hash |  1 +
 package/nginx/nginx.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..17c6c79 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -188,6 +188,11 @@ config BR2_PACKAGE_NGINX_HTTP_MAP_MODULE
 	help
 	  Enable ngx_http_map_module
 
+config BR2_PACKAGE_NGINX_HTTP_NAXSI_MODULE
+	bool "ngx_http_naxsi_module"
+	help
+	  Enable ngx_http_naxsi_module
+
 config BR2_PACKAGE_NGINX_HTTP_SPLIT_CLIENTS_MODULE
 	bool "ngx_http_split_clients_module"
 	default y
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index c4b0f89..922f16c 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256	1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801	nginx-1.10.1.tar.gz
+sha256	9cc2c09405bc71f78ef26a8b6d70afcea3fccbe8125df70cb0cfc480133daba5	0.54.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5eb5488..a593c54 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -156,6 +156,14 @@ else
 NGINX_CONF_OPTS += --without-http_gzip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_NAXSI_MODULE),y)
+NGINX_HTTP_NAXSI_MODULE_VERSION = 0.54
+NGINX_HTTP_NAXSI_MODULE_SOURCE = $(NGINX_HTTP_NAXSI_MODULE_VERSION).tar.gz
+NGINX_EXTRA_DOWNLOADS = $(call github,nbs-system,naxsi,$(NGINX_HTTP_NAXSI_MODULE_SOURCE))
+NGINX_POST_EXTRACT_HOOKS += NGINX_NAXSI_EXTRACT
+NGINX_CONF_OPTS += $(addprefix --add-module=,$(call qstrip,$(@D)/naxsi-$(NGINX_HTTP_NAXSI_MODULE_VERSION)/naxsi_src))
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
 NGINX_DEPENDENCIES += pcre
 else
@@ -241,6 +249,12 @@ define NGINX_DISABLE_WERROR
 	$(SED) 's/-Werror//g' -i $(@D)/auto/cc/*
 endef
 
+define NGINX_NAXSI_EXTRACT
+	$(call suitable-extractor,$(notdir $(NGINX_EXTRA_DOWNLOADS))) \
+		$(DL_DIR)/$(notdir $(NGINX_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+
 NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
 
 define NGINX_CONFIGURE_CMDS
-- 
2.7.4
