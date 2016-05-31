From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 23:14:00 +0200
Subject: [Buildroot] [git commit branch/next] gdb: enable simulator support
	for host build
Message-ID: <20160531212414.9B4F781780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86aa4d8d11cbe49d81ce0a054570d6e5d59f372e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an option to enable GDB simulator support, so
it can be used to test some no-MMU systems.

Newer GDB Blackfin Simulator need a workaround for in-tree compile.
It doesn't break for older Buildroot supported GDB Blackfin
Simulator.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host |  5 +++++
 package/gdb/gdb.mk         | 17 +++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

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
index 0a7af1e..84f2029 100644
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
@@ -179,6 +178,20 @@ else
 HOST_GDB_CONF_OPTS += --without-python
 endif
 
+# workaround a bug if in-tree build is used for bfin sim
+define HOST_GDB_BFIN_SIM_WORKAROUND
+	$(RM) $(@D)/sim/common/tconfig.h
+endef
+
+ifeq ($(BR2_PACKAGE_HOST_GDB_SIM),y)
+HOST_GDB_CONF_OPTS += --enable-sim
+ifeq ($(BR2_bfin),y)
+HOST_GDB_PRE_CONFIGURE_HOOKS += HOST_GDB_BFIN_SIM_WORKAROUND
+endif
+else
+HOST_GDB_CONF_OPTS += --disable-sim
+endif
+
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/usr/bin && \
