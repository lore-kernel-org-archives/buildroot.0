From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 29 Aug 2014 21:42:31 +0200
Subject: [Buildroot] [PATCH] host-gdb: enable terminal user interface support
Message-ID: <1409341351-5866-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a configuration option to compile host-gdb with
--enbale-tui switch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/gdb/Config.in.host | 6 ++++++
 package/gdb/gdb.mk         | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cbc1361..8846eaf 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -13,6 +13,12 @@ config BR2_PACKAGE_HOST_GDB
 
 if BR2_PACKAGE_HOST_GDB
 
+config BR2_PACKAGE_HOST_GDB_TUI
+	bool "GDB TUI support"
+	select BR2_PACKAGE_NCURSES
+	help
+	  This option enables terminal user interface (TUI) for gdb
+
 choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8ab264b..7e87bf9 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -114,7 +114,6 @@ HOST_GDB_CONF_OPT = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-static --disable-shared \
 	--without-uiout \
-	--disable-tui \
 	--disable-gdbtk \
 	--without-x \
 	--enable-threads \
@@ -123,6 +122,13 @@ HOST_GDB_CONF_OPT = \
 	$(GDB_DISABLE_BINUTILS_CONF_OPT) \
 	--disable-sim
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
+	HOST_GDB_DEPENDENCIES += host-ncurses
+	HOST_GDB_CONF_OPT += --enable-tui
+else
+	HOST_GDB_CONF_OPT += --disable-tui
+endif
+
 ifeq ($(GDB_FROM_GIT),y)
 HOST_GDB_DEPENDENCIES += host-texinfo
 else
-- 
1.8.3.2
