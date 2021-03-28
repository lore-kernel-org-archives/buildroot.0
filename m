From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 23:00:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/qt5webkit: fix ICU related
 compile failures from capital bool defines
In-Reply-To: <20210328101404.GO24043@scaer>
References: <20210325173948.31238-1-henri.roosen@ginzinger.com>
 <20210328101404.GO24043@scaer>
Message-ID: <20210328210026.GT24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henri, All,

On 2021-03-28 12:14 +0200, Yann E. MORIN spake thusly:
> On 2021-03-25 18:39 +0100, Henri Roosen spake thusly:
> > This patch fixes the following compile failures:
> > 
> > In file included from platform/text/TextAllInOne.cpp:30:
> > platform/text/TextBreakIteratorICU.cpp: In function ?bool
> > WebCore::textInChunkOrOutOfRange(UText*, int64_t, int64_t, UBool,
> > UBool&)?:
> > platform/text/TextBreakIteratorICU.cpp:217:28: error: ?TRUE? was not
> > declared in this scope
> >   217 |             isAccessible = TRUE;
> >       |                            ^~~~
[--SNIP--]
> > diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
> > new file mode 100644
> > index 0000000000..04f41afee0
> > --- /dev/null
> > +++ b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
> > @@ -0,0 +1,97 @@
> > +From 37ee268d9d07a8dad02c1d8db3bf96e0b30df10b Mon Sep 17 00:00:00 2001
> > +From: Henri Roosen <henri.roosen@ginzinger.com>
> > +Date: Thu, 18 Mar 2021 11:53:57 +0100
> > +Subject: [PATCH] Fix ICU related compile failures from capital bool defines
> > +
> > +See ICU-21267

When I applied, I missed that this patch should also have your SoB line.
Would you care to send a fixup patch that adds your soB line to this
patch, please?

Regards,
Yann E. MORIN.

> > +---
> > + .../platform/text/TextBreakIteratorICU.cpp       | 16 ++++++++--------
> > + Source/WebCore/platform/text/TextCodecICU.cpp    |  2 +-
> > + 2 files changed, 9 insertions(+), 9 deletions(-)
> > +
> > +diff --git a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
> > +index b4046ac9..832890a2 100644
> > +--- a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
> > ++++ b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
> > +@@ -214,12 +214,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
> > +             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
> > +             ASSERT(offset < numeric_limits<int32_t>::max());
> > +             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
> > +-            isAccessible = TRUE;
> > ++            isAccessible = true;
> > +             return true;
> > +         }
> > +         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
> > +             text->chunkOffset = text->chunkLength;
> > +-            isAccessible = FALSE;
> > ++            isAccessible = false;
> > +             return true;
> > +         }
> > +     } else {
> > +@@ -228,12 +228,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
> > +             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
> > +             ASSERT(offset < numeric_limits<int32_t>::max());
> > +             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
> > +-            isAccessible = TRUE;
> > ++            isAccessible = true;
> > +             return true;
> > +         }
> > +         if (nativeIndex <= 0 && !text->chunkNativeStart) {
> > +             text->chunkOffset = 0;
> > +-            isAccessible = FALSE;
> > ++            isAccessible = false;
> > +             return true;
> > +         }
> > +     }
> > +@@ -243,7 +243,7 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
> > + static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
> > + {
> > +     if (!text->context)
> > +-        return FALSE;
> > ++        return false;
> > +     int64_t nativeLength = textNativeLength(text);
> > +     UBool isAccessible;
> > +     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
> > +@@ -263,7 +263,7 @@ static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
> > +         ASSERT(newContext == PriorContext);
> > +         textLatin1SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
> > +     }
> > +-    return TRUE;
> > ++    return true;
> > + }
> > + 
> > + static const struct UTextFuncs textLatin1Funcs = {
> > +@@ -364,7 +364,7 @@ static void textUTF16SwitchToPriorContext(UText* text, int64_t nativeIndex, int6
> > + static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
> > + {
> > +     if (!text->context)
> > +-        return FALSE;
> > ++        return false;
> > +     int64_t nativeLength = textNativeLength(text);
> > +     UBool isAccessible;
> > +     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
> > +@@ -384,7 +384,7 @@ static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
> > +         ASSERT(newContext == PriorContext);
> > +         textUTF16SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
> > +     }
> > +-    return TRUE;
> > ++    return true;
> > + }
> > + 
> > + static const struct UTextFuncs textUTF16Funcs = {
> > +diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
> > +index 86d4ea17..da152edd 100644
> > +--- a/Source/WebCore/platform/text/TextCodecICU.cpp
> > ++++ b/Source/WebCore/platform/text/TextCodecICU.cpp
> > +@@ -269,7 +269,7 @@ void TextCodecICU::createICUConverter() const
> > +     m_converterICU = ucnv_open(m_canonicalConverterName, &err);
> > +     ASSERT(U_SUCCESS(err));
> > +     if (m_converterICU)
> > +-        ucnv_setFallback(m_converterICU, TRUE);
> > ++        ucnv_setFallback(m_converterICU, true);
> > + }
> > + 
> > + int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& err)
> > +-- 
> > +2.20.1
> > +
> > -- 
> > 2.20.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
