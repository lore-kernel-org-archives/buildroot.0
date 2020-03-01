From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 21:37:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/taglib: fix CVE-2018-11439
In-Reply-To: <20200301203759.218341-1-fontaine.fabrice@gmail.com>
References: <20200301203759.218341-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301203759.218341-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TagLib::Ogg::FLAC::File::scan function in oggflacfile.cpp in TagLib
1.11.1 allows remote attackers to cause information disclosure
(heap-based buffer over-read) via a crafted audio file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-when-loading-invalid-ogg-flac-file.patch | 45 +++++++++++++++++++
 package/taglib/taglib.mk                      |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch

diff --git a/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch b/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
new file mode 100644
index 0000000000..b245659c20
--- /dev/null
+++ b/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
@@ -0,0 +1,45 @@
+From 2c4ae870ec086f2ddd21a47861a3709c36faac45 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Tue, 9 Oct 2018 18:46:55 -0500
+Subject: [PATCH] Fixed OOB read when loading invalid ogg flac file. (#868)
+ (#869)
+
+CVE-2018-11439 is caused by a failure to check the minimum length
+of a ogg flac header. This header is detailed in full at:
+https://xiph.org/flac/ogg_mapping.html. Added more strict checking
+for entire header.
+[Retrieved from:
+https://github.com/taglib/taglib/commit/2c4ae870ec086f2ddd21a47861a3709c36faac45]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ taglib/ogg/flac/oggflacfile.cpp | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/taglib/ogg/flac/oggflacfile.cpp b/taglib/ogg/flac/oggflacfile.cpp
+index 53d04508a..07ea9dccc 100644
+--- a/taglib/ogg/flac/oggflacfile.cpp
++++ b/taglib/ogg/flac/oggflacfile.cpp
+@@ -231,11 +231,21 @@ void Ogg::FLAC::File::scan()
+ 
+   if(!metadataHeader.startsWith("fLaC"))  {
+     // FLAC 1.1.2+
++    // See https://xiph.org/flac/ogg_mapping.html for the header specification.
++    if(metadataHeader.size() < 13)
++      return;
++
++    if(metadataHeader[0] != 0x7f)
++      return;
++
+     if(metadataHeader.mid(1, 4) != "FLAC")
+       return;
+ 
+-    if(metadataHeader[5] != 1)
+-      return; // not version 1
++    if(metadataHeader[5] != 1 && metadataHeader[6] != 0)
++      return; // not version 1.0
++
++    if(metadataHeader.mid(9, 4) != "fLaC")
++      return;
+ 
+     metadataHeader = metadataHeader.mid(13);
+   }
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 35b54348ff..9381e16672 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -13,6 +13,9 @@ TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 # 0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
 TAGLIB_IGNORE_CVES += CVE-2017-12678
 
+# 0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
+TAGLIB_IGNORE_CVES += CVE-2018-11439
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
 endif
-- 
2.25.0
