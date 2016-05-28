From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 May 2016 22:57:25 +0200
Subject: [Buildroot] [PATCH v3] gdb: enable simulator support for host build
Message-ID: <20160528205724.GA10651@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable simulator support, so
it can be used to test some no-MMU systems.

Newer GDB need a workaround for in-tree compile.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v2 -> v3:
  - add workaround for GDB bug when in-tree compile is used,
    problem reported by Thomas Petazzoni
  - tested with GDB 7.9, 7.10.1, 7.11
v1 -> v2:
  - no changes
---
 package/gdb/Config.in.host |  5 +++++
 package/gdb/gdb.mk         | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 257d68a..dc149b6 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -23,6 +23,11 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
 	help
 	  This option enables the Python support in the cross gdb.
 
+config BR2_PACKAGE_HOST_GDB_SIM
+	bool "Simulator support"
+	help
+	  This option enables the simulator support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 0a7af1e..83b1701 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -163,8 +163,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
-	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
-	--disable-sim
+	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
 HOST_GDB_CONF_OPTS += --enable-tui
@@ -179,6 +178,18 @@ else
 HOST_GDB_CONF_OPTS += --without-python
 endif
 
+# workaround a bug if in-tree build is used
+define GDB_SIM_WORKAROUND
+	$(RM) $(@D)/sim/common/tconfig.h
+endef
+
+ifeq ($(BR2_PACKAGE_HOST_GDB_SIM),y)
+HOST_GDB_CONF_OPTS += --enable-sim
+HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_SIM_WORKAROUND
+else
+HOST_GDB_CONF_OPTS += --disable-sim
+endif
+
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/usr/bin && \
-- 
2.1.4
