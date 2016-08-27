From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 15:45:43 +0200
Subject: [Buildroot] [git commit] jack2: fix build issue with glibc
Message-ID: <20160827134553.C5A5A81EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06ae84405d8c0e7308b780aab532a8be64a08457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With glibc 2.16, we get following build error when building jack2:

  [193/247] cxx: tests/iodelay.cpp -> build/tests/iodelay.cpp.4.o
  ../tests/iodelay.cpp:171:43: error: 'UINT32_MAX' was not declared in this scope
  ../tests/iodelay.cpp:171:55: error: 'UINT32_MAX' was not declared in this scope
  ../tests/iodelay.cpp:172:44: error: 'UINT32_MAX' was not declared in this scope
  ../tests/iodelay.cpp:172:56: error: 'UINT32_MAX' was not declared in this scope

In glibc 2.17 or older version, Header <stdint.h> defines these macros
for C++ only if explicitly requested by defining __STDC_LIMIT_MACROS.

We can't use <cstdint> since it requires C++11 standard.

Fixes:

  http://autobuild.buildroot.net/results/369ce208ffea43dad75ba0a13469159b341e3bf5/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-tests-define-__STDC_LIMIT_MACROS.patch    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch b/package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch
new file mode 100644
index 0000000..e4990b5
--- /dev/null
+++ b/package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch
@@ -0,0 +1,41 @@
+From c971aaab74ca6e7d4ac3a06bd26e7309dfc5da45 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Date: Mon, 22 Aug 2016 19:04:47 +0530
+Subject: [PATCH] tests: define __STDC_LIMIT_MACROS
+
+With glibc 2.16, we get following build error when building jack2:
+
+  [193/247] cxx: tests/iodelay.cpp -> build/tests/iodelay.cpp.4.o
+  ../tests/iodelay.cpp:171:43: error: 'UINT32_MAX' was not declared in this scope
+  ../tests/iodelay.cpp:171:55: error: 'UINT32_MAX' was not declared in this scope
+  ../tests/iodelay.cpp:172:44: error: 'UINT32_MAX' was not declared in this scope
+  ../tests/iodelay.cpp:172:56: error: 'UINT32_MAX' was not declared in this scope
+
+In glibc 2.17 or older version, Header <stdint.h> defines these macros
+for C++ only if explicitly requested by defining __STDC_LIMIT_MACROS.
+
+We can't use <cstdint> since it requires C++11 standard.
+
+This build issue found by Buildroot autobuilder.
+http://autobuild.buildroot.net/results/369/369ce208ffea43dad75ba0a13469159b341e3bf5/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ tests/iodelay.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/iodelay.cpp b/tests/iodelay.cpp
+index 1ef470f..f5c5836 100644
+--- a/tests/iodelay.cpp
++++ b/tests/iodelay.cpp
+@@ -20,6 +20,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#define __STDC_LIMIT_MACROS
+ #include <stdint.h>
+ #include <math.h>
+ #include <unistd.h>
+-- 
+2.6.2
+
