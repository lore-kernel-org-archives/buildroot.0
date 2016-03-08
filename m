From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:17:41 +0100
Subject: [Buildroot] [git commit] package/connman: fix crash due to iptables
	1.6.0 update
Message-ID: <20160308201805.88923801E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0e5c9c685db9a5c7d869a62443b4abb19ef46d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iptables was updated to version 1.6.0 in commit
https://git.busybox.net/buildroot/commit/?id=35dc775 however, connman
1.31 crashes when iptables 1.6.0 is used.

This issues has already been fixed upstream but is not currently available
in a release.  To fix connman include the upstream patch. See
http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=acea08a

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ion-item-of-xtables-to-match-iptables-1.6.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch b/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
new file mode 100644
index 0000000..75bf373
--- /dev/null
+++ b/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
@@ -0,0 +1,38 @@
+From acea08a0e4234a4c1a87bedc087c73ff36de0c7b Mon Sep 17 00:00:00 2001
+From: Wu Zheng <wu.zheng@intel.com>
+Date: Thu, 28 Jan 2016 18:04:17 +0800
+Subject: iptables: Add missing function item of xtables to match iptables 1.6
+
+The struct of xtables_globals has been modified in iptables 1.6.
+If connman runs with iptables 1.6, it can crash.
+
+Program received signal SIGSEGV, Segmentation fault.
+0x00000000 in ?? ()
+0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
+0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
+0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11
+
+The the missing function item of xtables is added to xtables_globals.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/iptables.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/iptables.c b/src/iptables.c
+index bc0c763..5ef757a 100644
+--- a/src/iptables.c
++++ b/src/iptables.c
+@@ -1566,6 +1566,9 @@ struct xtables_globals iptables_globals = {
+ 	.option_offset = 0,
+ 	.opts = iptables_opts,
+ 	.orig_opts = iptables_opts,
++#if XTABLES_VERSION_CODE > 10
++	.compat_rev = xtables_compatible_revision,
++#endif
+ };
+ 
+ static struct xtables_target *prepare_target(struct connman_iptables *table,
+-- 
+cgit v0.12
+
