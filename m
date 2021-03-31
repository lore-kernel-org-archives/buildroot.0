From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:02:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/qt5webkit: fix ICU related
 compile failures from capital bool defines
In-Reply-To: <20210325173948.31238-1-henri.roosen@ginzinger.com> (Henri
 Roosen's message of "Thu, 25 Mar 2021 18:39:47 +0100")
References: <20210325173948.31238-1-henri.roosen@ginzinger.com>
Message-ID: <875z17dfok.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Henri" == Henri Roosen <henriroosen@gmail.com> writes:

 > This patch fixes the following compile failures:
 > In file included from platform/text/TextAllInOne.cpp:30:
 > platform/text/TextBreakIteratorICU.cpp: In function ?bool
 > WebCore::textInChunkOrOutOfRange(UText*, int64_t, int64_t, UBool,
 > UBool&)?:
 > platform/text/TextBreakIteratorICU.cpp:217:28: error: ?TRUE? was not
 > declared in this scope
 >   217 |             isAccessible = TRUE;
 >       |                            ^~~~
 > platform/text/TextBreakIteratorICU.cpp:222:28: error: ?FALSE? was not
 > declared in this scope
 >   222 |             isAccessible = FALSE;
 >       |                            ^~~~~
 > platform/text/TextBreakIteratorICU.cpp:231:28: error: ?TRUE? was not
 > declared in this scope
 >   231 |             isAccessible = TRUE;
 >       |                            ^~~~
 > platform/text/TextBreakIteratorICU.cpp:236:28: error: ?FALSE? was not
 > declared in this scope
 >   236 |             isAccessible = FALSE;
 >       |                            ^~~~~
 > platform/text/TextBreakIteratorICU.cpp: In function ?UBool
 > WebCore::textLatin1Access(UText*, int64_t, UBool)?:
 > platform/text/TextBreakIteratorICU.cpp:246:16: error: ?FALSE? was not
 > declared in this scope
 >   246 |         return FALSE;
 >       |                ^~~~~
 > platform/text/TextBreakIteratorICU.cpp:266:12: error: ?TRUE? was not
 > declared in this scope
 >   266 |     return TRUE;
 >       |            ^~~~
 > platform/text/TextBreakIteratorICU.cpp: In function ?UBool
 > WebCore::textUTF16Access(UText*, int64_t, UBool)?:
 > platform/text/TextBreakIteratorICU.cpp:367:16: error: ?FALSE? was not
 > declared in this scope
 >   367 |         return FALSE;
 >       |                ^~~~~
 > platform/text/TextBreakIteratorICU.cpp:387:12: error: ?TRUE? was not
 > declared in this scope
 >   387 |     return TRUE;
 >       |            ^~~~
 > ...
 > In file included from platform/text/TextAllInOne.cpp:32:
 > platform/text/TextCodecICU.cpp: In member function ?void
 > WebCore::TextCodecICU::createICUConverter() const?:
 > platform/text/TextCodecICU.cpp:272:42: error: ?TRUE? was not declared in
 > this scope
 >   272 |         ucnv_setFallback(m_converterICU, TRUE);
 >       |                                          ^~~~

 > The compile failures are fixed by replacing the use of FALSE/TRUE with
 > false/true as suggested by [1] and/or [2].

 > A better description is directly from the patch/pull-request ([3]):

 >   Traditionally, ICU4C has defined its own `FALSE`=0 / `TRUE`=1 macros for use with `UBool`.
 >   Starting with ICU 68 (2020q4), we no longer define these in public header files
 >   (unless `U_DEFINE_FALSE_AND_TRUE`=1),
 >   in order to avoid name collisions with code outside ICU defining enum constants and similar
 >   with these names.

 > and explains why it occurred just recently/since the icu bump to version
 > 68-1 ([4])...

 > [1] https://unicode-org.atlassian.net/browse/ICU-21267
 > [2] https://unicode-org.atlassian.net/browse/ICU-21148
 > [3] https://github.com/unicode-org/icu/pull/1282/commits/5d77f7084dbfad50c7ccc17bccb85aa24bae8937
 > [4] https://git.buildroot.net/buildroot/commit/?id=88f2d1c4e52607d2c2a1fa8d934152c47167a168

 > Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
 > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
 > ---

 > Changes since v1:
 >  - added Peter Seiderer's comment and Reviewed-by to the commit message

 >  ...compile-failures-from-capital-bool-d.patch | 97 +++++++++++++++++++
 >  1 file changed, 97 insertions(+)
 >  create mode 100644 package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
