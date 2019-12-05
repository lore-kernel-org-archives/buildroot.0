From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:51:11 +0100
Subject: [Buildroot] [git commit] package/libnspr: bump to version 4.24
Message-ID: <20191205214250.C1DF78820E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8c2ed0f17f6c63dac9e562aff10c46093f8a102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches have been upstreamed so remove them.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnspr/0001-nios2.patch      | 76 --------------------------------
 package/libnspr/0002-microblaze.patch | 81 -----------------------------------
 package/libnspr/0003-nds32.patch      | 73 -------------------------------
 package/libnspr/libnspr.hash          |  2 +-
 package/libnspr/libnspr.mk            |  2 +-
 5 files changed, 2 insertions(+), 232 deletions(-)

diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
deleted file mode 100644
index 52fbbfdddd..0000000000
--- a/package/libnspr/0001-nios2.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Bug 1578360 - Add Nios-II support
-
-[Gustavo: update for nspr 4.10.9]
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-[Fabrice: update for nspr 4.20]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Giulio: update for nspr 4.22]
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -r 3af4891397ab -r 8487beb203e9 nspr/pr/include/md/_linux.cfg
---- a/nspr/pr/include/md/_linux.cfg	Mon Aug 19 16:17:52 2019 +0200
-+++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:25:11 2019 +0200
-@@ -1157,6 +1157,51 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(__nios2__)
-+
-+#define IS_LITTLE_ENDIAN 1
-+#undef  IS_BIG_ENDIAN
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   4
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  4
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2   2
-+#define PR_BYTES_PER_DWORD_LOG2  3
-+
- #else
- 
- #error "Unknown CPU architecture"
-diff -r 3af4891397ab -r 8487beb203e9 nspr/pr/include/md/_linux.h
---- a/nspr/pr/include/md/_linux.h	Mon Aug 19 16:17:52 2019 +0200
-+++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:25:11 2019 +0200
-@@ -63,6 +63,8 @@
- #define _PR_SI_ARCHITECTURE "riscv64"
- #elif defined(__arc__)
- #define _PR_SI_ARCHITECTURE "arc"
-+#elif defined(__nios2__)
-+#define _PR_SI_ARCHITECTURE "nios2"
- #else
- #error "Unknown CPU architecture"
- #endif
diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
deleted file mode 100644
index 6558882bd7..0000000000
--- a/package/libnspr/0002-microblaze.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Bug 1578363 - Add Microblaze support
-
-[Gustavo: update for nspr 4.10.9]
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-[Fabrice: update for nspr 4.20]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Giulio: update for nspr 4.22]
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -r 8487beb203e9 -r ab7d5c504daf nspr/pr/include/md/_linux.cfg
---- a/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:25:11 2019 +0200
-+++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:33:15 2019 +0200
-@@ -1202,6 +1202,56 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(__microblaze__)
-+
-+#if defined(__BIG_ENDIAN__)
-+#define IS_BIG_ENDIAN 1
-+#undef  IS_LITTLE_ENDIAN
-+#else
-+#define IS_LITTLE_ENDIAN 1
-+#undef  IS_BIG_ENDIAN
-+#endif
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   4
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  4
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2   2
-+#define PR_BYTES_PER_DWORD_LOG2  3
-+
- #else
- 
- #error "Unknown CPU architecture"
-diff -r 8487beb203e9 -r ab7d5c504daf nspr/pr/include/md/_linux.h
---- a/nspr/pr/include/md/_linux.h	Tue Sep 03 11:25:11 2019 +0200
-+++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:33:15 2019 +0200
-@@ -65,6 +65,8 @@
- #define _PR_SI_ARCHITECTURE "arc"
- #elif defined(__nios2__)
- #define _PR_SI_ARCHITECTURE "nios2"
-+#elif defined(__microblaze__)
-+#define _PR_SI_ARCHITECTURE "microblaze"
- #else
- #error "Unknown CPU architecture"
- #endif
diff --git a/package/libnspr/0003-nds32.patch b/package/libnspr/0003-nds32.patch
deleted file mode 100644
index 49d0d81aca..0000000000
--- a/package/libnspr/0003-nds32.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Bug 1578364 - Add Nds32 support
-
-Signed-off-by: Nylon Chen <nylon7@andestech.com>
-[Giulio: update for nspr 4.22]
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -r ab7d5c504daf -r d212d80704a2 nspr/pr/include/md/_linux.cfg
---- a/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:33:15 2019 +0200
-+++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:36:05 2019 +0200
-@@ -1252,6 +1252,51 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(__nds32__)
-+
-+#define IS_LITTLE_ENDIAN 1
-+#undef  IS_BIG_ENDIAN
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   4
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  4
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2   2
-+#define PR_BYTES_PER_DWORD_LOG2  3
-+
- #else
- 
- #error "Unknown CPU architecture"
-diff -r ab7d5c504daf -r d212d80704a2 nspr/pr/include/md/_linux.h
---- a/nspr/pr/include/md/_linux.h	Tue Sep 03 11:33:15 2019 +0200
-+++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:36:05 2019 +0200
-@@ -67,6 +67,8 @@
- #define _PR_SI_ARCHITECTURE "nios2"
- #elif defined(__microblaze__)
- #define _PR_SI_ARCHITECTURE "microblaze"
-+#elif defined(__nds32__)
-+#define _PR_SI_ARCHITECTURE "nds32"
- #else
- #error "Unknown CPU architecture"
- #endif
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0317f20b19..0ec475f480 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
-sha256	4b9d821037faf5723da901515ed9cac8b23ef1ea3729022259777393453477a4  nspr-4.23.tar.gz
+sha256	90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0  nspr-4.24.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index f21f69a746..42b4350d90 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.23
+LIBNSPR_VERSION = 4.24
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
