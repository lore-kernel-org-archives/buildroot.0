From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 May 2016 11:03:14 +0200
Subject: [Buildroot] [PATCH 3/4] gdb: enable simulator support for host build
Message-ID: <20160508090314.GA32561@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable simulator support, so
it can be used to test some no-MMU systems.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gdb/Config.in.host | 5 +++++
 package/gdb/gdb.mk         | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b213901..1748ab0 100644
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
index 0a7af1e..3c64f1d 100644
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
@@ -179,6 +178,12 @@ else
 HOST_GDB_CONF_OPTS += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_SIM),y)
+HOST_GDB_CONF_OPTS += --enable-sim
+else
+HOST_GDB_CONF_OPTS += --disable-sim
+endif
+
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/usr/bin && \
-- 
2.1.4
