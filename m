From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:41:41 +0200
Subject: [Buildroot] [git commit] lutok: new package
Message-ID: <20150612201536.9C2A980411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c8744a2095a46b86f9b00a6346bba108036fe58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lutok is a lightweight C++ API library for Lua.

https://github.com/jmmv/lutok

[Thomas:
 - move lutok inclusion in package/Config.in after including the Lua
   external modules
 - add a comment explaining why we are passing --without-atf
 - remove the logic around -ldl, it seems to build just fine without it.]

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/lutok/Config.in  |   13 +++++++++++++
 package/lutok/lutok.hash |    2 ++
 package/lutok/lutok.mk   |   16 ++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d111a82..0286630 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/lutok/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
new file mode 100644
index 0000000..d6c87cf
--- /dev/null
+++ b/package/lutok/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUTOK
+	bool "lutok"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUAJIT
+	help
+	  Lutok is a lightweight C++ API library for Lua.
+
+	  https://github.com/jmmv/lutok
+
+comment "lutok needs a toolchain w/ C++ and full Lua"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
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
index 0000000..6ee198b
--- /dev/null
+++ b/package/lutok/lutok.mk
@@ -0,0 +1,16 @@
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
+# --without-atf disables the atf-based lutok tests
+LUTOK_CONF_OPTS = --without-doxygen --without-atf
+LUTOK_LICENSE = BSD-3c
+LUTOK_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
