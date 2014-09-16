From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:25:40 +0200
Subject: [Buildroot] [git commit] gdb: enable tui support for target package
Message-ID: <20140916210715.F15529D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca40efb4bde3816cbf0307701f8bc7b5f386be6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a configuration option to compile the gdb target package with the
--enable-tui switch.

This is done pretty much in the same way as in commit 2474fb0bf1a7 ("host-gdb:
enable terminal user interface support"), but for the gdb package on target.

This makes sense only when a full debugger is installed on target,
not for a gdbserver.

[Thomas: remove "default n" since this is the default, adjust the
prompt of the option, and rewrap the help text.]

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in |   16 ++++++++++++++++
 package/gdb/gdb.mk    |    7 ++++++-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index bfbc8d8..9622948 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -46,4 +46,20 @@ comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 	depends on !BR2_USE_WCHAR
 
+if BR2_PACKAGE_GDB_DEBUGGER
+
+config BR2_PACKAGE_GDB_TUI
+	bool "TUI support"
+	help
+	  This option enables terminal user interface (TUI) for gdb
+
+	  "The GDB Text User Interface (TUI) is a terminal interface
+	  which uses the curses library to show the source file, the
+	  assembly output, the program registers and GDB commands in
+	  separate text windows."
+
+	  https://sourceware.org/gdb/current/onlinedocs/gdb/TUI.html
+
+endif
+
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 41d3689..4a194e2 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -76,7 +76,6 @@ GDB_CONF_ENV = \
 
 GDB_CONF_OPT = \
 	--without-uiout \
-	--disable-tui \
 	--disable-gdbtk \
 	--without-x \
 	--disable-sim \
@@ -86,6 +85,12 @@ GDB_CONF_OPT = \
 	--without-included-gettext \
 	--disable-werror
 
+ifeq ($(BR2_PACKAGE_GDB_TUI),y)
+	GDB_CONF_OPT += --enable-tui
+else
+	GDB_CONF_OPT += --disable-tui
+endif
+
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
