From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:51:04 +0200
Subject: [Buildroot] [git commit] package/icu: bump version to 59.1
Message-ID: <20170605135303.368F881EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a52c925efe7a83208535a4f346cc66704cb46500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the release notes "Compiler support for C++11 is now
required for building the ICU libraries.
GCC: version 4.8 and later has been tested."

Added corresponding dependencies and reverse dependencies.
Removed patch 0006 applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/beecrypt/Config.in                         |   5 +-
 package/cppcms/Config.in                           |   5 +
 ...-utext-problems-with-handling-of-bad-utf8.patch | 173 ---------------------
 package/icu/Config.in                              |   6 +-
 package/icu/icu.hash                               |   6 +-
 package/icu/icu.mk                                 |   2 +-
 package/python-mwscrape2slob/Config.in             |   6 +-
 package/python-pyicu/Config.in                     |   6 +-
 package/python-slob/Config.in                      |   6 +-
 package/qt5/qt5base/Config.in                      |   5 +
 package/qt5/qt5webkit/Config.in                    |   5 +-
 11 files changed, 36 insertions(+), 189 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 069f3d5..a007c36 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -14,6 +14,7 @@ if BR2_PACKAGE_BEECRYPT
 config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_USE_WCHAR # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on !BR2_STATIC_LIBS
@@ -21,9 +22,9 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
-comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries"
+comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index e930c04..f02b283 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -27,11 +27,16 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
+comment "icu support needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif
 
 comment "cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library"
