From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Mon,  2 May 2016 10:37:56 +0000
Subject: [Buildroot] [PATCH 1/1] eja: new package (revised)
Message-ID: <1462185476-18775-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 package/Config.in     |  1 +
 package/eja/Config.in |  7 +++++++
 package/eja/eja.hash  |  2 ++
 package/eja/eja.mk    | 30 ++++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/eja/Config.in
 create mode 100644 package/eja/eja.hash
 create mode 100644 package/eja/eja.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..29eafb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,6 +476,7 @@ endif
 endmenu
 
 menu "Interpreter languages and scripting"
+	source "package/eja/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
diff --git a/package/eja/Config.in b/package/eja/Config.in
new file mode 100644
index 0000000..d15b75c
--- /dev/null
+++ b/package/eja/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EJA
+	bool "eja"
+	help
+	  eja is a forking and Lua extensible micro web server that can
+	  serve static and dynamic generated content.
+
+	  http://github.com/ubaldus/eja
diff --git a/package/eja/eja.hash b/package/eja/eja.hash
new file mode 100644
index 0000000..888dedd
--- /dev/null
+++ b/package/eja/eja.hash
@@ -0,0 +1,2 @@
+#locally computed
+sha256 5354ca3d353b8e3696eecc1b224898b1f9af5ac0f2c2f5cc2a022e5e30157c74  9.4.22.tar.gz
diff --git a/package/eja/eja.mk b/package/eja/eja.mk
new file mode 100644
index 0000000..b3b786b
--- /dev/null
+++ b/package/eja/eja.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# eja
+#
+################################################################################
+
+EJA_VERSION = 9.4.22
+EJA_SOURCE = $(EJA_VERSION).tar.gz
+EJA_SITE = https://github.com/ubaldus/eja/archive
+
+ifeq ($(BR2_STATIC_LIBS),y)
+EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL
+EJA_MYLIBS = -static -w
+else
+EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL -DLUA_USE_DLOPEN
+EJA_MYLIBS = -ldl
+endif
+
+define EJA_BUILD_CMDS
+	$(MAKE) \
+        CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
+        CFLAGS="$(TARGET_CFLAGS) $(EJA_CFLAGS)" \
+        MYLIBS="$(EJA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" -C $(@D)
+endef
+
+define EJA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/eja $(TARGET_DIR)/usr/bin/eja
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
