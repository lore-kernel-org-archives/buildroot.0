From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 18:18:56 +0200
Subject: [Buildroot] [PATCH 3/6] lua-cqueues: new package
In-Reply-To: <20170924161859.10994-1-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
Message-ID: <20170924161859.10994-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                    |  1 +
 package/lua-cqueues/Config.in        | 12 ++++++++++++
 package/lua-cqueues/lua-cqueues.hash |  2 ++
 package/lua-cqueues/lua-cqueues.mk   | 23 +++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/lua-cqueues/Config.in
 create mode 100644 package/lua-cqueues/lua-cqueues.hash
 create mode 100644 package/lua-cqueues/lua-cqueues.mk

diff --git a/package/Config.in b/package/Config.in
index e4133d365..393bdcf4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -574,6 +574,7 @@ menu "Lua libraries/modules"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
+	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
 	source "package/lua-datafile/Config.in"
diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
new file mode 100644
index 000000000..60f022848
--- /dev/null
+++ b/package/lua-cqueues/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_CQUEUES
+	bool "lua-cqueues"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Continuation Queues: Embeddable asynchronous networking,
+	  threading, and notification framework for Lua on Unix.
+
+	  http://25thandclement.com/~william/projects/cqueues.html
+
+comment "lua-cqueues needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
new file mode 100644
index 000000000..9fd664d69
--- /dev/null
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-rel-20161215.tar.gz
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
new file mode 100644
index 000000000..4f4be1e04
--- /dev/null
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lua-cqueues
+#
+################################################################################
+
+LUA_CQUEUES_VERSION = rel-20161215
+LUA_CQUEUES_SITE = $(call github,wahern,cqueues,$(LUA_CQUEUES_VERSION))
+LUA_CQUEUES_LICENSE = MIT
+LUA_CQUEUES_LICENSE_FILES = LICENSE
+LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl
+
+define LUA_CQUEUES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		prefix="$(STAGING_DIR)/usr" all$(LUAINTERPRETER_ABIVER)
+endef
+
+define LUA_CQUEUES_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr install$(LUAINTERPRETER_ABIVER)
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
