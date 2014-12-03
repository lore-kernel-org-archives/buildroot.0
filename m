From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Dec 2014 16:38:54 +0000
Subject: [Buildroot] [PATCH 1/2] toolchain-external: fix the help message
	for CodeSourcery MIPS
Message-ID: <1417624735-54017-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix the help message for CodeSourcery MIPS toolchains
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in             |  298 ++++++++++++--------
 .../toolchain-external/toolchain-external.hash     |    7 +
 2 files changed, 190 insertions(+), 115 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external.hash

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c9feac3..0d64cab 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -202,60 +202,76 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers
-	  3.13. It has support for the following variants:
-	    - MIPS32 O32 big endian glibc
-	      Select a MIPS generic core
+	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.13. It
+	  has support for the following variants:
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 big endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Big-Endian, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 O32 little endian glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Big-Endian, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 little endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 big endian soft float glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64 big endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS32 little endian soft float glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS64 little endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32 big endian microMIPS glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Little-Endian, O32
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32r2 - Little-Endian, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian uclibc
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
+	      Select a MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian uclibc
+	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 big endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, O32
 	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
+	      Not usable in Buildroot yet.
+	    - MIPS64r2 - Big-Endian, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Big-Endian, Soft-Float, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, Soft-Float, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	bool "Sourcery CodeBench MIPS 2013.11"
@@ -271,60 +287,76 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers
-	  3.11. It has support for the following variants:
-	    - MIPS32 O32 big endian glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 big endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers 3.11. It
+	  has support for the following variants:
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 O32 little endian glibc
-	      Select a MIPS generic core
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Big-Endian, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 little endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	    - MIPS32r2 - Big-Endian, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 big endian soft float glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64 big endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32 little endian soft float glibc
-	      Select a MIPS generic core
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS64 little endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS32 big endian microMIPS glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Little-Endian, O32
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32r2 - Little-Endian, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian uclibc
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
+	      Select a MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 big endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
 	      Not usable in Buildroot yet.
+	    - MIPS64r2 - Big-Endian, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Big-Endian, Soft-Float, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, Soft-Float, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	bool "Sourcery CodeBench MIPS 2013.05"
@@ -340,60 +372,96 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
-	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers
-	  3.8.2. It has support for the following variants:
-	    - MIPS32 O32 big endian glibc
-	      Select a MIPS generic core
+	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers 3.8.2. It
+	  has support for the following variants:
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 big endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Big-Endian, 2008 NaN, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 O32 little endian glibc
-	      Select a MIPS generic core
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008 -mips16
+	    - MIPS32r2 - Big-Endian, O32
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS64 little endian glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	    - MIPS32r2 - Big-Endian, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 big endian soft float glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64 big endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Big-Endian, O32, microMIPS
+	      Select a MIPS (big endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS32 little endian soft float glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS64 little endian soft float glibc
-	      Select a MIPS64 generic core
-	      Select the n64 ABI
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32r2 - Big-Endian, Soft-Float, O32, microMIPS
+	      Select a MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
-	    - MIPS32 big endian microMIPS glibc
-	      Select a MIPS generic core
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
+	      Select a MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian microMIPS glibc
-	      Select a MIPS generic core
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
+	    - MIPS32r2 - Little-Endian, 2008 NaN, O32, MIPS16
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008 -mips16
+	    - MIPS32r2 - Little-Endian, O32
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32r2 - Little-Endian, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, O32, microMIPS
+	      Select a MIPS (little endian) core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian soft float microMIPS glibc
-	      Select a MIPS generic core
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
+	      Select a MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 big endian uclibc
+	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
+	      Select a MIPS (little endian) core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
+	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
+	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Big-Endian, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian uclibc
+	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 big endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
 	      Not usable in Buildroot yet.
-	    - MIPS32 little endian soft float uclibc
+	    - MIPS32r2 - uClibc, Little-Endian, O32
 	      Not usable in Buildroot yet.
+	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
+	      Not usable in Buildroot yet.
+	    - MIPS64r2 - Big-Endian, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Big-Endian, Soft-Float, N64
+	      Select a MIPS (big endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64r2 - Little-Endian, Soft-Float, N64
+	      Select a MIPS (little endian) core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
 
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
 	depends on BR2_MIPS_NABI32
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
new file mode 100644
index 0000000..0d75005
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -0,0 +1,7 @@
+# Sourcery CodeBench Lite for MIPS
+# From: https://sourcery.mentor.com/GNUToolchain/release2791
+md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+# From: https://sourcery.mentor.com/GNUToolchain/release2640
+md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+# From: https://sourcery.mentor.com/GNUToolchain/release2554
+md5  937a383ab2aa5b154aa90fbc5d7b334e  mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.1
