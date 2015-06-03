From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed,  3 Jun 2015 14:47:55 -0400
Subject: [Buildroot] [PATCH 2/3] lutok: new package
In-Reply-To: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <1433357276-7083-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lutok is a lightweight C++ API library for Lua.

https://github.com/jmmv/lutok

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 package/Config.in       |  1 +
 package/lutok/Config.in | 11 +++++++++++
 package/lutok/lutok.mk  | 19 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/lutok/Config.in
 create mode 100644 package/lutok/lutok.mk

diff --git a/package/Config.in b/package/Config.in
index 78ed223..628f36c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ endif
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
 	source "package/luajit/Config.in"
+	source "package/lutok/Config.in"
 if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
new file mode 100644
index 0000000..b94c093
--- /dev/null
+++ b/package/lutok/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LUTOK
+	bool "lutok"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Lutok is a lightweight C++ API library for Lua.
+
+	  https://github.com/jmmv/lutok
+
+comment "lutok needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/lutok/lutok.mk b/package/lutok/lutok.mk
new file mode 100644
index 0000000..25f4070
--- /dev/null
+++ b/package/lutok/lutok.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# lutok
+#
+################################################################################
+
+LUTOK_VERSION = 740c34180384520086302f5e107ae0ae37a7e617
+LUTOK_SITE = git://github.com/jmmv/lutok
+LUTOK_AUTORECONF = YES
+LUTOK_INSTALL_STAGING = YES
+LUTOK_DEPENDENCIES = host-pkgconf lua
+LUTOK_LICENSE = BSD
+LUTOK_LICENSE_FILES = COPYING
+
+ifneq ($(BR2_STATIC_LIBS),y)
+LUTOK_MAKE_OPTS = LIBS=-ldl
+endif
+
+$(eval $(autotools-package))
-- 
2.4.0
