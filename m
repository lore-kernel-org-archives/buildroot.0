From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:11 -0000
Subject: [Buildroot] [git commit] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
Message-ID: <20180907111506.187247F950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4f39476fdb2867a05c267c62ee1ac1aaa00e69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds BR2_PACKAGE_PROFTPD_MOD_SFTP support and also
changes the .mk file to add required modules as a list in a
separate variable. This new variable will help in future to add
more module support in proftpd package.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/Config.in  |  6 ++++++
 package/proftpd/proftpd.mk | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index e979d407cf..e7e3c13780 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -20,4 +20,10 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
 	  The mod_redis module enables ProFTPD support for caching
 	  data in Redis servers, using the hiredis client library.
 
+config BR2_PACKAGE_PROFTPD_MOD_SFTP
+	bool "mod_sftp support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Compile ProFTPD with mod_sftp support
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 3e165c6ada..b02320f4c0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -24,7 +24,7 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
-PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
+PROFTPD_MODULES += mod_rewrite
 endif
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REDIS),y)
@@ -34,6 +34,16 @@ else
 PROFTPD_CONF_OPTS += --disable-redis
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP),y)
+PROFTPD_CONF_OPTS += --enable-openssl
+PROFTPD_MODULES += mod_sftp
+PROFTPD_DEPENDENCIES += openssl
+else
+PROFTPD_CONF_OPTS += --disable-openssl
+endif
+
+PROFTPD_CONF_OPTS += --with-modules=$(subst $(space),:,$(PROFTPD_MODULES))
+
 # configure script doesn't handle detection of %llu format string
 # support for printing the file size when cross compiling, breaking
 # access for large files.
