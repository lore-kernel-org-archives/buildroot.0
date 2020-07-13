From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Mon, 13 Jul 2020 12:00:59 +0200
Subject: [Buildroot] [PATCH] package/exiv2: bump version to 0.27.3
Message-ID: <20200713100058.456954-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version 0.27.3 and remove 0001[1] and 0002[2] local patches that
has been upstreamed.

Release notes:
https://github.com/Exiv2/exiv2/blob/v0.27.3/releasenotes/releasenotes.txt

[1]: https://github.com/Exiv2/exiv2/commit/b7890776c62398ca1005e8edc32786859d60fcf7
[2]: https://github.com/Exiv2/exiv2/commit/1b917c3f7dd86336a9f6fda4456422c419dfe88c

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 ...k-offset-and-size-against-total-size.patch | 32 -------
 .../0002-fix_1011_jp2_readmetadata_loop.patch | 86 -------------------
 package/exiv2/exiv2.hash                      |  3 +-
 package/exiv2/exiv2.mk                        | 15 +---
 4 files changed, 3 insertions(+), 133 deletions(-)
 delete mode 100644 package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
 delete mode 100644 package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch

diff --git a/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch b/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
deleted file mode 100644
index f26006e3a5..0000000000
--- a/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b7890776c62398ca1005e8edc32786859d60fcf7 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sun, 6 Oct 2019 15:05:20 +0200
-Subject: [PATCH] crwimage: Check offset and size against total size
-
-Corrupted or specially crafted CRW images might exceed the overall
-buffersize.
-
-Fixes #1019
-
-(cherry picked from commit 683451567284005cd24e1ccb0a76ca401000968b)
-[Retrieved (and slightly updated to keep only the fix) from:
-https://github.com/Exiv2/exiv2/commit/50e9dd964a439da357798344ed1dd86edcadf0ec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/crwimage_int.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
-index 29311fdb7..c0d955350 100644
---- a/src/crwimage_int.cpp
-+++ b/src/crwimage_int.cpp
-@@ -268,6 +268,9 @@ namespace Exiv2 {
- #ifdef EXIV2_DEBUG_MESSAGES
-         std::cout << "Reading directory 0x" << std::hex << tag() << "\n";
- #endif
-+        if (this->offset() + this->size() > size)
-+            throw Error(kerOffsetOutOfRange);
-+
-         readDirectory(pData + offset(), this->size(), byteOrder);
- #ifdef EXIV2_DEBUG_MESSAGES
-         std::cout << "<---- 0x" << std::hex << tag() << "\n";
diff --git a/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch b/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch
deleted file mode 100644
index 400bf342ce..0000000000
--- a/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 1b917c3f7dd86336a9f6fda4456422c419dfe88c Mon Sep 17 00:00:00 2001
-From: clanmills <robin@clanmills.com>
-Date: Tue, 1 Oct 2019 17:39:44 +0100
-Subject: [PATCH] Fix #1011 fix_1011_jp2_readmetadata_loop
-
-[Retrieved (and slighlty updated to keep only the fix) from:
-https://github.com/Exiv2/exiv2/commit/a82098f4f90cd86297131b5663c3dec6a34470e8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/jp2image.cpp                             |  25 +++++++++++++++----
- test/data/Jp2Image_readMetadata_loop.poc     | Bin 0 -> 738 bytes
- tests/bugfixes/github/test_CVE_2017_17725.py |   4 +--
- tests/bugfixes/github/test_issue_1011.py     |  13 ++++++++++
- 4 files changed, 35 insertions(+), 7 deletions(-)
- create mode 100755 test/data/Jp2Image_readMetadata_loop.poc
- create mode 100644 tests/bugfixes/github/test_issue_1011.py
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index d5cd1340a..0de088d62 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -18,10 +18,6 @@
-  * Foundation, Inc., 51 Franklin Street, 5th Floor, Boston, MA 02110-1301 USA.
-  */
- 
--/*
--  File:      jp2image.cpp
--*/
--
- // *****************************************************************************
- 
- // included header files
-@@ -197,6 +193,16 @@ namespace Exiv2
-         return result;
-     }
- 
-+static void boxes_check(size_t b,size_t m)
-+{
-+    if ( b > m ) {
-+#ifdef EXIV2_DEBUG_MESSAGES
-+        std::cout << "Exiv2::Jp2Image::readMetadata box maximum exceeded" << std::endl;
-+#endif
-+        throw Error(kerCorruptedMetadata);
-+    }
-+}
-+
-     void Jp2Image::readMetadata()
-     {
- #ifdef EXIV2_DEBUG_MESSAGES
-@@ -219,9 +225,12 @@ namespace Exiv2
-         Jp2BoxHeader      subBox    = {0,0};
-         Jp2ImageHeaderBox ihdr      = {0,0,0,0,0,0,0,0};
-         Jp2UuidBox        uuid      = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
-+        size_t            boxes     = 0 ;
-+        size_t            boxem     = 1000 ; // boxes max
- 
-         while (io_->read((byte*)&box, sizeof(box)) == sizeof(box))
-         {
-+            boxes_check(boxes++,boxem );
-             position   = io_->tell();
-             box.length = getLong((byte*)&box.length, bigEndian);
-             box.type   = getLong((byte*)&box.type, bigEndian);
-@@ -251,8 +260,12 @@ namespace Exiv2
- 
-                     while (io_->read((byte*)&subBox, sizeof(subBox)) == sizeof(subBox) && subBox.length )
-                     {
-+                        boxes_check(boxes++, boxem) ;
-                         subBox.length = getLong((byte*)&subBox.length, bigEndian);
-                         subBox.type   = getLong((byte*)&subBox.type, bigEndian);
-+                        if (subBox.length > io_->size() ) {
-+                            throw Error(kerCorruptedMetadata);
-+                        }
- #ifdef EXIV2_DEBUG_MESSAGES
-                         std::cout << "Exiv2::Jp2Image::readMetadata: "
-                         << "subBox = " << toAscii(subBox.type) << " length = " << subBox.length << std::endl;
-@@ -308,7 +321,9 @@ namespace Exiv2
-                         }
- 
-                         io_->seek(restore,BasicIo::beg);
--                        io_->seek(subBox.length, Exiv2::BasicIo::cur);
-+                        if ( io_->seek(subBox.length, Exiv2::BasicIo::cur) != 0 ) {
-+                            throw Error(kerCorruptedMetadata);
-+                        }
-                         restore = io_->tell();
-                     }
-                     break;
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 7937d3f572..94ab4ac638 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256 3dbcaf01fbc5b98d42f091d1ff0d4b6cd9750dc724de3d9c0d113948570b2934 exiv2-0.27.2.tar.gz
+sha256 6398bc743c32b85b2cb2a604273b8c90aa4eb0fd7c1700bf66cbb2712b4f00c1 exiv2-0.27.3.tar.gz
 sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
-sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 5ca16c4747..f423a381b1 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,22 +4,11 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.2
+EXIV2_VERSION = 0.27.3
 EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
-EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
-
-# CVE-2019-13504 is misclassified (by our CVE tracker) as affecting version
-# 0.27.2, while in fact both commits that fixed this issue are already in this
-# version.
-EXIV2_IGNORE_CVES += CVE-2019-13504
-
-# 0001-crwimage-Check-offset-and-size-against-total-size.patch
-EXIV2_IGNORE_CVES += CVE-2019-17402
-
-# 0002-fix_1011_jp2_readmetadata_loop.patch
-EXIV2_IGNORE_CVES += CVE-2019-20421
+EXIV2_LICENSE_FILES = COPYING
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
-- 
2.27.0
