From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  7 Aug 2018 08:34:26 -0500
Subject: [Buildroot] [PATCH] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
Message-ID: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
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
 package/proftpd/Config.in  |  5 +++++
 package/proftpd/proftpd.mk | 18 +++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index e979d40..12b8c93 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -20,4 +20,9 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
 	  The mod_redis module enables ProFTPD support for caching
 	  data in Redis servers, using the hiredis client library.
 
+config BR2_PACKAGE_PROFTPD_MOD_SFTP
+	bool "mod_sftp support"
+	help
+	  Compile ProFTPD with mod_sftp support
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 3e165c6..1ee88a8 100644
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
@@ -34,6 +37,19 @@ else
 PROFTPD_CONF_OPTS += --disable-redis
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP),y)
+PROFTPD_CONF_OPTS += --enable-openssl
+PROFTPD_MODULES += mod_sftp
+endif
+
+#Make ":" separated final modules list
+PROFTPD_MODULES_LIST = \
+	$(shell for l in $(PROFTPD_MODULES); do \
+	modlist=$$modlist$$l:; done \
+	&& echo $${modlist%?})
+
+PROFTPD_CONF_OPTS += --with-modules=$(PROFTPD_MODULES_LIST)
+
 # configure script doesn't handle detection of %llu format string
 # support for printing the file size when cross compiling, breaking
 # access for large files.
-- 
1.9.1
