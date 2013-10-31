From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2013 11:16:10 +0100
Subject: [Buildroot] [pkg-luarocks infra 3/5] luarocks: new package
In-Reply-To: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
References: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1383214572-8216-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks-build-minimal.patch |   17 +++++++++++++++
 package/luarocks/luarocks-unpack.patch        |   24 ++++++++++++++++++++
 package/luarocks/luarocks.mk                  |   29 +++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 package/luarocks/luarocks-build-minimal.patch
 create mode 100644 package/luarocks/luarocks-unpack.patch
 create mode 100644 package/luarocks/luarocks.mk

diff --git a/package/luarocks/luarocks-build-minimal.patch b/package/luarocks/luarocks-build-minimal.patch
new file mode 100644
index 0000000..3a4794e
--- /dev/null
+++ b/package/luarocks/luarocks-build-minimal.patch
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
diff --git a/package/luarocks/luarocks-unpack.patch b/package/luarocks/luarocks-unpack.patch
new file mode 100644
index 0000000..0f036ee
--- /dev/null
+++ b/package/luarocks/luarocks-unpack.patch
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
index 0000000..3428c70
--- /dev/null
+++ b/package/luarocks/luarocks.mk
@@ -0,0 +1,29 @@
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
+HOST_LUAROCKS_DEPENDENCIES = host-lua lua
+
+define HOST_LUAROCKS_CONFIGURE_CMDS
+	cd $(@D) && ./configure \
+		--prefix=$(TARGET_DIR)/usr \
+		--with-lua=$(HOST_DIR)/usr \
+		--with-lua-include=$(STAGING_DIR)/usr/include \
+		--with-lua-lib=$(STAGING_DIR)/usr/lib
+	@echo "$(@D)/config.unix generated"
+endef
+
+define HOST_LUAROCKS_INSTALL_CMDS
+	$(MAKE1) -C $(@D) install \
+		PREFIX=$(HOST_DIR)/usr
+endef
+
+$(eval $(host-generic-package))
+
-- 
1.7.9.5
