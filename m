From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:54:10 +0200
Subject: [Buildroot] [git commit] package/boost: bump to version 1.58.0
Message-ID: <20150601220248.E53CF7FD8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5f5a829fca647718072925a29371714b64d47ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix build issues for mips and sh targets:
error: unrecognized command line option '-m32'

Fixes:
http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/
http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/

Patch send upstream:
https://github.com/boostorg/build/pull/76

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../boost/0002-gcc.jam-compiler-options-fix.patch  |   37 ++++++++++++++++++++
 package/boost/boost.hash                           |    6 ++--
 package/boost/boost.mk                             |    2 +-
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/package/boost/0002-gcc.jam-compiler-options-fix.patch b/package/boost/0002-gcc.jam-compiler-options-fix.patch
new file mode 100644
index 0000000..c645250
--- /dev/null
+++ b/package/boost/0002-gcc.jam-compiler-options-fix.patch
@@ -0,0 +1,37 @@
+From a891e48ed0b647b7bf550ad1d179398b23d0726e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 2 May 2015 13:47:54 +0200
+Subject: [PATCH] gcc.jam compiler options fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Only PowerPC, SPARC, and x86 do support the -m32 and -m64 compiler options [1].
+
+Rather then excluding all architectures not supporting these options as it is
+done in commit c0634341d9ee2c02d3a55c91dafb988afc066c49 [2], include all
+architectures that do support them.
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
+[2] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/tools/gcc.jam | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index db04534..fbe8ab0 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
+         else
+         {
+             local arch = [ feature.get-values architecture : $(properties) ] ;
+-            if $(arch) != arm
++            if $(arch) = power || $(arch) = sparc || $(arch) = x86
+             {
+                 if $(model) = 32
+                 {
+--
+2.3.7
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
