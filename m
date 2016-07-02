From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 10:37:01 +0200
Subject: [Buildroot] [git commit] audit: add patch to fix EHWPOISON build
	issue
Message-ID: <20160702083723.EB83781794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b483c2ad1025ac1bc08033781c190af5baef9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/2e147b60481cfb8960749a8e012ff8fa05568a2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...les.c-define-EHWPOISON-when-not-available.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch b/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
new file mode 100644
index 0000000..8880d6c
--- /dev/null
+++ b/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
@@ -0,0 +1,44 @@
+From ac10cdedd136689028223088ffca80b98c7bbaff Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 2 Jul 2016 10:33:34 +0200
+Subject: [PATCH] lib/gen_tables.c: define EHWPOISON when not available
+
+When building on some old system with old kernel headers, the
+gen_tables.c program (built natively) doesn't build due to missing
+EHWPOISON. This commit defines EHWPOISON to the value found in
+asm-generic kernel headers, which is correct for most (but not all
+architectures).
+
+Anyway, the whole concept of building a program on the host to generate
+a table with errno values, then built into a target program is
+inherently broken, so our fix is not more broken than the rest of the
+mechanism used by audit.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/gen_tables.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/gen_tables.c b/lib/gen_tables.c
+index 98f576c..d0bb7f5 100644
+--- a/lib/gen_tables.c
++++ b/lib/gen_tables.c
+@@ -55,6 +55,15 @@
+ #define SHMGET          23
+ #define SHMCTL          24
+ 
++/*
++ * Values from asm-generic, might be different on other architectures,
++ * but anyway the concept of building a program on the host to
++ * generate errno related tables used on another architecture is
++ * broken.
++ */
++#ifndef EHWPOISON
++#define EHWPOISON	133
++#endif
+ 
+ /* The ratio of table size to number of non-empty elements allowed for a
+    "direct" s2i table; if the ratio would be bigger, bsearch tables are used
+-- 
+2.7.4
+
