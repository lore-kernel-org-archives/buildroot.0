From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Apr 2017 21:31:46 +0300
Subject: [Buildroot] [PATCH 2/3] netsniff-ng: fix static build with
	netfilter_conntrack
In-Reply-To: <30be9755f9125cfbd5a4c57ec4b84cfb67a5f131.1492626707.git.baruch@tkos.co.il>
References: <30be9755f9125cfbd5a4c57ec4b84cfb67a5f131.1492626707.git.baruch@tkos.co.il>
Message-ID: <cada84c3f2106808933d36a76616cfb0a532cc55.1492626707.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to determine link flags.

Fixes:
http://autobuild.buildroot.net/results/0ef/0efb90d69fdffafe0630e6507d40198bfb1c5818/
http://autobuild.buildroot.net/results/0ea/0eaf15dd387961641b42d977c49804fe8872074b/
http://autobuild.buildroot.net/results/43d/43d3f2d54deb9d095a4f8cbf70a7b933c09ed618/

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...e-PKG_CONFIG-into-account-for-libnetfilte.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch

diff --git a/package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch b/package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
new file mode 100644
index 000000000000..bd7619ba7af0
--- /dev/null
+++ b/package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
@@ -0,0 +1,43 @@
+From 2d38d16d86db941fcb4d4fb8ad761e7e163c01e5 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 16 Apr 2017 07:41:38 +0300
+Subject: [PATCH] flowtop: take PKG_CONFIG into account for
+ libnetfilter_conntrack
+
+Use $PKG_CONFIG to determine the linker flags for libnetfilter_conntrack. This
+fixes static link failure like the following:
+
+  LD	flowtop
+.../usr/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libnetfilter_conntrack.a(main.o): In function `nfct_open_nfnl':
+main.c:(.text+0x52): undefined reference to `nfnl_subsys_open'
+main.c:(.text+0x69): undefined reference to `nfnl_subsys_close'
+main.c:(.text+0x87): undefined reference to `nfnl_subsys_open'
+main.c:(.text+0xa3): undefined reference to `nfnl_subsys_close'
+.../usr/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libnetfilter_conntrack.a(main.o): In function `nfct_open':
+main.c:(.text+0xc9): undefined reference to `nfnl_open'
+main.c:(.text+0xf0): undefined reference to `nfnl_close'
+...
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+Patch status: sent upstream
+http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01971.html
+
+ flowtop/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/flowtop/Makefile b/flowtop/Makefile
+index effe7eb33fc3..e001ce8aaf13 100644
+--- a/flowtop/Makefile
++++ b/flowtop/Makefile
+@@ -1,5 +1,5 @@
+ flowtop-libs =	-lurcu \
+-		-lnetfilter_conntrack \
++		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libnetfilter_conntrack 2> /dev/null ) \
+ 		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs ncurses 2> /dev/null \
+ 			|| echo '-lncurses') \
+ 		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs tinfo 2> /dev/null ) \
+-- 
+2.11.0
+
-- 
2.11.0
