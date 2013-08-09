From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  9 Aug 2013 11:36:58 +0200
Subject: [Buildroot] [PATCH 2/3] ltrace: Fix a May be unitialized variable
In-Reply-To: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1376041019-26688-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compilation may failed if rlm is not initialized and ltrace
is compiled with -Werror.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../ltrace-fix-may-be-uninitialized-variable.patch |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/ltrace/ltrace-fix-may-be-uninitialized-variable.patch

diff --git a/package/ltrace/ltrace-fix-may-be-uninitialized-variable.patch b/package/ltrace/ltrace-fix-may-be-uninitialized-variable.patch
new file mode 100644
index 0000000..23ffc94
--- /dev/null
+++ b/package/ltrace/ltrace-fix-may-be-uninitialized-variable.patch
@@ -0,0 +1,11 @@
+--- a/sysdeps/linux-gnu/proc.c	2012-12-04 13:36:23.000000000 +0100
++++ b/sysdeps/linux-gnu/proc.c	2013-08-09 10:14:33.576464435 +0200
+@@ -483,7 +483,7 @@
+ 	arch_addr_t addr = (arch_addr_t)(uintptr_t)dbg->r_map;
+ 
+ 	while (addr != 0) {
+-		struct lt_link_map_64 rlm;
++		struct lt_link_map_64 rlm = { };
+ 		if (lm_fetcher(proc)(proc, addr, &rlm) < 0) {
+ 			debug(2, "Unable to read link map");
+ 			return;
-- 
1.7.9.5
