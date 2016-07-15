From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 22:22:39 +0200
Subject: [Buildroot] [git commit] nginx-upload: new package
Message-ID: <20160715202434.DBFE282257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e103967d6fd7653464041c3589b11a64e48b58c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A module for nginx web server for handling file uploads using
multipart/form-data encoding (RFC 1867).

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - rename from nginx-upload-module to nginx-upload. Indeed, we don't
   want all nginx modules to be suffixed with "-module"
 - include the module Config.in file directly from package/Config.in,
   like we do for Python, Perl, Lua or TCL modules.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  5 +++++
 package/nginx-upload/Config.in         |  8 ++++++++
 package/nginx-upload/nginx-upload.hash |  2 ++
 package/nginx-upload/nginx-upload.mk   | 13 +++++++++++++
 package/nginx/nginx.mk                 |  6 ++++++
 5 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index da7b855..7756a4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1499,6 +1499,11 @@ menu "Networking applications"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
+if BR2_PACKAGE_NGINX
+menu "External nginx modules"
+	source "package/nginx-upload/Config.in"
+endmenu
+endif
 	source "package/ngircd/Config.in"
 	source "package/ngrep/Config.in"
 	source "package/nload/Config.in"
diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
new file mode 100644
index 0000000..b4ee71c
--- /dev/null
+++ b/package/nginx-upload/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NGINX_UPLOAD
+	bool "nginx-upload"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A module for nginx web server for handling file uploads
+	  using multipart/form-data encoding (RFC 1867).
+
+	  https://github.com/vkholodkov/nginx-upload-module
diff --git a/package/nginx-upload/nginx-upload.hash b/package/nginx-upload/nginx-upload.hash
new file mode 100644
index 0000000..4fc4347
--- /dev/null
+++ b/package/nginx-upload/nginx-upload.hash
@@ -0,0 +1,2 @@
+#Locally Computed:
+sha256 8cd1d9d968ffba807de2e546ea9cad5e1ae294ec60b4927b2d60a98bdb4a1144  nginx-upload-aba1e3f34c754551f4f49e572bc86863d535609d.tar.gz
diff --git a/package/nginx-upload/nginx-upload.mk b/package/nginx-upload/nginx-upload.mk
new file mode 100644
index 0000000..6f94d35
--- /dev/null
+++ b/package/nginx-upload/nginx-upload.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# nginx-upload
+#
+################################################################################
+
+NGINX_UPLOAD_VERSION = aba1e3f34c754551f4f49e572bc86863d535609d
+NGINX_UPLOAD_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_VERSION))
+NGINX_UPLOAD_LICENSE = BSD-3c
+NGINX_UPLOAD_LICENSE_FILES = LICENCE
+NGINX_UPLOAD_DEPENDENCIES = openssl
+
+$(eval $(generic-package))
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5eb5488..018d0f8 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -234,6 +234,12 @@ NGINX_CONF_OPTS += \
 
 endif # BR2_PACKAGE_NGINX_STREAM
 
+# external modules
+ifeq ($(BR2_PACKAGE_NGINX_UPLOAD),y)
+NGINX_CONF_OPTS += $(addprefix --add-module=,$(NGINX_UPLOAD_DIR))
+NGINX_DEPENDENCIES += nginx-upload
+endif
+
 # Debug logging
 NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
 
