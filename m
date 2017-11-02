From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 21:18:24 +0100
Subject: [Buildroot] [git commit] gpm: fix build with glibc 2.26
Message-ID: <20171102201232.B7529810D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a5a9d3570ca59f03b6f04ace1c0a30190695c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use sigemptyset() API instead of __sigemptyset(). __sigemptyset() has
been removed from glibc public API headers in upcoming (2.26) release
onwards.

Patch taken from:
https://github.com/telmich/gpm/pull/20/commits/fdc42770596e25749f7e2ce0ea97882177397167

Fixes:

  http://autobuild.buildroot.net/results/15e24f8c6a3ad2bfd198cc4fb094aeace7d1ee6a/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-sigemptyset-API-instead-of-__sigemptyset.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
new file mode 100644
index 0000000..01c7424
--- /dev/null
+++ b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
@@ -0,0 +1,33 @@
+From fdc42770596e25749f7e2ce0ea97882177397167 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Jun 2017 07:25:33 -0700
+Subject: [PATCH] Use sigemptyset API instead of __sigemptyset
+
+__sigemptyset has been removed from glibc public
+API headers in upcoming (2.26) release onwards
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ src/prog/gpm-root.y | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 5126c65..76c896c 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -1196,11 +1196,7 @@ int main(int argc, char **argv)
+                                                         LOG_DAEMON : LOG_USER);
+    /* reap your zombies */
+    childaction.sa_handler=reap_children;
+-#if defined(__GLIBC__)
+-   __sigemptyset(&childaction.sa_mask);
+-#else /* __GLIBC__ */
+    sigemptyset(&childaction.sa_mask);
+-#endif /* __GLIBC__ */
+    childaction.sa_flags=0;
+    sigaction(SIGCHLD,&childaction,NULL);
+ 
+-- 
+2.14.2
+
