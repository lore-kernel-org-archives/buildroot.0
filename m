From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:41 -0600
Subject: [Buildroot] [PATCH v2] libnspr: add microblaze support
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes autobuild failures

http://autobuild.buildroot.net/results/493/4932900522e87da84a47fbf2d796c2fbb3f7e741/build-end.log

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libnspr/libnspr-0001-nios2.patch      | 71 +++++++++++++++++++++++++
 package/libnspr/libnspr-0002-microblaze.patch | 76 +++++++++++++++++++++++++++
 package/libnspr/libnspr-nios2.patch           | 71 -------------------------
 3 files changed, 147 insertions(+), 71 deletions(-)
 create mode 100644 package/libnspr/libnspr-0001-nios2.patch
 create mode 100644 package/libnspr/libnspr-0002-microblaze.patch
 delete mode 100644 package/libnspr/libnspr-nios2.patch

diff --git a/package/libnspr/libnspr-0001-nios2.patch b/package/libnspr/libnspr-0001-nios2.patch
new file mode 100644
index 0000000..cffb2ef
--- /dev/null
+++ b/package/libnspr/libnspr-0001-nios2.patch
@@ -0,0 +1,71 @@
+Add Nios-II support
+
+Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+
+diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg
+--- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:04.556139100 -0300
++++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:29.332138283 -0300
+@@ -914,6 +914,51 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(nios2)
++
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h
+--- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:04.556139100 -0300
++++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:33.245138154 -0300
+@@ -55,6 +55,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(nios2)
++#define _PR_SI_ARCHITECTURE "nios2"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
diff --git a/package/libnspr/libnspr-0002-microblaze.patch b/package/libnspr/libnspr-0002-microblaze.patch
new file mode 100644
index 0000000..93a0be5
--- /dev/null
+++ b/package/libnspr/libnspr-0002-microblaze.patch
@@ -0,0 +1,76 @@
+Add Microblaze support
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+
+diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg
+--- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:04.556139100 -0300
++++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:29.332138283 -0300
+@@ -914,6 +914,56 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__microblaze__)
++
++#if defined(__BIG_ENDIAN__)
++#define IS_BIG_ENDIAN 1
++#undef  IS_LITTLE_ENDIAN
++#else
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++#endif
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h
+--- libnspr-4.9.6.orig/mozilla/nsprpub/pr/include/md/_linux.h	2014-01-10 14:39:20.674107805 -0600
++++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h	2014-01-10 14:44:04.442112985 -0600
+@@ -55,6 +55,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(__microblaze__)
++#define _PR_SI_ARCHITECTURE "microblaze"
+ #elif defined(nios2)
+ #define _PR_SI_ARCHITECTURE "nios2"
+ #else
diff --git a/package/libnspr/libnspr-nios2.patch b/package/libnspr/libnspr-nios2.patch
deleted file mode 100644
index cffb2ef..0000000
--- a/package/libnspr/libnspr-nios2.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Add Nios-II support
-
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-
-diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg
---- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:04.556139100 -0300
-+++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:29.332138283 -0300
-@@ -914,6 +914,51 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(nios2)
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
-diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h
---- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:04.556139100 -0300
-+++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:33.245138154 -0300
-@@ -55,6 +55,8 @@
- #define _PR_SI_ARCHITECTURE "avr32"
- #elif defined(__m32r__)
- #define _PR_SI_ARCHITECTURE "m32r"
-+#elif defined(nios2)
-+#define _PR_SI_ARCHITECTURE "nios2"
- #else
- #error "Unknown CPU architecture"
- #endif
-- 
1.8.3.2
