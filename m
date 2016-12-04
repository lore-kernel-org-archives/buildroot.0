From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Sun,  4 Dec 2016 16:55:40 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: fix build without C++ compiler
In-Reply-To: <20161204163745.459990e3@free-electrons.com>
References: <20161204163745.459990e3@free-electrons.com>
Message-ID: <1480866940-967-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>

Conditionally deactivate compilation of optional C++ module.

Fixes:
http://autobuild.buildroot.net/results/cbf/cbff6c816606a515467d467677763533a41fc276/
Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 package/libxmlrpc/0002-fix-non-cplusplus-build.patch | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/libxmlrpc/0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
index efeb9cc..2d5bfcc 100644
--- a/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
+++ b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
@@ -1,9 +1,10 @@
 Handle builds without C++
 
 libxmlrpc nicely handles the fact of being built without C++ support,
-except for one location, fixed by this patch.
+except for two locations, fixed by this patch.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
 
 Index: b/lib/util/Makefile
 ===================================================================
@@ -25,3 +26,19 @@ Index: b/lib/util/Makefile
  .PHONY: all
  all: $(LIBOBJS)
  
+Index: b/lib/Makefile
+===================================================================
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -9,7 +9,10 @@
+ 
+ # Build up SUBDIRS:
+ SUBDIRS = 
+-SUBDIRS += util libutil libutil++
++SUBDIRS += util libutil
++ifeq ($(ENABLE_CPLUSPLUS),yes)
++  SUBDIRS += libutil++
++endif
+ ifeq ($(ENABLE_ABYSS_SERVER),yes)
+   SUBDIRS += abyss
+   ifeq ($(ENABLE_CPLUSPLUS),yes)
-- 
2.7.0
