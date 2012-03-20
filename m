From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Tue, 20 Mar 2012 10:50:13 +0100
Subject: [Buildroot] WebKit - Random-crashes ?
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6703136751@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>>>> Noel Vellemans
>>>>>When I do compile Webkit-1.2.7 (that was working before) with 
>>>>> the same set of libraries/uclibc.... (as I use to build 1.6.3
now), I 
>>>>> do get 'RANDOM'-crashes as well.

>>Arnout Vandecappelle
>> This probably means that Webkit isn't the problem, but one of the
many libraries it 
>>depends upon is.
>>
>> Ideally, you should revert everything to the working situation, and
then upgrade the >>libraries one by one to find the one that is causing
the problem.  Looking at the 
>>backtraces, if must be one of gdk, glib, or uClibc.


Finally got 'something' running, that is not crashing all the time.
What Did I do?
A) Reverted back to older-WebKit 1.2.7. : DID NOT HELP (i.o.w
WebKit/GtkLauncher still crashes 'random') 
A) Reverted back to Uclibc 0.9.32.x     : DID NOT HELP. 
B) Reverted back to glib-2.28.8         : DID NOT HELP.
C) reverted to an older version of GTK (2.24.4): DID NOT HELP.
D) Reverted back to libsoup-2.32.2 (had to remove glib-networking
depends): SEEMS to be STABLE!
{I'll RE-test the complete build overnight}

.. 
Compiling WebKit (and his depends) takes some time, even on
fast-build-machine (some hours in my case).
In order to be sure that everything is recompiled/linked correctly, I
always wipe the complete 'output' directory.
Is there a faster way to do this?
{if I do not wipe the output directory I always have leftovers (in /lib,
/usr/lib ..... ) ... from previous compile cycle(s).}



>>Arnout Vandecappelle
>> A segmentation fault in free() generally indicates either a double
free or freeing 
>>unallocated memory (e.g. a stack variable).  valgrind may help to
pinpoint the problem.

I run Gtklauncher in Val grind as suggested, but I get a Lot of
'console'-output from everywhere. 
For example.... "== Invalid write of size 4" and/or "Address 0x97b6e14
is not stack'd, malloc'd or (recently) free'd" 
Don't know exactly, how valuable this output is ( i.o.w. did not look
into the details yet...)



Regards,
Noel



==1311== Invalid write of size 4
==1311==    at 0x73B269C: _pixman_lookup_composite_function
(pixman-utils.c:135)
==1311==    by 0x737054B: pixman_image_composite32 (pixman.c:682)
==1311==    by 0x595C6BB: _composite_glyphs (cairo-image-surface.c:4002)
==1311==    by 0x595E88B: _clip_and_composite
(cairo-image-surface.c:2316)
==1311==    by 0x595EBCF: _cairo_image_surface_glyphs
(cairo-image-surface.c:4062)
==1311==    by 0x597C587: _cairo_surface_show_text_glyphs
(cairo-surface.c:2640)
==1311==    by 0x595928F: _cairo_gstate_show_text_glyphs
(cairo-gstate.c:1981)
==1311==    by 0x59509C3: cairo_show_glyphs (cairo.c:3509)
==1311==    by 0x4EAAF5B:
WebCore::Font::drawGlyphs(WebCore::GraphicsContext*,
WebCore::SimpleFontData const*, WebCore::GlyphBuffer const&, int, int,
WebCore::FloatPoint const&) const (FontCairo.cpp:108)
==1311==    by 0x4C74ED3:
WebCore::Font::drawGlyphBuffer(WebCore::GraphicsContext*,
WebCore::GlyphBuffer const&, WebCore::TextRun const&,
WebCore::FloatPoint const&) const (FontFastPath.cpp:314)
==1311==    by 0x4C7504F:
WebCore::Font::drawSimpleText(WebCore::GraphicsContext*,
WebCore::TextRun const&, WebCore::FloatPoint const&, int, int) const
(FontFastPath.cpp:287)
==1311==    by 0x4C7A1BB:
WebCore::GraphicsContext::drawText(WebCore::Font const&,
WebCore::TextRun const&, WebCore::IntPoint const&, int, int)
(GraphicsContext.cpp:337)
==1311==  Address 0x97b6e14 is not stack'd, malloc'd or (recently)
free'd
==1311==
==1311== Invalid write of size 4
==1311==    at 0x73B26AC: _pixman_lookup_composite_function
(pixman-utils.c:136)
==1311==    by 0x737054B: pixman_image_composite32 (pixman.c:682)
==1311==    by 0x595C6BB: _composite_glyphs (cairo-image-surface.c:4002)
==1311==    by 0x595E88B: _clip_and_composite
(cairo-image-surface.c:2316)
==1311==    by 0x595EBCF: _cairo_image_surface_glyphs
(cairo-image-surface.c:4062)
==1311==    by 0x597C587: _cairo_surface_show_text_glyphs
(cairo-surface.c:2640)
==1311==    by 0x595928F: _cairo_gstate_show_text_glyphs
(cairo-gstate.c:1981)
==1311==    by 0x59509C3: cairo_show_glyphs (cairo.c:3509)
==1311==    by 0x4EAAF5B:
WebCore::Font::drawGlyphs(WebCore::GraphicsContext*,
WebCore::SimpleFontData const*, WebCore::GlyphBuffer const&, int, int,
WebCore::FloatPoint const&) const (FontCairo.cpp:108)
==1311==    by 0x4C74ED3:
WebCore::Font::drawGlyphBuffer(WebCore::GraphicsContext*,
WebCore::GlyphBuffer const&, WebCore::TextRun const&,
WebCore::FloatPoint const&) const (FontFastPath.cpp:314)
==1311==    by 0x4C7504F:
WebCore::Font::drawSimpleText(WebCore::GraphicsContext*,
WebCore::TextRun const&, WebCore::FloatPoint const&, int, int) const
(FontFastPath.cpp:287)
==1311==    by 0x4C7A1BB:
WebCore::GraphicsContext::drawText(WebCore::Font const&,
WebCore::TextRun const&, WebCore::IntPoint const&, int, int)
(GraphicsContext.cpp:337)
==1311==  Address 0x97b6e18 is not stack'd, malloc'd or (recently)
free'd
==1311==
==1311== Invalid write of size 4
==1311==    at 0x73B26BC: _pixman_lookup_composite_function
(pixman-utils.c:137)
==1311==    by 0x737054B: pixman_image_composite32 (pixman.c:682)
==1311==    by 0x595C6BB: _composite_glyphs (cairo-image-surface.c:4002)
