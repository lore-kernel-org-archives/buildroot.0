From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:56:52 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/exiv2: fix
 CVE-2019-20421
Message-ID: <20200314174652.20E5B83A8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4b588cc4862269b35c583d781c1386fec5e1200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

In Jp2Image::readMetadata() in jp2image.cpp in Exiv2 0.27.2, an input
file can result in an infinite loop and hang, with high CPU consumption.
Remote attackers could leverage this vulnerability to cause a denial of
service via a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8be0e4cd4c2c21d601e9d425f9bee1349c4589d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix_1011_jp2_readmetadata_loop.patch      | 86 ++++++++++++++++++++++
 package/exiv2/exiv2.mk                             |  3 +
 2 files changed, 89 insertions(+)

diff --git a/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch b/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch
new file mode 100644
index 0000000000..400bf342ce
--- /dev/null
+++ b/package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch
@@ -0,0 +1,86 @@
+From 1b917c3f7dd86336a9f6fda4456422c419dfe88c Mon Sep 17 00:00:00 2001
+From: clanmills <robin@clanmills.com>
+Date: Tue, 1 Oct 2019 17:39:44 +0100
+Subject: [PATCH] Fix #1011 fix_1011_jp2_readmetadata_loop
+
+[Retrieved (and slighlty updated to keep only the fix) from:
+https://github.com/Exiv2/exiv2/commit/a82098f4f90cd86297131b5663c3dec6a34470e8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/jp2image.cpp                             |  25 +++++++++++++++----
+ test/data/Jp2Image_readMetadata_loop.poc     | Bin 0 -> 738 bytes
+ tests/bugfixes/github/test_CVE_2017_17725.py |   4 +--
+ tests/bugfixes/github/test_issue_1011.py     |  13 ++++++++++
+ 4 files changed, 35 insertions(+), 7 deletions(-)
+ create mode 100755 test/data/Jp2Image_readMetadata_loop.poc
+ create mode 100644 tests/bugfixes/github/test_issue_1011.py
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index d5cd1340a..0de088d62 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -18,10 +18,6 @@
+  * Foundation, Inc., 51 Franklin Street, 5th Floor, Boston, MA 02110-1301 USA.
+  */
+ 
+-/*
+-  File:      jp2image.cpp
+-*/
+-
+ // *****************************************************************************
+ 
+ // included header files
+@@ -197,6 +193,16 @@ namespace Exiv2
+         return result;
+     }
+ 
++static void boxes_check(size_t b,size_t m)
++{
++    if ( b > m ) {
++#ifdef EXIV2_DEBUG_MESSAGES
++        std::cout << "Exiv2::Jp2Image::readMetadata box maximum exceeded" << std::endl;
++#endif
++        throw Error(kerCorruptedMetadata);
++    }
++}
++
+     void Jp2Image::readMetadata()
+     {
+ #ifdef EXIV2_DEBUG_MESSAGES
+@@ -219,9 +225,12 @@ namespace Exiv2
+         Jp2BoxHeader      subBox    = {0,0};
+         Jp2ImageHeaderBox ihdr      = {0,0,0,0,0,0,0,0};
+         Jp2UuidBox        uuid      = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
++        size_t            boxes     = 0 ;
++        size_t            boxem     = 1000 ; // boxes max
+ 
+         while (io_->read((byte*)&box, sizeof(box)) == sizeof(box))
+         {
++            boxes_check(boxes++,boxem );
+             position   = io_->tell();
+             box.length = getLong((byte*)&box.length, bigEndian);
+             box.type   = getLong((byte*)&box.type, bigEndian);
+@@ -251,8 +260,12 @@ namespace Exiv2
+ 
+                     while (io_->read((byte*)&subBox, sizeof(subBox)) == sizeof(subBox) && subBox.length )
+                     {
++                        boxes_check(boxes++, boxem) ;
+                         subBox.length = getLong((byte*)&subBox.length, bigEndian);
+                         subBox.type   = getLong((byte*)&subBox.type, bigEndian);
++                        if (subBox.length > io_->size() ) {
++                            throw Error(kerCorruptedMetadata);
++                        }
+ #ifdef EXIV2_DEBUG_MESSAGES
+                         std::cout << "Exiv2::Jp2Image::readMetadata: "
+                         << "subBox = " << toAscii(subBox.type) << " length = " << subBox.length << std::endl;
+@@ -308,7 +321,9 @@ namespace Exiv2
+                         }
+ 
+                         io_->seek(restore,BasicIo::beg);
+-                        io_->seek(subBox.length, Exiv2::BasicIo::cur);
++                        if ( io_->seek(subBox.length, Exiv2::BasicIo::cur) != 0 ) {
++                            throw Error(kerCorruptedMetadata);
++                        }
+                         restore = io_->tell();
+                     }
+                     break;
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 7ef42fd9bc..ee96a1c2c8 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -13,6 +13,9 @@ EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 # 0001-crwimage-Check-offset-and-size-against-total-size.patch
 EXIV2_IGNORE_CVES += CVE-2019-17402
 
+# 0002-fix_1011_jp2_readmetadata_loop.patch
+EXIV2_IGNORE_CVES += CVE-2019-20421
+
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
