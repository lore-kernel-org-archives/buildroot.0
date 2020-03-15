From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 10:21:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/taglib: fix
 CVE-2017-12678
Message-ID: <20200315090951.5AD6683F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d9c5965d6c2534bcd5069d5daf5b2c945815651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

In TagLib 1.11.1, the rebuildAggregateFrames function in
id3v2framefactory.cpp has a pointer to cast vulnerability, which allows
remote attackers to cause a denial of service or possibly have
unspecified other impact via a crafted audio file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 85ed0d1c0986bd310190127e706fbdb7fd1ac726)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...is-an-instance-of-TextIdentificationFrame.patch | 33 ++++++++++++++++++++++
 package/taglib/taglib.mk                           |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch b/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
new file mode 100644
index 0000000000..c7ca9500d2
--- /dev/null
+++ b/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
@@ -0,0 +1,33 @@
+From eb9ded1206f18f2c319157337edea2533a40bea6 Mon Sep 17 00:00:00 2001
+From: "Stephen F. Booth" <me@sbooth.org>
+Date: Sun, 23 Jul 2017 10:11:09 -0400
+Subject: [PATCH] Don't assume TDRC is an instance of TextIdentificationFrame
+
+If TDRC is encrypted, FrameFactory::createFrame() returns UnknownFrame
+which causes problems in rebuildAggregateFrames() when it is assumed
+that TDRC is a TextIdentificationFrame
+[Retrieved from:
+https://github.com/taglib/taglib/pull/831/commits/eb9ded1206f18f2c319157337edea2533a40bea6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ taglib/mpeg/id3v2/id3v2framefactory.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/taglib/mpeg/id3v2/id3v2framefactory.cpp b/taglib/mpeg/id3v2/id3v2framefactory.cpp
+index 759a9b7be..9347ab869 100644
+--- a/taglib/mpeg/id3v2/id3v2framefactory.cpp
++++ b/taglib/mpeg/id3v2/id3v2framefactory.cpp
+@@ -334,10 +334,11 @@ void FrameFactory::rebuildAggregateFrames(ID3v2::Tag *tag) const
+      tag->frameList("TDAT").size() == 1)
+   {
+     TextIdentificationFrame *tdrc =
+-      static_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
++      dynamic_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
+     UnknownFrame *tdat = static_cast<UnknownFrame *>(tag->frameList("TDAT").front());
+ 
+-    if(tdrc->fieldList().size() == 1 &&
++    if(tdrc &&
++       tdrc->fieldList().size() == 1 &&
+        tdrc->fieldList().front().size() == 4 &&
+        tdat->data().size() >= 5)
+     {
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 6f36347e61..35b54348ff 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -10,6 +10,9 @@ TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
+# 0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
+TAGLIB_IGNORE_CVES += CVE-2017-12678
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
 endif
