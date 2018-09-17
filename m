From: Pierret David <david.pierret@smile.fr>
Date: Mon, 17 Sep 2018 12:09:01 +0200
Subject: [Buildroot] [PATCH 2/2] monkey: add option for SSL/TLS plugin
 compilation
Message-ID: <2120fe96-83cd-3d1e-0bfb-e085dafaad36@smile.fr>
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
index 9054aa0..a2496aa 100644
--- a/package/monkey/Config.in
+++ b/package/monkey/Config.in
@@ -19,6 +19,11 @@ config BR2_PACKAGE_MONKEY_SHARED

  endif

+config BR2_PACKAGE_MONKEY_SSL
+        bool "enable SSL/TLS"
+        help
+          Enable build of the SSL/TLS plugin.
+
  comment "monkey needs an toolchain w/ threads, dynamic library"
  	depends on BR2_USE_MMU
  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
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
