From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:44:57 +0200
Subject: [Buildroot] [git commit] package/lua-flu: new package
Message-ID: <20170621195516.9C54281D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a435247b015a794d1c302c7b19ff68a616a1078b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Thomas: "depends on" before "select" in Config.in]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lua-flu/Config.in    | 18 ++++++++++++++++++
 package/lua-flu/lua-flu.hash |  2 ++
 package/lua-flu/lua-flu.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d336d1..5729351 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1066,6 +1066,7 @@ F:	board/grinn/
 F:	configs/grinn_*
 F:	package/argparse/
 F:	package/easydbus/
+F:	package/lua-flu/
 F:	package/luaossl/
 F:	package/rs485conf/
 F:	package/turbolua/
diff --git a/package/Config.in b/package/Config.in
index e640ae6..d2b3119 100644
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
index 0000000..526dc90
--- /dev/null
+++ b/package/lua-flu/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUA_FLU
+	bool "lua-flu"
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_LIBFUSE
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
index 0000000..92a0a13
--- /dev/null
+++ b/package/lua-flu/lua-flu.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
diff --git a/package/lua-flu/lua-flu.mk b/package/lua-flu/lua-flu.mk
new file mode 100644
index 0000000..7cfea8e
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
