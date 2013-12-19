From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 16:34:23 +0100
Subject: [Buildroot] [git commit] qt5base: Add support for MIPS64 BigEndian
Message-ID: <20131219153646.5453C9C0FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16e3c09442fc306fa5749c8cdd03030a86f27502
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for MIPS64 BigEndian platforms and has already
been merged upstream:

https://github.com/qtproject/qtbase/commit/cea101bd10cc158b97d5fbf45b33dad9b649c08b

Now we can remove the restriction on the Config.in to disable the
selection of this packages on MIPS64 BigEndian platforms.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                              |    1 -
 .../qt5base-0001-Fix-build-MIPS64-bigendian.patch  |   51 ++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b92d329..42724dc 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_PACKAGE_QT
-	depends on !BR2_mips64 || !BR2_MIPS_NABI64
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
diff --git a/package/qt5/qt5base/qt5base-0001-Fix-build-MIPS64-bigendian.patch b/package/qt5/qt5base/qt5base-0001-Fix-build-MIPS64-bigendian.patch
new file mode 100644
index 0000000..00dcd48
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0001-Fix-build-MIPS64-bigendian.patch
@@ -0,0 +1,51 @@
+qt5base: Fix build error on 64bit BigEndian platforms
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From cea101bd10cc158b97d5fbf45b33dad9b649c08b Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 2 Dec 2013 13:59:34 +0000
+Subject: [PATCH] qtbase: Fix build error on 64bit BigEndian platforms
+
+The functions fromBytesToWord() and fromWordToBytes() are called when
+building on 64bit BigEndian platforms. It fails because those
+functions are disabled on the source code. Enabling those functions for
+64bit BigEndian platforms fixes the problem.
+
+Task-number: QTBUG-35228
+
+Change-Id: I5ccacd4fb5051df05f67c8da879b3a9e49953861
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Reviewed-by: Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
+Reviewed-by: Richard J. Moore <rich@kde.org>
+---
+ src/3rdparty/sha3/KeccakF-1600-opt64.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+ mode change 100755 => 100644 src/3rdparty/sha3/KeccakF-1600-opt64.c
+
+diff --git a/src/3rdparty/sha3/KeccakF-1600-opt64.c b/src/3rdparty/sha3/KeccakF-1600-opt64.c
+old mode 100755
+new mode 100644
+index 7bd442e..a547bb5
+--- a/src/3rdparty/sha3/KeccakF-1600-opt64.c
++++ b/src/3rdparty/sha3/KeccakF-1600-opt64.c
+@@ -328,7 +328,7 @@ static void KeccakPermutation(unsigned char *state)
+     KeccakPermutationOnWords((UINT64*)state);
+ }
+ 
+-#if 0 // Unused in the Qt configuration
++#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
+ static void fromBytesToWord(UINT64 *word, const UINT8 *bytes)
+ {
+     unsigned int i;
+@@ -449,7 +449,7 @@ static void KeccakAbsorb(unsigned char *state, const unsigned char *data, unsign
+ #endif
+ }
+ 
+-#if 0 // Unused in the Qt configuration
++#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
+ static void fromWordToBytes(UINT8 *bytes, const UINT64 word)
+ {
+     unsigned int i;
+-- 
+1.8.5.1
+
