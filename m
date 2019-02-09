From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Feb 2019 09:13:53 +0100
Subject: [Buildroot] [git commit] package/brcm-patchram-plus: fix build on
 sparc
Message-ID: <20190209081231.86187827FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=684bcc45e52a8300a2115799e96017b180695a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
are not necessarily available, so use those values only if defined in
the kernel headers.

It fixes SPARC build failures such as:
main.c:382:13: error: 'B2500000' undeclared here (not in a function)
  { 2500000, B2500000 },
             ^~~~~~~~
main.c:383:13: error: 'B3000000' undeclared here (not in a function)
  { 3000000, B3000000 },
             ^~~~~~~~
main.c:385:13: error: 'B3500000' undeclared here (not in a function)
  { 3500000, B3500000 },
             ^~~~~~~~
main.c:386:13: error: 'B4000000' undeclared here (not in a function)
  { 4000000, B4000000 }

Fixes:
 - http://autobuild.buildroot.org/results/f7012c08c935c3a6ccae50b84170190af5cd5cba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-main.c-fix-build-on-SPARC.patch       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch b/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch
new file mode 100644
index 0000000000..5567284cdf
--- /dev/null
+++ b/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch
@@ -0,0 +1,64 @@
+From 8ff9d421372a7cb780fbafd8b1d556ee549bf109 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Feb 2019 23:21:04 +0100
+Subject: [PATCH] src/main.c: fix build on SPARC
+
+On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
+are not necessarily available, so use those values only if defined in
+the kernel headers.
+
+It fixes SPARC build failures such as:
+main.c:382:13: error: 'B2500000' undeclared here (not in a function)
+  { 2500000, B2500000 },
+             ^~~~~~~~
+main.c:383:13: error: 'B3000000' undeclared here (not in a function)
+  { 3000000, B3000000 },
+             ^~~~~~~~
+main.c:385:13: error: 'B3500000' undeclared here (not in a function)
+  { 3500000, B3500000 },
+             ^~~~~~~~
+main.c:386:13: error: 'B4000000' undeclared here (not in a function)
+  { 4000000, B4000000 }
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f7012c08c935c3a6ccae50b84170190af5cd5cba
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/AsteroidOS/brcm-patchram-plus/pull/1]
+---
+ src/main.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index 040cfe1..17c5191 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -378,12 +378,20 @@ tBaudRates baud_rates[] = {
+ 	{ 1000000, B1000000 },
+ 	{ 1152000, B1152000 },
+ 	{ 1500000, B1500000 },
+-	{ 2000000, B2000000 },
+-	{ 2500000, B2500000 },
+-	{ 3000000, B3000000 },
++	{ 2000000, B2000000 }
++#ifdef B2500000
++	,{ 2500000, B2500000 }
++#endif
++#ifdef B3000000
++	,{ 3000000, B3000000 }
++#endif
+ #ifndef __CYGWIN__
+-	{ 3500000, B3500000 },
+-	{ 4000000, B4000000 }
++#ifdef B3500000
++	,{ 3500000, B3500000 }
++#endif
++#ifdef B4000000
++	,{ 4000000, B4000000 }
++#endif
+ #endif
+ };
+ 
+-- 
+2.14.1
+
