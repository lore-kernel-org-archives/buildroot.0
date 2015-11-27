From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:49:49 +0100
Subject: [Buildroot] [git commit] espeak: fix build on sparc64
Message-ID: <20151127185004.2D1A181F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=645750d1c891a17b6d01a1b763bf4a27389c25b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sparc64 needs object files to be built with -fPIC in order to be
usable in shared libraries, otherwise the shared library cannot be
created.

Fixes:

  http://autobuild.buildroot.org/results/8b8/8b894f0bd42c18e7cda98c15480757f10d743423/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...f-shared-library-on-architectures-needing.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch b/package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch
new file mode 100644
index 0000000..2590e15
--- /dev/null
+++ b/package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch
@@ -0,0 +1,31 @@
+From 08a464e2b6bd31bb2bf4e258ebfa9b9d65805abf Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 27 Nov 2015 15:17:02 +0100
+Subject: [PATCH] Fix build of shared library on architectures needing -fPIC
+
+Certain architectures, like Sparc and Sparc64 require objects to be
+built with -fPIC (and not just -fpic) to be usable in shared
+libraries. On other architectures, -fPIC is the same as -fpic so this
+patch doesn't affect such architectures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 95fe549..c293611 100755
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -110,7 +110,7 @@ $(BIN2_NAME): $(OBJS3) $(LIB_NAME)
+ 
+ 
+ x_%.o: %.cpp
+-	$(CXX) $(CXXFLAGS) $(USE_AUDIO) -D PATH_ESPEAK_DATA=\"$(DATADIR)\" -Wall -fpic -fvisibility=hidden -pedantic \
++	$(CXX) $(CXXFLAGS) $(USE_AUDIO) -D PATH_ESPEAK_DATA=\"$(DATADIR)\" -Wall -fPIC -fvisibility=hidden -pedantic \
+ 	-I. -D LIBRARY -c -fno-exceptions  $<  -o x_$*.o
+ 
+ $(LIB_NAME): $(OBJS2)
+-- 
+2.6.3
+
