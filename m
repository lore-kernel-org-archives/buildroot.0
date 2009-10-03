From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 22:01:08 +0200
Subject: [Buildroot] [git commit master] kernel-headers: add unifdef getline
	fix for old kernel
Message-ID: <20091003200148.87857776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8360f0c89bbadb798ed4379d19a003f36e4e2685
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix is in mainline since 2.6.29, and was backported in the 2.6.27.x
stable versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../linux-2.6.26.8-unifdef-getline.patch           |   56 ++++++++++++++++++++
 .../linux-2.6.28.10-unifdef-getline.patch          |   56 ++++++++++++++++++++
 2 files changed, 112 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch

diff --git a/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch b/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch
new file mode 100644
index 0000000..f4a4820
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch
@@ -0,0 +1,56 @@
+From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
+From: Justin P. Mattock <justinmattock@gmail.com>
+Date: Sat, 7 Mar 2009 13:31:29 +0100
+Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
+
+This fixes an error when compiling the kernel.
+
+  CHK     include/linux/version.h
+  HOSTCC  scripts/unifdef
+scripts/unifdef.c:209: error: conflicting types for 'getline'
+/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
+make[1]: *** [scripts/unifdef] Error 1
+make: *** [__headers] Error 2
+
+Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
+Cc:  Frederic Weisbecker <fweisbec@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ scripts/unifdef.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/unifdef.c b/scripts/unifdef.c
+index 552025e..05a31a6 100644
+--- a/scripts/unifdef.c
++++ b/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
+-- 
+1.6.3.3
+
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch b/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch
new file mode 100644
index 0000000..f4a4820
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch
@@ -0,0 +1,56 @@
+From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
+From: Justin P. Mattock <justinmattock@gmail.com>
+Date: Sat, 7 Mar 2009 13:31:29 +0100
+Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
+
+This fixes an error when compiling the kernel.
+
+  CHK     include/linux/version.h
+  HOSTCC  scripts/unifdef
+scripts/unifdef.c:209: error: conflicting types for 'getline'
+/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
+make[1]: *** [scripts/unifdef] Error 1
+make: *** [__headers] Error 2
+
+Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
+Cc:  Frederic Weisbecker <fweisbec@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ scripts/unifdef.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/unifdef.c b/scripts/unifdef.c
+index 552025e..05a31a6 100644
+--- a/scripts/unifdef.c
++++ b/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
+-- 
+1.6.3.3
+
-- 
1.6.3.3
