From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 22:49:56 +0200
Subject: [Buildroot] [git commit] nginx-nasxi: new package
Message-ID: <20160715205157.3CD5282257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f299f02b20fb9d194d3ca583fb702b39c346b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Naxsi is a third party nginx module reads a small subset of simple rules
containing a list of known patterns involved in website vulnerabilities.
This module behaves like a DROP-by-default firewall for nginx.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas:
 - include Config.in file directly from package/Config.in and not from
   package/nginx/Config.
 - improve Config.in help text with more details
 - rename the package prompt from ngx_http_naxsi_module to nginx-naxsi
 - remove NGINX_NAXSI_SOURCE, and fix the definition of
   NGINX_NAXSI_SITE
 - change license from GPLv3 to GPLv2+ with OpenSSL exception
 - cange license file from LICENSE to naxsi_src/naxsi_json.c. The
   LICENSE file exists in the latest Git master of the project, but
   not in the 0.54 tag that we're packaging.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/nginx-naxsi/Config.in        | 26 ++++++++++++++++++++++++++
 package/nginx-naxsi/nginx-naxsi.hash |  2 ++
 package/nginx-naxsi/nginx-naxsi.mk   | 12 ++++++++++++
 package/nginx/nginx.mk               |  5 +++++
 5 files changed, 46 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7756a4c..fe6ca65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1501,6 +1501,7 @@ menu "Networking applications"
 	source "package/nginx/Config.in"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
+	source "package/nginx-naxsi/Config.in"
 	source "package/nginx-upload/Config.in"
 endmenu
 endif
diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
new file mode 100644
index 0000000..2f7c2da
--- /dev/null
+++ b/package/nginx-naxsi/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_NGINX_NAXSI
+	bool "nginx-naxsi"
+	help
+	  NAXSI means Nginx Anti XSS & SQL Injection.
+
+	  Technically, it is a third party nginx module, available as
+	  a package for many UNIX-like platforms. This module, by
+	  default, reads a small subset of simple (and readable) rules
+	  containing 99% of known patterns involved in website
+	  vulnerabilities. For example, <, | or drop are not supposed
+	  to be part of a URI.
+
+	  Being very simple, those patterns may match legitimate
+	  queries, it is the Naxsi's administrator duty to add
+	  specific rules that will whitelist legitimate
+	  behaviours. The administrator can either add whitelists
+	  manually by analyzing nginx's error log, or (recommended)
+	  start the project with an intensive auto-learning phase that
+	  will automatically generate whitelisting rules regarding a
+	  website's behaviour.
+
+	  In short, Naxsi behaves like a DROP-by-default firewall, the
+	  only task is to add required ACCEPT rules for the target
+	  website to work properly.
+
+	  https://github.com/nbs-system/naxsi
diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
new file mode 100644
index 0000000..238993e
--- /dev/null
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9cc2c09405bc71f78ef26a8b6d70afcea3fccbe8125df70cb0cfc480133daba5	nginx-naxsi-0.54.tar.gz
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
new file mode 100644
index 0000000..0e1f714
--- /dev/null
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nginx-naxsi
+#
+################################################################################
+
+NGINX_NAXSI_VERSION = 0.54
+NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
+NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
+NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 018d0f8..d57f3d0 100644
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
