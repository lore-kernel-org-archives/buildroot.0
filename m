From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Aug 2018 13:15:25 -0500
Subject: [Buildroot] [PATCH/Next v2] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
Message-ID: <1534270525-48448-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This patch adds BR2_PACKAGE_PROFTPD_MOD_SFTP support and also
changes the .mk file to add required modules as a list in a
separate variable. This new variable will help in future to add
more module support in proftpd package.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 ->v2
 - Added a disable condition for the BR2_PACKAGE_PROFTPD_MOD_SFTP
   conditional in the .mk
[Baruch
 - Added dependency on openssl and did testpkg runs on libopenssl
   and libressl as the backend
[Thomas P
 - Cleaned up final --with-modules using Thomas's makeish approach
---
 package/proftpd/Config.in  |  6 ++++++
 package/proftpd/proftpd.mk | 15 ++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index e979d40..e7e3c13 100644
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
index 3e165c6..873ccf2 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -23,8 +23,11 @@ PROFTPD_CONF_OPTS = \
 	--enable-shadow \
 	--with-gnu-ld
 
+#Append all required modules in PROFTPD_MODULES variable
+#Use 'space' seperator for more than one module
+#e.g. PROFTPD_MODULES += mod_readme mod_ifsession
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
-PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
+PROFTPD_MODULES = mod_rewrite
 endif
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REDIS),y)
@@ -34,6 +37,16 @@ else
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
-- 
1.9.1
