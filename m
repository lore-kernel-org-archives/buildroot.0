From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu,  4 Jun 2015 17:21:55 -0400
Subject: [Buildroot] [PATCH v2 2/3] lutok: new package
In-Reply-To: <1433452916-4378-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433452916-4378-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <1433452916-4378-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lutok is a lightweight C++ API library for Lua.

https://github.com/jmmv/lutok

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v1 -> v2:
  suggested by Arnout Vandecapelle <arnout@mind.be>:
  - reworks lua dependencies, doesn't work with luajit
  - adds comment in the Config.in for the required lua dependencies
  - uses the release archive instead of the github automatic one
  - updates the hash
  - removes the useless AUTORECONF option
  - adds optional dependency on atf
  - don't generate the doxygen doc
  - changes the license
---
 package/Config.in        |  1 +
 package/lutok/Config.in  | 16 ++++++++++++++++
 package/lutok/lutok.hash |  2 ++
 package/lutok/lutok.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/lutok/Config.in
 create mode 100644 package/lutok/lutok.hash
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
index 0000000..1df8dc5
--- /dev/null
+++ b/package/lutok/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LUTOK
+	bool "lutok"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER \
+		&& !BR2_PACKAGE_LUAJIT
+	help
+	  Lutok is a lightweight C++ API library for Lua.
+
+	  https://github.com/jmmv/lutok
+
+comment "lutok needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "lutok needs a Lua 5.1 interpreter or above"
+	depends on BR2_INSTALL_LIBSTDCPP && \
+		(!BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_PACKAGE_LUAJIT)
diff --git a/package/lutok/lutok.hash b/package/lutok/lutok.hash
new file mode 100644
index 0000000..0ec8988
--- /dev/null
+++ b/package/lutok/lutok.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2cec51efa0c8d65ace8b21eaa08384b77abc5087b46e785f78de1c21fb754cd5 lutok-0.4.tar.gz
diff --git a/package/lutok/lutok.mk b/package/lutok/lutok.mk
new file mode 100644
index 0000000..0c78daa
--- /dev/null
+++ b/package/lutok/lutok.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# lutok
+#
+################################################################################
+
+LUTOK_VERSION = 0.4
+LUTOK_SITE = https://github.com/jmmv/lutok/releases/download/lutok-$(LUTOK_VERSION)
+LUTOK_INSTALL_STAGING = YES
+LUTOK_DEPENDENCIES = host-pkgconf lua
+LUTOK_CONF_OPTS = --without-doxygen
+LUTOK_LICENSE = BSD-3c
+LUTOK_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_ATF),y)
+LUTOK_DEPENDENCIES += atf
+LUTOK_CONF_OPTS += --with-atf
+else
+LUTOK_CONF_OPTS += --without-atf
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+LUTOK_MAKE_OPTS = LIBS=-ldl
+endif
+
+$(eval $(autotools-package))
-- 
2.4.0
