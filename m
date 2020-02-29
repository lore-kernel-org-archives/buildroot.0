From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 22:32:03 +0100
Subject: [Buildroot] [PATCH 2/3] package/exiv2: fix CVE-2019-17402
In-Reply-To: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
References: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229213204.3703303-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Exiv2 0.27.2 allows attackers to trigger a crash in Exiv2::getULong in
types.cpp when called from Exiv2::Internal::CiffDirectory::readDirectory
in crwimage_int.cpp, because there is no validation of the relationship
of the total size to the offset and size.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...k-offset-and-size-against-total-size.patch | 39 +++++++++++++++++++
 package/exiv2/exiv2.mk                        |  3 ++
 2 files changed, 42 insertions(+)
 create mode 100644 package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch

diff --git a/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch b/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
new file mode 100644
index 0000000000..78adb2e9d6
--- /dev/null
+++ b/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
@@ -0,0 +1,39 @@
+From b7890776c62398ca1005e8edc32786859d60fcf7 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sun, 6 Oct 2019 15:05:20 +0200
+Subject: [PATCH] crwimage: Check offset and size against total size
+
+Corrupted or specially crafted CRW images might exceed the overall
+buffersize.
+
+Fixes #1019
+
+(cherry picked from commit 683451567284005cd24e1ccb0a76ca401000968b)
+[Retrieved (and slightly updated to keep only the fix) from:
+https://github.com/Exiv2/exiv2/commit/50e9dd964a439da357798344ed1dd86edcadf0ec]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/crwimage_int.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 29311fdb7..c0d955350 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -268,6 +268,9 @@ namespace Exiv2 {
+ #ifdef EXIV2_DEBUG_MESSAGES
+         std::cout << "Reading directory 0x" << std::hex << tag() << "\n";
+ #endif
++        if (this->offset() + this->size() > size)
++            throw Error(kerOffsetOutOfRange);
++
+         readDirectory(pData + offset(), this->size(), byteOrder);
+ #ifdef EXIV2_DEBUG_MESSAGES
+         std::cout << "<---- 0x" << std::hex << tag() << "\n";
+
+From 0a4fdae360c15c0f6e8d0670f8fa7acfa4526497 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dan=20=C4=8Cerm=C3=A1k?= <dan.cermak@cgc-instruments.com>
+Date: Mon, 7 Oct 2019 23:25:00 +0200
+Subject: [PATCH 2/2] [tests] Add regression test for #1019
+
+(cherry picked from commit 73b874fb14d02578f876aa7dd404cf7c07b6dc4e)
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 09988f49b2..83c880a109 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -15,6 +15,9 @@ EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 # version.
 EXIV2_IGNORE_CVES += CVE-2019-13504
 
+# 0001-crwimage-Check-offset-and-size-against-total-size.patch
+EXIV2_IGNORE_CVES += CVE-2019-17402
+
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
-- 
2.25.0
