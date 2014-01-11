From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:06 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 04/15] luarocks: new package
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: apply Thomas' suggestions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks.mk |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/luarocks/luarocks.mk

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
new file mode 100644
index 0000000..149af0f
--- /dev/null
+++ b/package/luarocks/luarocks.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# luarocks
+#
+################################################################################
+
+LUAROCKS_VERSION = 2.1.2
+LUAROCKS_SITE = http://luarocks.org/releases/
+LUAROCKS_LICENSE = MIT
+LUAROCKS_LICENSE_FILES = COPYING
+
+HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
+
+LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-5.1.lua
+
+define HOST_LUAROCKS_CONFIGURE_CMDS
+	cd $(@D) && ./configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
+		--with-lua=$(HOST_DIR)/usr
+endef
+
+define HOST_LUAROCKS_INSTALL_CMDS
+	rm -f $(LUAROCKS_CONFIG_FILE)
+	$(MAKE1) -C $(@D) install \
+		PREFIX=$(HOST_DIR)/usr
+	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LUA_INCDIR = [[$(STAGING_DIR)/usr/include]],"  >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
+	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
+	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
+	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
+	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.9.5
