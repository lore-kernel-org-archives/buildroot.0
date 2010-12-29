From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 29 Dec 2010 23:35:52 +0100
Subject: [Buildroot] [git commit master 1/1] Reset critical environment
	variables
Message-ID: <20101229224313.ED1E68EE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2bf3c1660965d73a553d3c99d6f1a62f36e0069b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reset them early in top-level Makefile to ensure they're keept unset
all the way through the build process.

This also removes the requirement of these variables being unset
globally prior the build.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                               |    6 ++++++
 toolchain/dependencies/dependencies.sh |    9 ---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 9ba80a6..6d6e836 100644
--- a/Makefile
+++ b/Makefile
@@ -186,6 +186,12 @@ cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev
 #############################################################
 unexport CROSS_COMPILE
 unexport ARCH
+unexport CC
+unexport CXX
+unexport CPP
+unexport CFLAGS
+unexport CXXFLAGS
+unexport GREP_OPTIONS
 
 GNU_HOST_NAME:=$(shell package/gnuconfig/config.guess)
 
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index c5552ca..74ab213 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -4,15 +4,6 @@
 
 export LC_ALL=C
 
-# Verify that critical environment variables aren't set
-for var in CC CXX CPP CFLAGS CXXFLAGS GREP_OPTIONS CROSS_COMPILE ARCH ; do
-    if test -n "$(eval echo '$'$var)" ; then
-	/bin/echo -e "\nYou must run 'unset $var' so buildroot can run with";
-	/bin/echo -e "a clean environment on your build machine\n";
-	exit 1;
-    fi
-done
-
 # Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
 if test $? != 0 ; then
-- 
1.7.2.2
