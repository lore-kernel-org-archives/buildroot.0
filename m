From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 29 Dec 2016 21:23:40 +0100
Subject: [Buildroot] [PATCH 3/3] package/busybox: add patch to fix
	dependency for IFUPDOWN_UDHCPC_CMD_OPTIONS
In-Reply-To: <20161229202340.22374-1-joerg.krause@embedded.rocks>
References: <20161229202340.22374-1-joerg.krause@embedded.rocks>
Message-ID: <20161229202340.22374-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit a8c696bf09d8151323f6e99348c4bc8989f829c8 makes ifup and
ifdown individually selectable, but forgets to update the dependency to
IFUPDOWN_UDHCPC_CMD_OPTIONS, so it is not selectable anymore.

Add a patch which fixes the dependency by checking for IFUP or IFDOWN,
instead of the obsolete IFUPDOWN.

Upstream status: Pending
http://lists.busybox.net/pipermail/busybox/2016-December/085034.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...ependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch

diff --git a/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch b/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch
new file mode 100644
index 000000000..35e4e45c6
--- /dev/null
+++ b/package/busybox/0004-Fix-dependency-for-IFUPDOWN_UDHCPC_CMD_OPTIONS.patch
@@ -0,0 +1,36 @@
+From 9c0b06bfbb05c40ba31bad8aa469aa2330620e9e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 29 Dec 2016 18:41:21 +0100
+Subject: [PATCH] Fix dependency for IFUPDOWN_UDHCPC_CMD_OPTIONS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit a8c696bf09d8151323f6e99348c4bc8989f829c8 makes ifup and ifdown
+individually selectable, but forgets to update the dependency to
+IFUPDOWN_UDHCPC_CMD_OPTIONS, so it is not selectable anymore.
+
+This patch fixes the dependency by checking for IFUP or IFDOWN, instead
+of the obsolete IFUPDOWN.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ networking/Config.src | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/Config.src b/networking/Config.src
+index 527bdd15d..a3d895b5f 100644
+--- a/networking/Config.src
++++ b/networking/Config.src
+@@ -53,7 +53,7 @@ source networking/udhcp/Config.in
+ config IFUPDOWN_UDHCPC_CMD_OPTIONS
+ 	string "ifup udhcpc command line options"
+ 	default "-R -n"
+-	depends on IFUPDOWN && UDHCPC
++	depends on (IFUP || IFDOWN) && UDHCPC
+ 	help
+ 	  Command line options to pass to udhcpc from ifup.
+ 	  Intended to alter options not available in /etc/network/interfaces.
+-- 
+2.11.0
+
-- 
2.11.0
