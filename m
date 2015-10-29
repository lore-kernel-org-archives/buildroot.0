From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 29 Oct 2015 08:30:30 +0100
Subject: [Buildroot] [PATCH v4] luvi: new package
Message-ID: <1446103830-19834-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package luvi version v2.3.5.

luvi extends LuaJIT with asynchronous I/O and several optional modules to run
Lua applications and build self-contained binaries.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v3 -> v4:
 - bump to v2.3.5
 - remove patch from upstream

Changes v2 -> v3:
 - Adapt version string to v2.3.4 (Jerzy Grzegorek)
 - Add else clauses to explicitly disable PCRE, OpenSSL and zlib support
   (Thomas Petazzoni)

Changes v1 -> v2:
 - replace too generic TARGET_ARCH variable by LUVI_TARGET_ARCH (Baruch Siach)
---
 package/Config.in      |  1 +
 package/luvi/Config.in | 30 +++++++++++++++++++++++++
 package/luvi/luvi.hash |  3 +++
 package/luvi/luvi.mk   | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 package/luvi/Config.in
 create mode 100644 package/luvi/luvi.hash
 create mode 100644 package/luvi/luvi.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..bc19405 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ menu "Lua libraries/modules"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/lunit/Config.in"
 	source "package/luv/Config.in"
+	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
 	source "package/orbit/Config.in"
 	source "package/rings/Config.in"
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
new file mode 100644
index 0000000..2f01f5c
--- /dev/null
+++ b/package/luvi/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LUVI
+	bool "luvi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_USE_MMU # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_LUV
+	help
+	  A project in-between luv and luvit. The goal of this is to make
+	  building luvit and derivatives much easier.
+
+	  luvi extends LuaJIT with asynchronous I/O and several optional
+	  modules to run Lua applications and build self-contained binaries
+	  on systems that don't have a compiler.
+
+	  The luvi core can be extended with several Lua modules by adding its
+	  bundled Lua binding libraries. To get the Lua module...
+	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
+	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
+	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
+
+	  https://github.com/luvit/luvi
+
+comment "luvi needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+
+comment "luvi needs LuaJIT"
+	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
new file mode 100644
index 0000000..99cf60e
--- /dev/null
+++ b/package/luvi/luvi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7a99add9e2afdeeb833f8d948b5078c326b492debf50716ca47c7669c1dc9d8b  luvi-src-v2.3.4.tar.gz
+sha256  4f84ec56d9bb92fd02380c12e73b0cfdb05fcd8100104e82349e488f249e85ad  0be7acc82ddffd8012e458dbb1d09a50e151116d.patch
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
new file mode 100644
index 0000000..ec3fba8
--- /dev/null
+++ b/package/luvi/luvi.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# luvi
+#
+################################################################################
+
+LUVI_VERSION = v2.3.4
+LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
+LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
+LUVI_LICENSE = Apache-2.0
+LUVI_LICENSE_FILES = LICENSE.txt
+LUVI_DEPENDENCIES = libuv luajit luv host-luajit
+LUVI_PATCH = https://github.com/luvit/luvi/commit/0be7acc82ddffd8012e458dbb1d09a50e151116d.patch
+
+# Dispatch all architectures of LuaJIT
+ifeq ($(BR2_i386),y)
+LUVI_TARGET_ARCH = x86
+else ifeq ($(BR2_x86_64),y)
+LUVI_TARGET_ARCH = x64
+else ifeq ($(BR2_powerpc),y)
+LUVI_TARGET_ARCH = ppc
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+LUVI_TARGET_ARCH = arm
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+LUVI_TARGET_ARCH = mips
+else
+LUVI_TARGET_ARCH = $(BR2_ARCH)
+endif
+
+# Bundled lua bindings have to be linked statically into the luvi executable
+LUVI_CONF_OPTS = \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DWithSharedLibluv=ON \
+	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
+	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua
+
+# Add "rex" module (PCRE via bundled lrexlib)
+ifeq ($(BR2_PACKAGE_PCRE),y)
+LUVI_DEPENDENCIES += pcre
+LUVI_CONF_OPTS += -DWithPCRE=ON -DWithSharedPCRE=ON
+else
+LUVI_CONF_OPTS += -DWithPCRE=OFF -DWithSharedPCRE=OFF
+endif
+
+# Add "ssl" module (via bundled lua-openssl)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LUVI_DEPENDENCIES += openssl
+LUVI_CONF_OPTS += -DWithOpenSSL=ON -DWithOpenSSLASM=ON -DWithSharedOpenSSL=ON
+else
+LUVI_CONF_OPTS += -DWithOpenSSL=OFF -DWithOpenSSLASM=OFF -DWithSharedOpenSSL=OFF
+endif
+
+# Add "zlib" module (via bundled lua-zlib)
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LUVI_DEPENDENCIES += zlib
+LUVI_CONF_OPTS += -DWithZLIB=ON -DWithSharedZLIB=ON
+else
+LUVI_CONF_OPTS += -DWithZLIB=OFF -DWithSharedZLIB=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
