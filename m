From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 20 Jun 2017 17:16:31 +0200
Subject: [Buildroot] [PATCH] package/lua-flu: new package
Message-ID: <20170620151631.4857-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lua-flu/Config.in    | 18 ++++++++++++++++++
 package/lua-flu/lua-flu.hash |  2 ++
 package/lua-flu/lua-flu.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/lua-flu/Config.in
 create mode 100644 package/lua-flu/lua-flu.hash
 create mode 100644 package/lua-flu/lua-flu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index afc45962c..8f5aba432 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1064,6 +1064,7 @@ F:	board/grinn/
 F:	configs/grinn_*
 F:	package/argparse/
 F:	package/easydbus/
+F:	package/lua-flu/
 F:	package/luaossl/
 F:	package/rs485conf/
 F:	package/turbolua/
diff --git a/package/Config.in b/package/Config.in
index 9df0b4247..56cb0dc2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -566,6 +566,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-ev/Config.in"
+	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
new file mode 100644
index 000000000..7bf17cba6
--- /dev/null
+++ b/package/lua-flu/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUA_FLU
+	bool "lua-flu"
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_LIBFUSE
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	help
+	  Flu is a Lua binding for FUSE, which is a library allowing
+	  creation of filesystem drivers run in userspace. Flu is a high
+	  level binding, using basic Lua types rather than userdata
+	  whenever possible.
+
+	  http://piratery.net/flu/
+
+comment "lua-flu needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/lua-flu/lua-flu.hash b/package/lua-flu/lua-flu.hash
new file mode 100644
index 000000000..92a0a13ff
--- /dev/null
+++ b/package/lua-flu/lua-flu.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
diff --git a/package/lua-flu/lua-flu.mk b/package/lua-flu/lua-flu.mk
new file mode 100644
index 000000000..7cfea8e6d
--- /dev/null
+++ b/package/lua-flu/lua-flu.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-flu
+#
+################################################################################
+
+LUA_FLU_VERSION = 20150331-1
+LUA_FLU_NAME_UPSTREAM = flu
+LUA_FLU_SUBDIR = doub-flu-a7daae986339
+LUA_FLU_LICENSE = MIT
+LUA_FLU_LICENSE_FILES = $(LUA_FLU_SUBDIR)/doc/LICENSE.txt
+LUA_FLU_DEPENDENCIES = attr libfuse
+
+$(eval $(luarocks-package))
-- 
2.13.1
