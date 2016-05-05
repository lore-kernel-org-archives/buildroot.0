From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 May 2016 14:20:13 +0200
Subject: [Buildroot] [PATCHv2] package/omxplayer: new package
In-Reply-To: <87lh3pnhmw.fsf@dell.be.48ers.dk>
References: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr>
 <87lh3pnhmw.fsf@dell.be.48ers.dk>
Message-ID: <20160505122013.GA3894@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-05-05 08:28 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > OMXplayer uses openMAX on the RPi to play videos with hardware
>  > acceleration.
> 
>  > Compared to using a gstreamer pipe, OMXplayer uses a complete
>  > "tunnel-mode", in which the video is piped (after demuxing) into the
>  > hardware, all the way down to the display, whereas gstreamer composes
>  > the video using the eglgles sink, which uses mem-to-mem copies.
> 
>  > So, when playing a locally-stored 1080p video, OMXplayer averages 20%
>  > (with peaks up to ~30%, depending on the complexity of the video) CPU,
>  > while gstreamer bursts up to 40+% when playing 720p and totally chokes
>  > on a 1080p video; all on an non-overclocked RPi-1.
> 
>  > Note that we have to depend on rpi-userland. rpi-userland is a GLES/EGL
>  > provider, so it can't be selected (as all providers of a virtual package
>  > can't).
> 
> 
> Is this specific to the RPI or could it conceptually work with other OMX
> implementations?

*Conceptually*, I guess it could be used on other platforms that have
OpenMAX. However:

  - I have not tested another platform (I lacke HW with OpenMAX)

  - the buildsystem has hard-coded references to libcvhost and other
    libs from rpi-userland

  - there are a (very) few har-coded referecnes to VCHI macros

So, I would not make it generic, and would just keep the dependency on
rpi-userland, at least until someone can prove it builds and runs on
another platform...

> If it is specific, then perhaps we should call it
> rpi-omxplayer instead?

Well, upstream calls it "omxplayer" so I don't think we should rename
it. But I don't care much...

[--SNIP--]
>  > diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
>  > new file mode 100644
>  > index 0000000..2dc6166
>  > --- /dev/null
>  > +++ b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
>  > @@ -0,0 +1,67 @@
>  > +From 563dafc1129848419482b540d149d0b8687cac1e Mon Sep 17 00:00:00 2001
>  > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > +Date: Sun, 10 Apr 2016 16:22:53 +0200
>  > +Subject: [PATCH] Makefiles: clean up the cruft
>  > +
>  > +Most of the variables that Makefile.include tries (but fails) to set,
>  > +are already available from Buildroot's variables:
>  > +  - AR, AS, CC, CXX, OBJDUMP...
>  > +  - CFLAGS, CXXFLAGS, CPPFLAGS...
>  > +
>  > +This leaves us with a few select variables that define include and
>  > +library paths local to the omxplayer package, plus a few optimisations.
>  > +
>  > +Finally, also remove hard-coded, absolute paths pointing to the host
>  > +system (won't work for cross-compilation, so our paranoid wrapper would
>  > +catch those paths).
> 
> Is this likely to get accepted upstream? If not, perhaps just overriding
> these variables on the make command line would be easier to maintain?

Probably not upstreamable, unfortunately... :-(

However, passing variables on the command line risks silently breaking
in the future when we update and the variables change (appear/disapear),
while a patch would fail to apply and we would catch it.

So, I'd prefer we keep the patch. After all, it's not very complex, and
is limited to just removing a bumch of variables assignments, so is
pretty easy to rebase...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
