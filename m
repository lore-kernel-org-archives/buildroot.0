From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Nov 2018 07:46:39 +0200
Subject: [Buildroot] [PATCH next] iptables: fix build with kernel headers <
 3.12
Message-ID: <790ee9a3bbc8d37f4a812af831308bc65f128985.1543124799.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend the workaround that was added in patch 0003 to cover ipv6
definitions.

Fixes:
http://autobuild.buildroot.net/results/23f/23ff396a568a865751471bf1f9e5dff2b73c8ab0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...he-headers-conflict-workaround-to-in.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch

diff --git a/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch b/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch
new file mode 100644
index 000000000000..6b1ffbd639ca
--- /dev/null
+++ b/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch
@@ -0,0 +1,37 @@
+From 23dee088cd54aae94f1b71046f2ab2b206eedd42 Mon Sep 17 00:00:00 2001
+Message-Id: <23dee088cd54aae94f1b71046f2ab2b206eedd42.1543092537.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sat, 24 Nov 2018 22:33:37 +0200
+Subject: [PATCH] include: extend the headers conflict workaround to in6.h
+
+Commit 8d9d7e4b9ef ("include: fix build with kernel headers before 4.2")
+introduced a kernel/user headers conflict workaround that allows build
+of iptables with kernel headers older than 4.2. This minor extension
+allows build with kernel headers older than 3.12, which is the version
+that introduced explicit IP headers synchronization.
+
+Cc: Florian Westphal <fw@strlen.de>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://www.spinics.net/lists/netfilter-devel/msg57029.html
+
+ include/linux/netfilter.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
+index bacf8cd92116..042d8b1478e0 100644
+--- a/include/linux/netfilter.h
++++ b/include/linux/netfilter.h
+@@ -5,8 +5,8 @@
+ 
+ #ifndef _NETINET_IN_H
+ #include <linux/in.h>
+-#endif
+ #include <linux/in6.h>
++#endif
+ #include <limits.h>
+ 
+ /* Responses from hook functions. */
+-- 
+2.19.1
+
-- 
2.19.1
