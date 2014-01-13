From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:16:51 +0100
Subject: [Buildroot] [git commit] luarocks: new package
Message-ID: <20140113222141.DA2F89C4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3713fa5185902bbba60cd5b0469f7efbef0a203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: apply Thomas' suggestions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.mk |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

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
