From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:59:35 +0200
Subject: [Buildroot] [git commit] proftpd: add mod_redis support
Message-ID: <20170412201132.D6C327FCA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=818c794dec03bbbd42d7e6514e8b556f9c33d8cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mod_redis module enables ProFTPD support for caching data in Redis
servers, using the hiredis client library. This is available since
proftpd-1.3.6rc5 and later.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
