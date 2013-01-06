From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:17:20 +0100
Subject: [Buildroot] [git commit] pacakge/tvheadend: fix failures due to
	-Werror
Message-ID: <20130106204311.C0DCA9A631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81faecdb9b43ab9f31b7b2a443238c7c78915129
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(Partially) apply upstream patch 1334869bf0ea668e58e1c72daa3c09c1a95b5d81
to properly protect code-paths depending on execinfo.h (for backtrace(3)).

Fixes:
    http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/tvheadend-fix-Werror.patch |   44 ++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend-fix-Werror.patch b/package/tvheadend/tvheadend-fix-Werror.patch
new file mode 100644
index 0000000..5f6dbad
--- /dev/null
+++ b/package/tvheadend/tvheadend-fix-Werror.patch
@@ -0,0 +1,44 @@
+commit 1334869bf0ea668e58e1c72daa3c09c1a95b5d81
+Author: Alexey I. Froloff <raorn@raorn.name>
+Date:   Wed Oct 24 21:10:15 2012 +0400
+
+    [PR-172] Fix compilatioin issues on OpenWRT
+    
+    Fix SHA1_* function names
+    Fix unused variables and functions
+
+---
+"Yann E. MORIN" <yann.morin.1998@free.fr>:
+    For buildroot, I removed the SHA_* fixes, as we're not affected.
+    No point in fixing something that does not bug us.
+
+diff --git a/src/trap.c b/src/trap.c
+index bd76118..b0fe543 100644
+--- a/src/trap.c
++++ b/src/trap.c
+@@ -67,6 +67,7 @@ sappend(char *buf, size_t l, const char *fmt, ...)
+ /**
+  *
+  */
++#if ENABLE_EXECINFO
+ static int
+ add2lineresolve(const char *binary, void *addr, char *buf0, size_t buflen)
+ {
+@@ -126,6 +127,7 @@ add2lineresolve(const char *binary, void *addr, char *buf0, size_t buflen)
+   close(fd[0]);
+   return 0;
+ }
++#endif /* ENABLE_EXECINFO */
+ 
+ 
+ 
+@@ -133,8 +135,8 @@ static void
+ traphandler(int sig, siginfo_t *si, void *UC)
+ {
+   ucontext_t *uc = UC;
+-  char buf[200];
+ #if ENABLE_EXECINFO
++  char buf[200];
+   static void *frames[MAXFRAMES];
+   int nframes = backtrace(frames, MAXFRAMES);
+   Dl_info dli;
