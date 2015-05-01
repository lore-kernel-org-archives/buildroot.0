From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  1 May 2015 20:12:35 +0200
Subject: [Buildroot] [PATCH v2 3/3] lighttpd: add option to enable php-fpm
	configuration
In-Reply-To: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1430503955-24928-4-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If both lighttpd and php-fpm are selected, offer to
enable PHP in the lighttpd configuration.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/lighttpd/Config.in    | 20 ++++++++++++++++++++
 package/lighttpd/fastcgi.conf |  2 ++
 package/lighttpd/lighttpd.mk  | 11 +++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/lighttpd/fastcgi.conf

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 2c101e7..e984ef8 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -56,4 +56,24 @@ config BR2_PACKAGE_LIGHTTPD_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+config BR2_PACKAGE_LIGHTTPD_PHP_FPM
+	bool "enable php in configuration"
+	depends on BR2_PACKAGE_PHP
+	depends on BR2_PACKAGE_PHP_FPM
+	default "y"
+	help
+	  Configure lighttpd to handle PHP requests through php-fpm.
+
+	  Also enables allow-x-send-file, allowing you to offload static file sending
+	  to lighttpd with PHP code like:
+
+	  header("X-Send-File: /path/to/file");
+
+	  This is a necessity for letting the user download larger files, as
+	  lighttpd buffers all PHP script output infinitely to memory, and
+	  may run out if you use the normal readfile() method to output files.
+
+comment "php support depends on php with FPM sapi"
+	depends on !BR2_PACKAGE_PHP || !BR2_PACKAGE_PHP_FPM
+
 endif
diff --git a/package/lighttpd/fastcgi.conf b/package/lighttpd/fastcgi.conf
new file mode 100644
index 0000000..46c5f9a
--- /dev/null
+++ b/package/lighttpd/fastcgi.conf
@@ -0,0 +1,2 @@
+server.modules += ( "mod_fastcgi" )
+fastcgi.server  = ( ".php" => (( "socket" => "/var/run/php-fpm.sock", "allow-x-send-file" => "enable" )) )
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 626cd69..16ca88b 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -77,6 +77,17 @@ endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_PHP_FPM),y)
+define LIGHTTPD_INSTALL_FASTCGI_CONFIG
+	$(INSTALL) -D -m 0644 package/lighttpd/fastcgi.conf \
+		$(TARGET_DIR)/etc/lighttpd/conf.d/fastcgi.conf
+	$(SED) '/#include \"conf.d\/fastcgi.conf\"/s/^#//' \
+		$(TARGET_DIR)/etc/lighttpd/modules.conf
+endef
+
+LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_FASTCGI_CONFIG
+endif
+
 define LIGHTTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lighttpd/S50lighttpd \
 		$(TARGET_DIR)/etc/init.d/S50lighttpd
-- 
2.1.4
