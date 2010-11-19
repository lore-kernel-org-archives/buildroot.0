From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 10:31:21 +0100
Subject: [Buildroot] [git commit master 1/1] bash: fix build issues reported
	by Dmitry Ivanov, update to pl9
Message-ID: <20101119093155.6A7E88D235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d51948317bd6f9e49883e2bd494ff64a9cb60fb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    4 +-
 package/bash/bash-4.1-008.patch              |   49 ++++++++++++++++++++++++++
 package/bash/bash-4.1-009.patch              |   48 +++++++++++++++++++++++++
 package/bash/bash-4.1-mkbuiltins-cross.patch |   31 ++++++++++++++++
 4 files changed, 130 insertions(+), 2 deletions(-)
 create mode 100644 package/bash/bash-4.1-008.patch
 create mode 100644 package/bash/bash-4.1-009.patch
 create mode 100644 package/bash/bash-4.1-mkbuiltins-cross.patch

diff --git a/CHANGES b/CHANGES
index 0e27324..2eb82ba 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,8 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libglib2, midori, module-init-tools,
-	mtd-utils, openssh, qt, sqlite, webkit
+	Updated/fixed packages: bash, libglib2, midori,
+	module-init-tools, mtd-utils, openssh, qt, sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/bash/bash-4.1-008.patch b/package/bash/bash-4.1-008.patch
new file mode 100644
index 0000000..72b855e
--- /dev/null
+++ b/package/bash/bash-4.1-008.patch
@@ -0,0 +1,49 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.1
+Patch-ID:	bash41-008
+
+Bug-Reported-by:	Dennis van Dok <dvandok@gmail.com>
+Bug-Reference-ID:	<4BBF2501.5050703@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-04/msg00038.html
+
+Bug-Description:
+
+When declaring an associative array and implicitly assigning a value
+to element "0", bash does not correctly allocate memory, leading to
+a segmentation violation when that element or the array itself is
+unset.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.1-patched/builtins/declare.def	2009-11-25 19:42:00.000000000 -0500
+--- ./builtins/declare.def	2010-05-30 18:25:21.000000000 -0400
+***************
+*** 513,517 ****
+  	      /* let bind_{array,assoc}_variable take care of this. */
+  	      if (assoc_p (var))
+! 		bind_assoc_variable (var, name, "0", value, aflags);
+  	      else
+  		bind_array_variable (name, 0, value, aflags);
+--- 519,523 ----
+  	      /* let bind_{array,assoc}_variable take care of this. */
+  	      if (assoc_p (var))
+! 		bind_assoc_variable (var, name, savestring ("0"), value, aflags);
+  	      else
+  		bind_array_variable (name, 0, value, aflags);
+*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
+--- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 7
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 8
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-009.patch b/package/bash/bash-4.1-009.patch
new file mode 100644
index 0000000..ed136a9
--- /dev/null
+++ b/package/bash/bash-4.1-009.patch
@@ -0,0 +1,48 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.1
+Patch-ID:	bash41-009
+
+Bug-Reported-by:	Tomas Trnka <tomastrnka@gmx.com>
+Bug-Reference-ID:	<201003242030.02166.tomastrnka@gmx.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-03/msg00090.html
+
+Bug-Description:
+
+An arriving SIGCHLD will interrupt `slow' system calls such as write(2) to
+or read(2) from a terminal.  This results in an error message and truncated
+input or output.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.1-patched/sig.c	Fri Aug 14 16:31:52 2009
+--- ./sig.c	Fri Mar 26 22:34:11 2010
+***************
+*** 655,660 ****
+--- 655,663 ----
+      act.sa_flags |= SA_INTERRUPT;	/* XXX */
+    else
+      act.sa_flags |= SA_RESTART;		/* XXX */
++ #else
++   if (sig == SIGCHLD)
++     act.sa_flags |= SA_RESTART;
+  #endif
+    sigemptyset (&act.sa_mask);
+    sigemptyset (&oact.sa_mask);
+*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
+--- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 8
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 9
+  
+  #endif /* _PATCHLEVEL_H_ */
+
diff --git a/package/bash/bash-4.1-mkbuiltins-cross.patch b/package/bash/bash-4.1-mkbuiltins-cross.patch
new file mode 100644
index 0000000..4252d53
--- /dev/null
+++ b/package/bash/bash-4.1-mkbuiltins-cross.patch
@@ -0,0 +1,31 @@
+Let mkbuiltins use config.h even if cross compiling
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ builtins/mkbuiltins.c |    9 ---------
+ 1 files changed, 0 insertions(+), 9 deletions(-)
+
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index cdd45e4..1349093 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
+@@ -19,16 +19,7 @@
+    along with Bash.  If not, see <http://www.gnu.org/licenses/>.
+ */
+ 
+-#if !defined (CROSS_COMPILING) 
+ #  include <config.h>
+-#else	/* CROSS_COMPILING */
+-/* A conservative set of defines based on POSIX/SUS3/XPG6 */
+-#  define HAVE_UNISTD_H
+-#  define HAVE_STRING_H
+-#  define HAVE_STDLIB_H
+-
+-#  define HAVE_RENAME
+-#endif /* CROSS_COMPILING */
+ 
+ #if defined (HAVE_UNISTD_H)
+ #  ifdef _MINIX
+-- 
+1.7.2.2
+
-- 
1.7.2.2
