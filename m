From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 25 May 2015 11:08:51 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150519174844.1ef6eb28@free-electrons.com>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
 <1432043386.4108.23.camel@synopsys.com>
 <20150519174844.1ef6eb28@free-electrons.com>
Message-ID: <1432552131.2709.20.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-05-19 at 17:48 +0200, Thomas Petazzoni wrote:
> Alexey,
> 
> On Tue, 19 May 2015 13:49:46 +0000, Alexey Brodkin wrote:
> 
> > > /tmp/ccQkdXjH.s: Assembler messages:
> > > /tmp/ccQkdXjH.s: Error: unaligned opcodes detected in executable segment
> > > make[2]: *** [.obj/release-shared-emb-generic/qxquerytokenizer.o] Error 1
> > > 
> > > Alexey, can you have a look? Thanks!
> > 
> > Well this is sort of expected failure. Even though I have never tried
> > building vanilla Qt for ARC, but as it turned out that doesn't work.
> > 
> > But we've been sitting for a while on Qt4 patches that enable building
> > for and running on ARC. And now decision has been made to finally submit
> > those pretty simple patches upstream and in parallel (until patches are
> > accepted and the next minor release of Qt 4.x is cut.. if ever) add
> > patches in Buildroot so people may happily build and run Qt on ARC.
> > 
> > I'll send patches shortly.
> 
> Great, that would be nice.

Looks like I spoke too soon. The problem reported by autobuilder has
nothing to do with missing patches for ARC in Qt.

That's just a tools problem (I assume on compiler side) that happens on
compilation of the one particular file with following combination of
compiler options "-Os -g". This has been filed as internal bug report
and I expect we'll fix it before the upcoming release.

Still I posted my patches in Qt's Gerrit here:
 [1] https://codereview.qt-project.org/#/c/112667/
 [2] https://codereview.qt-project.org/#/c/112668/

But as correctly mentioned by Peter these days Qt4 could only be updated
with a back-port of Qt5 change (even though that "back-port" may have
nothing in common with change in Qt5 considering differences in
code-bases).

And so I have no other options other than creating patch for Qt5. And I
started to look into it but was a bit surprised that in Buildroot we
still don't have QtWebEngine (which is considered as a better
replacement of QtWebKit). I assume that's not because we don't want
QtWebEngine but just because nobody ever needed it, right?

If so then I'll try to fill this missing entry because I'll need to make
sure web-related apps could be built and run on ARC.

> Well, don't assume too much about my Qt5 knowledge. I've indeed done
> the initial packaging, so I have a limited knowledge of the Qt5 build
> system, but it doesn't go much beyond that. The rest of Qt5 remains
> largely a thing I've never looked at. But I will be happy to look at
> your patches. I think what we will be the most interested in is to make
> sure that the effort to push them upstream is being done, but I know
> you have a good track record of pushing ARC related fixes to the
> relevant upstream projects, so I'm really not worried at all about this.

From the first glance it looks like there's not much to do in Qt5
really. For example I was able to build and run "analogclock" app with
existing Buildroot with zero changes for ARC - which is really
promising. And if we put aside infrastructure things that were required
in Qt4 for Qt5 generic things work very well. The only other change that
was required for Qt4 - it was fix for unaligned access in WebKit's
JavaScript engine.

But now with switch from WebKit to Chromium looks like unaligned access
is no longer a problem (one of the reasons behind switch from WebKit to
Chromiom/Blink was significantly better support of multiple
architectures), i.e. there's no need in ARC-specific quirks.

So hopefully patches for Qt5 will be very short if at all.

-Alexey