diff --git a/package/icu/0006-utext-problems-with-handling-of-bad-utf8.patch b/package/icu/0006-utext-problems-with-handling-of-bad-utf8.patch
deleted file mode 100644
index a4e51ae..0000000
--- a/package/icu/0006-utext-problems-with-handling-of-bad-utf8.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-ticket:12888 UText, problems with handling of bad UTF-8
-
-Fixes:
-
-CVE-2017-7867 - International Components for Unicode (ICU) for C/C++ before
-2017-02-13 has an out-of-bounds write caused by a heap-based buffer overflow
-related to the utf8TextAccess function in common/utext.cpp and the
-utext_setNativeIndex* function.
-
-CVE-2017-7868 - International Components for Unicode (ICU) for C/C++ before
-2017-02-13 has an out-of-bounds write caused by a heap-based buffer overflow
-related to the utf8TextAccess function in common/utext.cpp and the
-utext_moveIndex32* function.
-
-Upstream: http://bugs.icu-project.org/trac/changeset/39671
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-Index: /trunk/icu4c/source/common/utext.cpp
-===================================================================
---- icu4c/source/common/utext.cpp	(revision 39670)
-+++ icu4c/source/common/utext.cpp	(revision 39671)
-@@ -848,7 +848,13 @@
- 
- // Chunk size.
--//     Must be less than 85, because of byte mapping from UChar indexes to native indexes.
--//     Worst case is three native bytes to one UChar.  (Supplemenaries are 4 native bytes
--//     to two UChars.)
-+//     Must be less than 42  (256/6), because of byte mapping from UChar indexes to native indexes.
-+//     Worst case there are six UTF-8 bytes per UChar.
-+//         obsolete 6 byte form fd + 5 trails maps to fffd
-+//         obsolete 5 byte form fc + 4 trails maps to fffd
-+//         non-shortest 4 byte forms maps to fffd
-+//         normal supplementaries map to a pair of utf-16, two utf8 bytes per utf-16 unit
-+//     mapToUChars array size must allow for the worst case, 6.
-+//     This could be brought down to 4, by treating fd and fc as pure illegal,
-+//     rather than obsolete lead bytes. But that is not compatible with the utf-8 access macros.
- //
- enum { UTF8_TEXT_CHUNK_SIZE=32 };
-@@ -890,5 +896,5 @@
-                                                      //    one for a supplementary starting in the last normal position,
-                                                      //    and one for an entry for the buffer limit position.
--    uint8_t   mapToUChars[UTF8_TEXT_CHUNK_SIZE*3+6]; // Map native offset from bufNativeStart to
-+    uint8_t   mapToUChars[UTF8_TEXT_CHUNK_SIZE*6+6]; // Map native offset from bufNativeStart to
-                                                      //   correspoding offset in filled part of buf.
-     int32_t   align;
-@@ -1033,4 +1039,5 @@
-             u8b = (UTF8Buf *)ut->p;   // the current buffer
-             mapIndex = ix - u8b->toUCharsMapStart;
-+            U_ASSERT(mapIndex < (int32_t)sizeof(UTF8Buf::mapToUChars));
-             ut->chunkOffset = u8b->mapToUChars[mapIndex] - u8b->bufStartIdx;
-             return TRUE;
-@@ -1299,4 +1306,8 @@
-         //   If index is at the end, there is no character there to look at.
-         if (ix != ut->b) {
-+            // Note: this function will only move the index back if it is on a trail byte
-+            //       and there is a preceding lead byte and the sequence from the lead 
-+            //       through this trail could be part of a valid UTF-8 sequence
-+            //       Otherwise the index remains unchanged.
-             U8_SET_CP_START(s8, 0, ix);
-         }
-@@ -1312,5 +1323,8 @@
-         uint8_t *mapToNative = u8b->mapToNative;
-         uint8_t *mapToUChars = u8b->mapToUChars;
--        int32_t  toUCharsMapStart = ix - (UTF8_TEXT_CHUNK_SIZE*3 + 1);
-+        int32_t  toUCharsMapStart = ix - sizeof(UTF8Buf::mapToUChars) + 1;
-+        // Note that toUCharsMapStart can be negative. Happens when the remaining
-+        // text from current position to the beginning is less than the buffer size.
-+        // + 1 because mapToUChars must have a slot at the end for the bufNativeLimit entry.
-         int32_t  destIx = UTF8_TEXT_CHUNK_SIZE+2;   // Start in the overflow region
-                                                     //   at end of buffer to leave room
-@@ -1339,4 +1353,5 @@
-                 // Special case ASCII range for speed.
-                 buf[destIx] = (UChar)c;
-+                U_ASSERT(toUCharsMapStart <= srcIx);
-                 mapToUChars[srcIx - toUCharsMapStart] = (uint8_t)destIx;
-                 mapToNative[destIx] = (uint8_t)(srcIx - toUCharsMapStart);
-@@ -1368,4 +1383,5 @@
-                     mapToUChars[sIx-- - toUCharsMapStart] = (uint8_t)destIx;
-                 } while (sIx >= srcIx);
-+                U_ASSERT(toUCharsMapStart <= (srcIx+1));
- 
-                 // Set native indexing limit to be the current position.
-@@ -1542,4 +1558,5 @@
-     U_ASSERT(index<=ut->chunkNativeLimit);
-     int32_t mapIndex = index - u8b->toUCharsMapStart;
-+    U_ASSERT(mapIndex < (int32_t)sizeof(UTF8Buf::mapToUChars));
-     int32_t offset = u8b->mapToUChars[mapIndex] - u8b->bufStartIdx;
-     U_ASSERT(offset>=0 && offset<=ut->chunkLength);
-Index: /trunk/icu4c/source/test/intltest/utxttest.cpp
-===================================================================
---- icu4c/source/test/intltest/utxttest.cpp	(revision 39670)
-+++ icu4c/source/test/intltest/utxttest.cpp	(revision 39671)
-@@ -68,4 +68,6 @@
-         case 7: name = "Ticket12130";
-             if (exec) Ticket12130(); break;
-+        case 8: name = "Ticket12888";
-+            if (exec) Ticket12888(); break;
-         default: name = "";          break;
-     }
-@@ -1584,2 +1586,62 @@
-     utext_close(&ut);
- }
-+
-+// Ticket 12888: bad handling of illegal utf-8 containing many instances of the archaic, now illegal,
-+//               six byte utf-8 forms. Original implementation had an assumption that
-+//               there would be at most three utf-8 bytes per UTF-16 code unit.
-+//               The five and six byte sequences map to a single replacement character.
-+
-+void UTextTest::Ticket12888() {
-+    const char *badString = 
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80"
-+            "\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80\xfd\x80\x80\x80\x80\x80";
-+
-+    UErrorCode status = U_ZERO_ERROR;
-+    LocalUTextPointer ut(utext_openUTF8(NULL, badString, -1, &status));
-+    TEST_SUCCESS(status);
-+    for (;;) {
-+        UChar32 c = utext_next32(ut.getAlias());
-+        if (c == U_SENTINEL) {
-+            break;
-+        }
-+    }
-+    int32_t endIdx = utext_getNativeIndex(ut.getAlias());
-+    if (endIdx != (int32_t)strlen(badString)) {
-+        errln("%s:%d expected=%d, actual=%d", __FILE__, __LINE__, strlen(badString), endIdx);
-+        return;
-+    }
-+
-+    for (int32_t prevIndex = endIdx; prevIndex>0;) {
-+        UChar32 c = utext_previous32(ut.getAlias());
-+        int32_t currentIndex = utext_getNativeIndex(ut.getAlias());
-+        if (c != 0xfffd) {
-+            errln("%s:%d (expected, actual, index) = (%d, %d, %d)\n",
-+                    __FILE__, __LINE__, 0xfffd, c, currentIndex);
-+            break;
-+        }
-+        if (currentIndex != prevIndex - 6) {
-+            errln("%s:%d: wrong index. Expected, actual = %d, %d",
-+                    __FILE__, __LINE__, prevIndex - 6, currentIndex);
-+            break;
-+        }
-+        prevIndex = currentIndex;
-+    }
-+}
-Index: /trunk/icu4c/source/test/intltest/utxttest.h
-===================================================================
---- icu4c/source/test/intltest/utxttest.h	(revision 39670)
-+++ icu4c/source/test/intltest/utxttest.h	(revision 39671)
-@@ -39,4 +39,5 @@
-     void Ticket10983();
-     void Ticket12130();
-+    void Ticket12888();
- 
- private:
diff --git a/package/icu/Config.in b/package/icu/Config.in
index d31c1fa..32f35b9 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# icu does some funky things by generating by itself an ELF
 	# file, and it cannot easily be changed to generate FLAT
