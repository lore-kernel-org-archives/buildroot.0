From: Pierret David <david.pierret@smile.fr>
Date: Mon, 17 Sep 2018 12:21:32 +0200
Subject: [Buildroot] [PATCH 1/2] monkey: bump to version 1.6.9
Message-ID: <40fddeaf-962f-2179-0882-9339d11006c5@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This commit add an option to enable SSL/TLS plugin compilation who is 
not build
by default.
If mbedtls library is selected, she will be used instead of build-in one.

Signed-off-by: David Pierret <david.pierret@gmail.com>
---
  package/monkey/Config.in | 5 +++++
  package/monkey/monkey.mk | 8 ++++++++
  2 files changed, 13 insertions(+)

diff --git a/package/monkey/Config.in b/package/monkey/Config.in
index 9054aa0..ab8bde1 100644
--- a/package/monkey/Config.in
+++ b/package/monkey/Config.in
@@ -17,6 +17,11 @@ config BR2_PACKAGE_MONKEY_SHARED
  	  Build Monkey as a shared library in addition to stand-alone
  	  server

+config BR2_PACKAGE_MONKEY_SSL
+        bool "enable SSL/TLS"
+        help
+          Enable build of the SSL/TLS plugin.
+
  endif

  comment "monkey needs an toolchain w/ threads, dynamic library"
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 58bc26e..4fe5eb2 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -48,6 +48,14 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
  MONKEY_CONF_OPTS += --debug
  endif

+ifeq ($(BR2_PACKAGE_MONKEY_SSL), y)
+MONKEY_CONF_OPTS += --enable-plugins=tls
+# If we already have TLS/SSL library, use it.
+ifeq ($(BR2_PACKAGE_MBEDTLS), y)
+MONKEY_CONF_OPTS += --mbedtls-shared
+endif
+endif
+
  define MONKEY_CONFIGURE_CMDS
  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
  endef
-- 
2.7.4
