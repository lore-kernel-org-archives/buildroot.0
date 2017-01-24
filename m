From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:10:38 -0500
Subject: [Buildroot] [PATCH 1/1] sngrep: new package
Message-ID: <20170124191038.30470-1-aduskett@codeblue.com>
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
 package/Config.in          |  1 +
 package/sngrep/Config.in   | 13 +++++++++++++
 package/sngrep/sngrep.hash |  1 +
 package/sngrep/sngrep.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/sngrep/Config.in
 create mode 100644 package/sngrep/sngrep.hash
 create mode 100644 package/sngrep/sngrep.mk

diff --git a/package/Config.in b/package/Config.in
index 2bcb5d2..502c171 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1622,6 +1622,7 @@ endif
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
+	source "package/sngrep/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
new file mode 100644
index 0000000..8dfc812
--- /dev/null
+++ b/package/sngrep/Config.in
@@ -0,0 +1,13 @@
+comment "sngrep needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+
+config BR2_PACKAGE_SNGREP
+	bool "sngrep"
+	depends on BR2_PACKAGE_LIBPCAP
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  sngrep is a tool for displaying SIP calls message flows from terminal.
+	  It supports live capture to display realtime SIP packets and can also be 
+	  used as PCAP viewer.
+
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
new file mode 100644
index 0000000..4dd7880
--- /dev/null
+++ b/package/sngrep/sngrep.hash
@@ -0,0 +1 @@
+sha256 43483a9bbc77b2130d5317fde8e1c2633712ff070d32650031962e8eb3bcbd64 sngrep-9a08a8a46e03ceccb638838ea97b871cee992336.tar.gz
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
new file mode 100644
index 0000000..b46140e
--- /dev/null
+++ b/package/sngrep/sngrep.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sngrep
+#
+################################################################################
+
+SNGREP_VERSION = 9a08a8a46e03ceccb638838ea97b871cee992336
+SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
+SNGREP_LICENSE = GPLv3+
+SNGREP_LICENSE_FILES = LICENSE
+SNGREP_AUTORECONF = YES
+SNGREP_DEPENDENCIES = libpcap ncurses
+
+$(eval $(autotools-package))
-- 
2.9.3
