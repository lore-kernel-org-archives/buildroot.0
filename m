From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:44:25 +0200
Subject: [Buildroot] [git commit] php: fpm sapi: install php-fpm.conf
Message-ID: <20150502074429.8B65B7FB2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fc93e20f24d61fa459e84b7f126293d34e7cfe9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install a custom php-fpm.conf instead of the stock one.

- Listening on /var/run/php-fpm.sock instead of TCP port so we can
  restrict access to webserver user www-data.
- Using ondemand pm, so PHP children are only started after a PHP
  request, instead of kept resident all the time.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php-fpm.conf |   14 ++++++++++++++
 package/php/php.mk       |    8 ++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
new file mode 100644
index 0000000..b75a58f
--- /dev/null
+++ b/package/php/php-fpm.conf
@@ -0,0 +1,14 @@
+[www]
+# Only start children when there are requests to be processed
+pm = ondemand
+# Terminate them again after there haven't been any for 2 minutes
+pm.process_idle_timeout = 120s
+# Maximum number of children processing PHP requests concurrently
+pm.max_children = 5
+
+listen = /var/run/php-fpm.sock
+listen.owner = www-data
+listen.group = www-data
+user = www-data
+group = www-data
+
diff --git a/package/php/php.mk b/package/php/php.mk
index 4c65c35..3b9a117 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -264,6 +264,14 @@ define PHP_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib/systemd/system/php-fpm.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/php-fpm.service
 endef
+
+define PHP_INSTALL_FPM_CONF
+	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
+		$(TARGET_DIR)/etc/php-fpm.conf
+	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
 endif
 
 define PHP_EXTENSIONS_FIXUP
