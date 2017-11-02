From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Nov 2017 20:48:34 +0100
Subject: [Buildroot] [PATCH 1/1] packages/gpm: Fix FTBFS with glibc 2.26
Message-ID: <20171102194834.30515-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use sigemptyset API instead of __sigemptyset
__sigemptyset has been removed from glibc public
API headers in upcoming (2.26) release onwards

Patch taken from
https://github.com/telmich/gpm/pull/20/commits/fdc42770596e25749f7e2ce0ea97882177397167

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Patch also has been adopted by Fedora:
http://pkgs.fedoraproject.org/cgit/rpms/gpm.git/commit/?id=dbf661f05db3f83ed1f3e9d86a368a4811d3a971
---
 ...-sigemptyset-API-instead-of-__sigemptyset.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch

diff --git a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
new file mode 100644
index 0000000000..2a5156f24e
--- /dev/null
+++ b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
@@ -0,0 +1,32 @@
+From fdc42770596e25749f7e2ce0ea97882177397167 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Jun 2017 07:25:33 -0700
+Subject: [PATCH] Use sigemptyset API instead of __sigemptyset
+
+__sigemptyset has been removed from glibc public
+API headers in upcoming (2.26) release onwards
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-- 
2.14.2
