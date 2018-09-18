From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:41:15 +0200
Subject: [Buildroot] [git commit] monkey: add option for SSL/TLS plugin
 compilation
Message-ID: <20180918194858.CA754884F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca5ae83ccb7237e00d47cb4251ad2735012ae786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add an option to enable SSL/TLS plugin compilation who is
not build by default.

Signed-off-by: David Pierret <david.pierret@gmail.com>
[Thomas: add missing dependency on mbedtls.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monkey/Config.in | 6 ++++++
 package/monkey/monkey.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/monkey/Config.in b/package/monkey/Config.in
index 9054aa05c2..fdfa1481e4 100644
--- a/package/monkey/Config.in
+++ b/package/monkey/Config.in
@@ -17,6 +17,12 @@ config BR2_PACKAGE_MONKEY_SHARED
 	  Build Monkey as a shared library in addition to stand-alone
 	  server
 
+config BR2_PACKAGE_MONKEY_SSL
+	bool "enable SSL/TLS"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Enable build of the SSL/TLS plugin.
+
 endif
 
 comment "monkey needs an toolchain w/ threads, dynamic library"
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 58bc26e685..b75765553b 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -48,6 +48,11 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 MONKEY_CONF_OPTS += --debug
 endif
 
+ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
+MONKEY_CONF_OPTS += --enable-plugins=tls --mbedtls-shared
+MONKEY_DEPENDENCIES += mbedtls
+endif
+
 define MONKEY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
 endef
