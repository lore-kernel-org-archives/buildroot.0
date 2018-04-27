From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Apr 2018 07:40:33 +0300
Subject: [Buildroot] [PATCH 2/2] procps-ng: fix build for sparc
In-Reply-To: <cd7b2acad0806087a77f051a284df39802c8ff74.1524804032.git.baruch@tkos.co.il>
References: <cd7b2acad0806087a77f051a284df39802c8ff74.1524804032.git.baruch@tkos.co.il>
Message-ID: <e08f94156180d57615133a39d0def220668814d5.1524804032.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch taken from upstream bug report to fix wrong signal undefined
in sparc.

Fixes:
http://autobuild.buildroot.net/results/b02/b02bd2e4032287d3c5c58255d621ef785c5d1380/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-proc-sig-fix-build-for-sparc.patch   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch

diff --git a/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch b/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch
new file mode 100644
index 000000000000..74f822aea357
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
-- 
2.17.0
