From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  1 May 2015 14:08:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/boost: bump to version 1.58.0
Message-ID: <1430482091-8140-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch from [1] to fix autobuild error [2] for mips:
	mipsel-linux-g++: error: unrecognized command line option '-m32'

[1] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
[2] http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - Add upstream patch
---
 package/boost/0002-gcc-jam-mips1-fix.patch | 24 ++++++++++++++++++++++++
 package/boost/boost.hash                   |  6 +++---
 package/boost/boost.mk                     |  2 +-
 3 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 package/boost/0002-gcc-jam-mips1-fix.patch

diff --git a/package/boost/0002-gcc-jam-mips1-fix.patch b/package/boost/0002-gcc-jam-mips1-fix.patch
new file mode 100644
index 0000000..276626c
--- /dev/null
+++ b/package/boost/0002-gcc-jam-mips1-fix.patch
@@ -0,0 +1,24 @@
+package/boost: gcc.jam mips1 fix
+
+gcc.jam was passing the options -m32 and -m64 to mips cross-compilers, when
+those do not use such options. This modification solves it by adding mips as
+an exception.
+
+Fixes autobuild error:
+http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058
+
+Signed-off-by: Carlos M. Ferreira carlosmf.pt at gmail.com
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Backported-from: c0634341d9ee2c02d3a55c91dafb988afc066c49
+
+--- boost_1_58_0/tools/build/src/tools/gcc.jam 2015-04-23 12:01:37.723438995 +0200
++++ boost_1_58_0/tools/build/src/tools/gcc.jam 2015-04-23 12:00:21.427441384 +0200
+@@ -451,7 +451,7 @@
+         else
+         {
+             local arch = [ feature.get-values architecture : $(properties) ] ;
+-            if $(arch) != arm
++            if $(arch) != arm && $(arch) != mips1
+             {
+                 if $(model) = 32
+                 {
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 2019743..706eea2 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.57.0/
-md5	1be49befbdd9a5ce9def2983ba3e7b76	boost_1_57_0.tar.bz2
-sha1	e151557ae47afd1b43dc3fac46f8b04a8fe51c12	boost_1_57_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.58.0/
+md5	b8839650e61e9c1c0a89f371dd475546	boost_1_58_0.tar.bz2
+sha1	2fc96c1651ac6fe9859b678b165bd78dc211e881	boost_1_58_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7060591..c658628 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.57.0
+BOOST_VERSION = 1.58.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.3.7
