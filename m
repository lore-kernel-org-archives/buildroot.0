From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:42:13 +0100
Subject: [Buildroot] [PATCH 05/10] luarocks: new package
In-Reply-To: <cover.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <6e3b569cbd8450028d7ab74658e3067152273f16.1387744636.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: apply Thomas' suggestions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks-0001-build-minimal.patch | 17 +++++++++
 package/luarocks/luarocks-0002-unpack.patch        | 24 +++++++++++++
 package/luarocks/luarocks.mk                       | 40 ++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 package/luarocks/luarocks-0001-build-minimal.patch
 create mode 100644 package/luarocks/luarocks-0002-unpack.patch
 create mode 100644 package/luarocks/luarocks.mk

diff --git a/package/luarocks/luarocks-0001-build-minimal.patch b/package/luarocks/luarocks-0001-build-minimal.patch
new file mode 100644
index 0000000..3a4794e
--- /dev/null
+++ b/package/luarocks/luarocks-0001-build-minimal.patch
@@ -0,0 +1,17 @@
+hack for buildroot which needs independant steps : download, unpack, build
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luarocks/build.lua
+===================================================================
+--- a/src/luarocks/build.lua
++++ b/src/luarocks/build.lua
+@@ -362,6 +362,8 @@
+ 
+    if flags["pack-binary-rock"] then
+       return pack.pack_binary_rock(name, version, do_build, name, version, deps.get_deps_mode(flags))
++   elseif flags["minimal"] then
++      return build_rockspec(name, false, true, "none")
+    else
+       local ok, err = fs.check_command_permissions(flags)
+       if not ok then return nil, err end
diff --git a/package/luarocks/luarocks-0002-unpack.patch b/package/luarocks/luarocks-0002-unpack.patch
new file mode 100644
index 0000000..0f036ee
--- /dev/null
+++ b/package/luarocks/luarocks-0002-unpack.patch
@@ -0,0 +1,24 @@
+allows unpack in existing directory
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luarocks/unpack.lua
+===================================================================
+--- a/src/luarocks/unpack.lua
++++ b/src/luarocks/unpack.lua
+@@ -101,11 +101,10 @@
+       return nil, file.." does not seem to be a valid filename."
+    end
+    
+-   if (fs.exists(dir_name)) then
+-      return nil, "Directory "..dir_name.." already exists."
++   if not fs.exists(dir_name) then
++      local ok, err = fs.make_dir(dir_name)
++      if not ok then return nil, err end
+    end
+-   local ok, err = fs.make_dir(dir_name)
+-   if not ok then return nil, err end
+    local rollback = util.schedule_function(fs.delete, fs.absolute_name(dir_name))
+ 
+    local rockspec, err
+
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
new file mode 100644
index 0000000..1b55dc2
--- /dev/null
+++ b/package/luarocks/luarocks.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# luarocks
+#
+################################################################################
+
+LUAROCKS_VERSION = 2.1.1
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
+		--prefix=$(TARGET_DIR)/usr \
+		--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
+		--with-lua=$(HOST_DIR)/usr \
+		--with-lua-include=$(STAGING_DIR)/usr/include \
+		--with-lua-lib=$(STAGING_DIR)/usr/lib
+endef
+
+define HOST_LUAROCKS_INSTALL_CMDS
+	$(MAKE1) -C $(@D) install \
+		PREFIX=$(HOST_DIR)/usr
+	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
+	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
+	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
+	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
+endef
+
+$(eval $(host-generic-package))
-- 
1.8.1.2
