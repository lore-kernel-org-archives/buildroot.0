From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:44:03 +0200
Subject: [Buildroot] [git commit] package/util-linux: fix vipw build with
	musl
Message-ID: <20150810134408.8A9A78185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=076c508d1b3ac6e68baf9373b05974727a697550
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

__P() is used for compatibility with old K&R C compilers. With
ANSI C this macro has no effect.

This fixes a compilation error with musl libc because of undeclared
__P.

Fixes:
http://autobuild.buildroot.net/results/237/2377ae85bb9d85ba4c02706207f0b3bde3ccd027

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...004-vipw-Remove-pre-ANSI-compiler-support.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

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
