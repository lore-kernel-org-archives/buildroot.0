From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:30:28 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libpam-tacplus:
 fix compilation with GCC 8
Message-ID: <20181216212625.6B0928B773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=193371ab43855a7ac8b824d42b6c3b55fd307126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

GCC 8 demands that the size of the string copied by strncpy be smaller
than the size of the destination to keep space for the trailibg '\0'.
This causes a compilation error in pam_tacplus, so add a patch already
sent uptream to fix it.

Fixes:
  http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d92c696cc80e76946444f812412b25cea4c860d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-Fix-compilation-of-tacc.c-with-GCC-8.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch b/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch
new file mode 100644
index 0000000000..2f87b92767
--- /dev/null
+++ b/package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch
@@ -0,0 +1,39 @@
+From 4c9635b03d0acf140f65004be9d4822297ee5a35 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Mon, 10 Dec 2018 17:27:16 -0200
+Subject: [PATCH] Fix compilation of tacc.c with GCC 8
+
+GCC 8 demands that the size of the string copied by strncpy be smaller
+than the size of the destination to keep space for the trailibg '\0':
+
+tacc.c:378:3: error: 'strncpy' specified bound 4 equals destination size [-Werror=stringop-truncation]
+   strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id));
+
+Ensure that no more than sizeof(utmpx.ut_id) - 1 characters are copied
+and that a trailing '\0' is stored.
+
+Fixes:
+  http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ tacc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tacc.c b/tacc.c
+index f61e2d7..3c1a40c 100644
+--- a/tacc.c
++++ b/tacc.c
+@@ -375,7 +375,8 @@ int main(int argc, char **argv) {
+ 		utmpx.ut_type = USER_PROCESS;
+ 		utmpx.ut_pid = getpid();
+ 		xstrcpy(utmpx.ut_line, tty, sizeof(utmpx.ut_line));
+-		strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id));
++		strncpy(utmpx.ut_id, tty + C_STRLEN("tty"), sizeof(utmpx.ut_id) - 1);
++		utmpx.ut_id[sizeof(utmpx.ut_id) - 1] = '\0';
+ 		xstrcpy(utmpx.ut_host, "dialup", sizeof(utmpx.ut_host));
+ 		utmpx.ut_tv.tv_sec = tv.tv_sec;
+ 		utmpx.ut_tv.tv_usec = tv.tv_usec;
+-- 
+2.14.5
+
