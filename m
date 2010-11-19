From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 10:31:21 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.17.3 ls fix
Message-ID: <20101119093156.186A28D235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0758f63b3fb26bb8879075b7b32c4b8fa4a9d6e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../busybox/busybox-1.17.3/busybox-1.17.3-ls.patch |   30 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch

diff --git a/CHANGES b/CHANGES
index 4c43636..c3b3a6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: bash, libglib2, libmad, midori,
+	Updated/fixed packages: bash, busybox, libglib2, libmad, midori,
 	module-init-tools, mtd-utils, openssh, qt, sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
new file mode 100644
index 0000000..1c4f895
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
@@ -0,0 +1,30 @@
+diff -urpN busybox-1.17.3/coreutils/ls.c busybox-1.17.3-ls/coreutils/ls.c
+--- busybox-1.17.3/coreutils/ls.c	2010-10-09 21:57:13.000000000 +0200
++++ busybox-1.17.3-ls/coreutils/ls.c	2010-11-06 00:26:48.467049575 +0100
+@@ -184,7 +184,7 @@ static const unsigned opt_flags[] = {
+ 	LIST_INO,                   /* i */
+ 	LIST_LONG | STYLE_LONG,     /* l - remember LS_DISP_HR in mask! */
+ 	LIST_SHORT | STYLE_SINGLE,  /* 1 */
+-	0,                          /* g (don't show group) - handled via OPT_g */
++	0,                          /* g (don't show owner) - handled via OPT_g */
+ 	LIST_ID_NUMERIC,            /* n */
+ 	LIST_BLOCKS,                /* s */
+ 	DISP_ROWS,                  /* x */
+@@ -621,7 +621,7 @@ static NOINLINE unsigned list_single(con
+ 	if (all_fmt & LIST_ID_NAME) {
+ 		if (option_mask32 & OPT_g) {
+ 			column += printf("%-8.8s ",
+-				get_cached_username(dn->dstat.st_uid));
++				get_cached_groupname(dn->dstat.st_gid));
+ 		} else {
+ 			column += printf("%-8.8s %-8.8s ",
+ 				get_cached_username(dn->dstat.st_uid),
+@@ -631,7 +631,7 @@ static NOINLINE unsigned list_single(con
+ #endif
+ 	if (all_fmt & LIST_ID_NUMERIC) {
+ 		if (option_mask32 & OPT_g)
+-			column += printf("%-8u ", (int) dn->dstat.st_uid);
++			column += printf("%-8u ", (int) dn->dstat.st_gid);
+ 		else
+ 			column += printf("%-8u %-8u ",
+ 					(int) dn->dstat.st_uid,
-- 
1.7.2.2
