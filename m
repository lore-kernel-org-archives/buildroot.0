From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 12 Apr 2017 11:56:19 +0100
Subject: [Buildroot] [PATCH] proftpd: add mod_redis support
Message-ID: <20170412105619.42833-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mod_redis module enables ProFTPD support for caching data in Redis
servers, using the hiredis client library. This is available since
proftpd-1.3.6rc5 and later.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Note to maintainer: this patch depends on the proftpd-1.3.6 bump:
http://patchwork.ozlabs.org/patch/748931/
---
 package/proftpd/Config.in  | 7 +++++++
 package/proftpd/proftpd.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index dd87eb4..07a5d86 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -13,4 +13,11 @@ config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 	help
 	  Compile ProFTPD with mod_rewrite support
 
+config BR2_PACKAGE_PROFTPD_MOD_REDIS
+	bool "mod_redis support"
+	select BR2_PACKAGE_HIREDIS
+	help
+	  The mod_redis module enables ProFTPD support for caching data in Redis
+	  servers, using the hiredis client library.
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 5f42408..3e165c6 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -27,6 +27,13 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REDIS),y)
+PROFTPD_CONF_OPTS += --enable-redis
+PROFTPD_DEPENDENCIES += hiredis
+else
+PROFTPD_CONF_OPTS += --disable-redis
+endif
+
 # configure script doesn't handle detection of %llu format string
 # support for printing the file size when cross compiling, breaking
 # access for large files.
-- 
2.10.2
