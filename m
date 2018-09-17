From: david.pierret at smile.fr <david.pierret@smile.fr>
Date: Mon, 17 Sep 2018 15:05:49 +0200
Subject: [Buildroot] [PATCH v2 2/2] monkey: add option for SSL/TLS plugin
 compilation
In-Reply-To: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
References: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
Message-ID: <1537189549-26857-2-git-send-email-david.pierret@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Pierret <david.pierret@gmail.com>

This commit add an option to enable SSL/TLS plugin compilation who is not build
by default.

Signed-off-by: David Pierret <david.pierret@gmail.com>

---

Changes v1 -> v2:
  - Always use external libraries
---
 package/monkey/Config.in | 6 ++++++
 package/monkey/monkey.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/monkey/Config.in b/package/monkey/Config.in
index 9054aa0..fdfa148 100644
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
index 58bc26e..427f359 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -48,6 +48,10 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 MONKEY_CONF_OPTS += --debug
 endif
 
+ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
+MONKEY_CONF_OPTS += --enable-plugins=tls --mbedtls-shared
+endif
+
 define MONKEY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
 endef
-- 
2.7.4
