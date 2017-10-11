From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Oct 2017 15:21:40 +0200
Subject: [Buildroot] [PATCH] prosody: new package
Message-ID: <20171011132140.22547-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in            |  1 +
 package/prosody/Config.in    | 17 +++++++++++++++++
 package/prosody/prosody.hash |  2 ++
 package/prosody/prosody.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/prosody/Config.in
 create mode 100644 package/prosody/prosody.hash
 create mode 100644 package/prosody/prosody.mk

diff --git a/package/Config.in b/package/Config.in
index e333c66e1..81d87ad66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1720,6 +1720,7 @@ endif
 	source "package/pptp-linux/Config.in"
 	source "package/privoxy/Config.in"
 	source "package/proftpd/Config.in"
+	source "package/prosody/Config.in"
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
 	source "package/ptpd2/Config.in"
diff --git a/package/prosody/Config.in b/package/prosody/Config.in
new file mode 100644
index 000000000..57c71a83e
--- /dev/null
+++ b/package/prosody/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PROSODY
+	bool "prosody"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_BIN
+	# These are runtime dependencies
+	select BR2_PACKAGE_LUAEXPAT
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUASOCKET
+	help
+	  Prosody is a modern XMPP communication server.
+
+	  https://prosody.im/
+
+comment "prosody needs a Lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
new file mode 100644
index 000000000..67735f9cb
--- /dev/null
+++ b/package/prosody/prosody.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7414e447256c60b2645578c4a5913113cd74b419ca5a032b54db90d98a978498  prosody-0.10.0.tar.gz
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
new file mode 100644
index 000000000..cf42b1b66
--- /dev/null
+++ b/package/prosody/prosody.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# prosody
+#
+################################################################################
+
+PROSODY_VERSION = 0.10.0
+PROSODY_SITE = https://prosody.im/downloads/source
+PROSODY_LICENSE = MIT
+PROSODY_LICENSE_FILES = COPYING
+PROSODY_DEPENDENCIES = host-luainterpreter host-openssl libidn luainterpreter openssl
+
+PROSODY_CONF_OPTS = \
+	--with-lua-bin="$(HOST_DIR)/usr/bin" \
+	--with-lua="$(STAGING_DIR)/usr" \
+	--lua-version=$(LUAINTERPRETER_ABIVER) \
+	--c-compiler="$(TARGET_CC)" \
+	--linker="$(TARGET_LD)" \
+	--add-ldflags="-L$(STAGING_DIR)/usr/lib" \
+	--prefix="/usr"
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+PROSODY_CONF_OPTS += --runwith=luajit
+endif
+
+define PROSODY_CONFIGURE_CMDS
+	cd $(@D) && ./configure $(PROSODY_CONF_OPTS)
+endef
+
+define PROSODY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define PROSODY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
