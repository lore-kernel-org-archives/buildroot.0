From: Henri Roosen <henriroosen@gmail.com>
Date: Thu, 25 Mar 2021 18:39:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5webkit: fix ICU related
 compile failures from capital bool defines
Message-ID: <20210325173948.31238-1-henri.roosen@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following compile failures:

In file included from platform/text/TextAllInOne.cpp:30:
platform/text/TextBreakIteratorICU.cpp: In function ?bool
WebCore::textInChunkOrOutOfRange(UText*, int64_t, int64_t, UBool,
UBool&)?:
platform/text/TextBreakIteratorICU.cpp:217:28: error: ?TRUE? was not
declared in this scope
  217 |             isAccessible = TRUE;
      |                            ^~~~
platform/text/TextBreakIteratorICU.cpp:222:28: error: ?FALSE? was not
declared in this scope
  222 |             isAccessible = FALSE;
      |                            ^~~~~
platform/text/TextBreakIteratorICU.cpp:231:28: error: ?TRUE? was not
declared in this scope
  231 |             isAccessible = TRUE;
      |                            ^~~~
platform/text/TextBreakIteratorICU.cpp:236:28: error: ?FALSE? was not
declared in this scope
  236 |             isAccessible = FALSE;
      |                            ^~~~~
platform/text/TextBreakIteratorICU.cpp: In function ?UBool
WebCore::textLatin1Access(UText*, int64_t, UBool)?:
platform/text/TextBreakIteratorICU.cpp:246:16: error: ?FALSE? was not
declared in this scope
  246 |         return FALSE;
      |                ^~~~~
platform/text/TextBreakIteratorICU.cpp:266:12: error: ?TRUE? was not
declared in this scope
  266 |     return TRUE;
      |            ^~~~
platform/text/TextBreakIteratorICU.cpp: In function ?UBool
WebCore::textUTF16Access(UText*, int64_t, UBool)?:
platform/text/TextBreakIteratorICU.cpp:367:16: error: ?FALSE? was not
declared in this scope
  367 |         return FALSE;
      |                ^~~~~
platform/text/TextBreakIteratorICU.cpp:387:12: error: ?TRUE? was not
declared in this scope
  387 |     return TRUE;
      |            ^~~~
...
In file included from platform/text/TextAllInOne.cpp:32:
platform/text/TextCodecICU.cpp: In member function ?void
WebCore::TextCodecICU::createICUConverter() const?:
platform/text/TextCodecICU.cpp:272:42: error: ?TRUE? was not declared in
this scope
  272 |         ucnv_setFallback(m_converterICU, TRUE);
      |                                          ^~~~

The compile failures are fixed by replacing the use of FALSE/TRUE with
false/true as suggested by [1] and/or [2].

A better description is directly from the patch/pull-request ([3]):

  Traditionally, ICU4C has defined its own `FALSE`=0 / `TRUE`=1 macros for use with `UBool`.
  Starting with ICU 68 (2020q4), we no longer define these in public header files
  (unless `U_DEFINE_FALSE_AND_TRUE`=1),
  in order to avoid name collisions with code outside ICU defining enum constants and similar
  with these names.

and explains why it occurred just recently/since the icu bump to version
68-1 ([4])...

[1] https://unicode-org.atlassian.net/browse/ICU-21267
[2] https://unicode-org.atlassian.net/browse/ICU-21148
[3] https://github.com/unicode-org/icu/pull/1282/commits/5d77f7084dbfad50c7ccc17bccb85aa24bae8937
[4] https://git.buildroot.net/buildroot/commit/?id=88f2d1c4e52607d2c2a1fa8d934152c47167a168

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---

Changes since v1:
 - added Peter Seiderer's comment and Reviewed-by to the commit message

 ...compile-failures-from-capital-bool-d.patch | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch

diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
new file mode 100644
index 0000000000..04f41afee0
--- /dev/null
+++ b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
@@ -0,0 +1,97 @@
+From 37ee268d9d07a8dad02c1d8db3bf96e0b30df10b Mon Sep 17 00:00:00 2001
+From: Henri Roosen <henri.roosen@ginzinger.com>
+Date: Thu, 18 Mar 2021 11:53:57 +0100
+Subject: [PATCH] Fix ICU related compile failures from capital bool defines
+
+See ICU-21267
+---
+ .../platform/text/TextBreakIteratorICU.cpp       | 16 ++++++++--------
+ Source/WebCore/platform/text/TextCodecICU.cpp    |  2 +-
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
+index b4046ac9..832890a2 100644
+--- a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
++++ b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
+@@ -214,12 +214,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
+             ASSERT(offset < numeric_limits<int32_t>::max());
+             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible = TRUE;
++            isAccessible = true;
+             return true;
+         }
+         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
+             text->chunkOffset = text->chunkLength;
+-            isAccessible = FALSE;
++            isAccessible = false;
+             return true;
+         }
+     } else {
+@@ -228,12 +228,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
+             ASSERT(offset < numeric_limits<int32_t>::max());
+             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible = TRUE;
++            isAccessible = true;
+             return true;
+         }
+         if (nativeIndex <= 0 && !text->chunkNativeStart) {
+             text->chunkOffset = 0;
+-            isAccessible = FALSE;
++            isAccessible = false;
+             return true;
+         }
+     }
+@@ -243,7 +243,7 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
+ static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength = textNativeLength(text);
+     UBool isAccessible;
+     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
+@@ -263,7 +263,7 @@ static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
+         ASSERT(newContext == PriorContext);
+         textLatin1SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+ 
+ static const struct UTextFuncs textLatin1Funcs = {
+@@ -364,7 +364,7 @@ static void textUTF16SwitchToPriorContext(UText* text, int64_t nativeIndex, int6
+ static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength = textNativeLength(text);
+     UBool isAccessible;
+     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
+@@ -384,7 +384,7 @@ static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
+         ASSERT(newContext == PriorContext);
+         textUTF16SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+ 
+ static const struct UTextFuncs textUTF16Funcs = {
+diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
+index 86d4ea17..da152edd 100644
+--- a/Source/WebCore/platform/text/TextCodecICU.cpp
++++ b/Source/WebCore/platform/text/TextCodecICU.cpp
+@@ -269,7 +269,7 @@ void TextCodecICU::createICUConverter() const
+     m_converterICU = ucnv_open(m_canonicalConverterName, &err);
+     ASSERT(U_SUCCESS(err));
+     if (m_converterICU)
+-        ucnv_setFallback(m_converterICU, TRUE);
++        ucnv_setFallback(m_converterICU, true);
+ }
+ 
+ int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& err)
+-- 
+2.20.1
+
-- 
2.20.1
