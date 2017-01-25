From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 09:54:46 -0500
Subject: [Buildroot] [V3 1/1] sngrep: new package
Message-ID: <20170125145446.23466-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sngrep is a tool for displaying SIP calls message flows from terminal.
It supports live capture to display realtime SIP packets and can also
be used as PCAP viewer.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 - v3:
 - Changed 'depends on BR2_PACKAGE_LIBPCAP' to 'select BR2_PACKAGE_LIBPCAP'
 - Changed 'depends on BR2_PACKAGE_NCURSES' to 'select BR2_PACKAGE_NCURSES'
 - Added 'depends on BR2_USE_WCHAR'
 - Added 'depends on BR2_TOOLCHAIN_HAS_THREADS'
 - Removed redundant empty line.
v1 - v2:
 - Added select BR2_PACKAGE_NCURSES_WCHAR.
 - Added select BR2_PACKAGE_NCURSES_TARGET_PANEL
 - Added select BR2_PACKAGE_NCURSES_TARGET_FORM
 - Added select BR2_PACKAGE_NCURSES_TARGET_MENU
 - Changed version downloaded to v1.4.2 (I didn't see the release tab!)
 
 package/Config.in          |  1 +
 package/sngrep/Config.in   | 18 ++++++++++++++++++
 package/sngrep/sngrep.hash |  1 +
 package/sngrep/sngrep.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/sngrep/Config.in
 create mode 100644 package/sngrep/sngrep.hash
 create mode 100644 package/sngrep/sngrep.mk

diff --git a/package/Config.in b/package/Config.in
index c7b6862..0572110 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1625,6 +1625,7 @@ endif
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
+	source "package/sngrep/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
new file mode 100644
index 0000000..dc873da
--- /dev/null
+++ b/package/sngrep/Config.in
@@ -0,0 +1,18 @@
+comment "sngrep needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_SNGREP
+	bool "sngrep"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  sngrep is a tool for displaying SIP calls message flows from terminal.
+	  It supports live capture to display realtime SIP packets and can also be 
+	  used as PCAP viewer.
+
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
new file mode 100644
index 0000000..dd75f89
--- /dev/null
+++ b/package/sngrep/sngrep.hash
@@ -0,0 +1 @@
+sha256 30fbfb4f90ed8805194b39683a8a2ed465776ffd60df4482bd029d63b316b3f1 sngrep-v1.4.2.tar.gz
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
new file mode 100644
index 0000000..c3d4ca5
--- /dev/null
+++ b/package/sngrep/sngrep.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sngrep
+#
+################################################################################
+
+SNGREP_VERSION = v1.4.2
+SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
+SNGREP_LICENSE = GPLv3+
+SNGREP_LICENSE_FILES = LICENSE
+SNGREP_AUTORECONF = YES
+SNGREP_DEPENDENCIES = libpcap ncurses
+
+$(eval $(autotools-package))
-- 
2.9.3
