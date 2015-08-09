From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  9 Aug 2015 12:05:50 +0200
Subject: [Buildroot] [PATCH] package/util-linux: fix vipw build with musl
Message-ID: <1439114750-11060-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

__P() is used for compatibility with old K&R C compilers. With
ANSI C this macro has no effect.

This fixes a compilation error with musl libc because of undeclared
__P.

Fixes:
http://autobuild.buildroot.net/results/237/2377ae85bb9d85ba4c02706207f0b3bde3ccd027

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...004-vipw-Remove-pre-ANSI-compiler-support.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch

diff --git a/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch b/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch
new file mode 100644
index 0000000..3a0c42a
--- /dev/null
+++ b/package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch
@@ -0,0 +1,35 @@
+From 9ce534491aea9b7975cfee5064423d0b850d8002 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 9 Aug 2015 11:20:00 +0200
+Subject: [PATCH] vipw: Remove pre-ANSI compiler support
+
+__P() is used for compatibility with old K&R C compilers. With
+ANSI C this macro has no effect.
+
+This fixes a compilation error with musl libc because of undeclared
+__P.
+
+Ref:
+https://lists.samba.org/archive/samba-technical/2015-June/108042.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ login-utils/vipw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/login-utils/vipw.c b/login-utils/vipw.c
+index 668f4d8..e4c803b 100644
+--- a/login-utils/vipw.c
++++ b/login-utils/vipw.c
+@@ -85,7 +85,7 @@ int program;
+ char orig_file[FILENAMELEN];	/* original file /etc/passwd or /etc/group */
+ char *tmp_file;			/* tmp file */
+ 
+-void pw_error __P((char *, int, int));
++void pw_error (char *, int, int);
+ 
+ static void copyfile(int from, int to)
+ {
+-- 
+2.4.3
+
-- 
2.4.3
