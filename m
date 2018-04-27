From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 22:25:57 +0200
Subject: [Buildroot] [git commit] procps-ng: fix build for sparc
Message-ID: <20180427202831.1976088EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9a64b7207d1682d2f66c41373c6de391a224fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch taken from upstream bug report to fix wrong signal undefined
in sparc.

Fixes:
http://autobuild.buildroot.net/results/b02/b02bd2e4032287d3c5c58255d621ef785c5d1380/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-proc-sig-fix-build-for-sparc.patch        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch b/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch
new file mode 100644
index 0000000000..74f822aea3
--- /dev/null
+++ b/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch
@@ -0,0 +1,43 @@
+From 070feb7c5ebd0f2ca721ca5d75bdd3fd8cffe961 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 27 Apr 2018 07:34:57 +0300
+Subject: [PATCH] proc/sig: fix build for sparc
+
+The code undefines SIGLOST which breaks references to SIGPWR.
+
+Taken from a patch suggested in upstream bug report #93.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://gitlab.com/procps-ng/procps/issues/93
+---
+ proc/sig.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/proc/sig.c b/proc/sig.c
+index b883185fc28a..6ca9512cc70c 100644
+--- a/proc/sig.c
++++ b/proc/sig.c
+@@ -52,10 +52,6 @@
+ #  undef SIGSTKFLT
+ #endif
+ 
+-#if !defined(__GNU__) && defined(SIGLOST)
+-#  undef SIGLOST
+-#endif
+-
+ #ifndef SIGRTMIN
+ #  warning Standards require that <signal.h> define SIGRTMIN; assuming 32
+ #  define SIGRTMIN 32
+@@ -87,7 +83,7 @@ static const mapstruct sigtable[] = {
+   {"ILL",    SIGILL},
+   {"INT",    SIGINT},
+   {"KILL",   SIGKILL},
+-#ifdef SIGLOST
++#if defined(__GNU__)
+   {"LOST",   SIGLOST},  /* Hurd-specific */
+ #endif
+   {"PIPE",   SIGPIPE},
+-- 
+2.17.0
+
