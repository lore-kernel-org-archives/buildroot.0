From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 22:26:00 +0100
Subject: [Buildroot] Qt5 Webkit fails to compile
In-Reply-To: <20200202194245.46e18d8e@gmx.net> (Peter Seiderer's message of
 "Sun, 2 Feb 2020 19:42:45 +0100")
References: <CAPmASevmB9AZ7yOMmR3dBPcc4-4Ra2NOgfGV-J=4TXy=_cxGmw@mail.gmail.com>
 <20200202194245.46e18d8e@gmx.net>
Message-ID: <87o8ugn0k7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Andrea,
 > On Sun, 2 Feb 2020 18:25:14 +0100, Andrea Simeoni <andreasimeoni73@gmail.com> wrote:

 >> Hi! I'm building a slightly modified config for Raspberry Pi 3 (attached
 >> the .config file).
 >> The compilation of qt5webkit fails. This is the error:
 >> 
 >> platform/graphics/SegmentedFontData.cpp:65:9: error: expected ?;? before
 >> ?if?
 >> if (!containsCharacter(c))
 >> ^~
 >> 
 >> the line before is:
 >> 
 >> U16_NEXT(characters, i, length, c)
 >> 
 >> and U16_NEXT is defined in uft16.h as:
 >> 
 >> #define U16_NEXT(s, i, length, c) { \
 >> (c)=(s)[(i)++]; \
 >> if(U16_IS_LEAD(c)) { \
 >> uint16_t __c2; \
 >> if((i)<(length) && U16_IS_TRAIL(__c2=(s)[(i)])) { \
 >> ++(i); \
 >> (c)=U16_GET_SUPPLEMENTARY((c), __c2); \
 >> } \
 >> } \
 >> }
 >> 
 >> Is there something other I need to add in the configuration?

 > Detected the same failure while preparing the the Qt-5.12.7 version bump,
 > fixed by the following qt5webkit patch (proper buildroot patch will
 > follow soon):

 > diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
 > index af63b141..26f7312b 100644
 > --- a/Source/WebCore/dom/Document.cpp
 > +++ b/Source/WebCore/dom/Document.cpp
 > @@ -3846,12 +3846,12 @@ static bool isValidNameNonASCII(const UChar* characters, unsigned length)
 >      unsigned i = 0;
 
 >      UChar32 c;
 > -    U16_NEXT(characters, i, length, c)
 > +    U16_NEXT(characters, i, length, c);
 >      if (!isValidNameStart(c))
 >          return false;
 
 >      while (i < length) {
 > -        U16_NEXT(characters, i, length, c)
 > +        U16_NEXT(characters, i, length, c);

This looks very similar to our recent webkitgtk / wpewebkit patches:

https://git.buildroot.net/buildroot/commit/?id=8f8abbeec33ce8dfc0e3b14d2c352210634ce28c

-- 
Bye, Peter Korsgaard