@@ -25,7 +26,8 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index d578bfb..d10a061 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,4 +1,4 @@
-# From https://ssl.icu-project.org/files/icu4c/57.1/icu4c-src-58_2.md5
-md5	fac212b32b7ec7ab007a12dff1f3aea1	icu4c-58_2-src.tgz
+# From http://download.icu-project.org/files/icu4c/59.1/icu4c-src-59_1.md5
+md5 54923fa9fab5b2b83f235fb72523de37  icu4c-59_1-src.tgz
 # Calculated based on the hash above
-sha256	2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c	icu4c-58_2-src.tgz
+sha256 7132fdaf9379429d004005217f10e00b7d2319d0fea22bdfddef8991c45b75fe  icu4c-59_1-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a435e47..166890e 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 58.2
+ICU_VERSION = 59.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index 799ab29..dc2b2ae 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
@@ -14,6 +15,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index a3578f1..48ade99 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -2,12 +2,14 @@ config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
 	  http://pyicu.osafoundation.org/
 
-comment "python-pyicu needs a toolchain w/ C++"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index 2c8ddb0..a8b6e45 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
 	# although optional, it is used as default compression
@@ -12,6 +13,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++"
+comment "python-slob needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 5d1ff13..3e6e895 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -259,11 +259,16 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
+comment "icu support needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_STATIC_LIBS # dlopen
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 637996a..cef7532 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -26,8 +27,8 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
