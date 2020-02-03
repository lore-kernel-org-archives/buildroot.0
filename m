From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 14:07:28 +0100
Subject: [Buildroot] [git commit] package/qt5webkit: add patch to fix ICU
 related compile failure
Message-ID: <20200203125754.6BAB588097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2636e2d5f2e2f67984a10256001362d3864a8224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (usage of ICU U16_NEXT() macro without trailing semicolon):

  platform/graphics/SegmentedFontData.cpp:65:9: error: expected ???;??? before ???if???
  dom/Document.cpp:3850:5: error: expected ???;??? before ???if???
  dom/Document.cpp:3855:9: error: expected ???;??? before ???if???
  dom/Document.cpp:3918:9: error: expected ???;??? before ???if???

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-Fix-ICU-related-compile-failures.patch    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/qt5/qt5webkit/5.9.1/0005-Fix-ICU-related-compile-failures.patch b/package/qt5/qt5webkit/5.9.1/0005-Fix-ICU-related-compile-failures.patch
new file mode 100644
index 0000000000..1a99eb7f84
--- /dev/null
+++ b/package/qt5/qt5webkit/5.9.1/0005-Fix-ICU-related-compile-failures.patch
@@ -0,0 +1,67 @@
+From 38e3436db7222ac403a405db7e0fd1d472f1704a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 2 Feb 2020 10:51:00 +0100
+Subject: [PATCH] Fix ICU related compile failures.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The ICU macro U16_NEXT() needs a trailing semicolon.
+
+Fixes:
+
+  platform/graphics/SegmentedFontData.cpp:65:9: error: expected ???;??? before ???if???
+  dom/Document.cpp:3850:5: error: expected ???;??? before ???if???
+  dom/Document.cpp:3855:9: error: expected ???;??? before ???if???
+  dom/Document.cpp:3918:9: error: expected ???;??? before ???if???
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Source/WebCore/dom/Document.cpp                        | 6 +++---
+ Source/WebCore/platform/graphics/SegmentedFontData.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
+index af63b141..26f7312b 100644
+--- a/Source/WebCore/dom/Document.cpp
++++ b/Source/WebCore/dom/Document.cpp
+@@ -3846,12 +3846,12 @@ static bool isValidNameNonASCII(const UChar* characters, unsigned length)
+     unsigned i = 0;
+ 
+     UChar32 c;
+-    U16_NEXT(characters, i, length, c)
++    U16_NEXT(characters, i, length, c);
+     if (!isValidNameStart(c))
+         return false;
+ 
+     while (i < length) {
+-        U16_NEXT(characters, i, length, c)
++        U16_NEXT(characters, i, length, c);
+         if (!isValidNamePart(c))
+             return false;
+     }
+@@ -3914,7 +3914,7 @@ bool Document::parseQualifiedName(const String& qualifiedName, String& prefix, S
+     const UChar* s = qualifiedName.characters();
+     for (unsigned i = 0; i < length;) {
+         UChar32 c;
+-        U16_NEXT(s, i, length, c)
++        U16_NEXT(s, i, length, c);
+         if (c == ':') {
+             if (sawColon) {
+                 ec = NAMESPACE_ERR;
+diff --git a/Source/WebCore/platform/graphics/SegmentedFontData.cpp b/Source/WebCore/platform/graphics/SegmentedFontData.cpp
+index efb20a8c..99b3e86c 100644
+--- a/Source/WebCore/platform/graphics/SegmentedFontData.cpp
++++ b/Source/WebCore/platform/graphics/SegmentedFontData.cpp
+@@ -61,7 +61,7 @@ bool SegmentedFontData::containsCharacters(const UChar* characters, int length)
+ {
+     UChar32 c;
+     for (int i = 0; i < length; ) {
+-        U16_NEXT(characters, i, length, c)
++        U16_NEXT(characters, i, length, c);
+         if (!containsCharacter(c))
+             return false;
+     }
+-- 
+2.25.0
+
