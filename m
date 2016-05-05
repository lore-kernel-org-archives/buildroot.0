From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 08:28:07 +0200
Subject: [Buildroot] [PATCHv2] package/omxplayer: new package
In-Reply-To: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 2 May 2016 12:09:58 +0200")
References: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87lh3pnhmw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > OMXplayer uses openMAX on the RPi to play videos with hardware
 > acceleration.

 > Compared to using a gstreamer pipe, OMXplayer uses a complete
 > "tunnel-mode", in which the video is piped (after demuxing) into the
 > hardware, all the way down to the display, whereas gstreamer composes
 > the video using the eglgles sink, which uses mem-to-mem copies.

 > So, when playing a locally-stored 1080p video, OMXplayer averages 20%
 > (with peaks up to ~30%, depending on the complexity of the video) CPU,
 > while gstreamer bursts up to 40+% when playing 720p and totally chokes
 > on a 1080p video; all on an non-overclocked RPi-1.

 > Note that we have to depend on rpi-userland. rpi-userland is a GLES/EGL
 > provider, so it can't be selected (as all providers of a virtual package
 > can't).


Is this specific to the RPI or could it conceptually work with other OMX
implementations? If it is specific, then perhaps we should call it
rpi-omxplayer instead?

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - change $(shell ...) to `...`  (Thomas)
 >   - don't select rpi-userland
 >   - update to the latest git master; drop parts of our patch
 >   - add hash file
 >   - typoes in patch' commit log
 > ---
 >  package/Config.in                                  |  1 +
 >  .../0001-Makefiles-clean-up-the-cruft.patch        | 67 ++++++++++++++++++++++
 >  package/omxplayer/Config.in                        | 38 ++++++++++++
 >  package/omxplayer/omxplayer.hash                   |  3 +
 >  package/omxplayer/omxplayer.mk                     | 46 +++++++++++++++
 >  5 files changed, 155 insertions(+)
 >  create mode 100644 package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
 >  create mode 100644 package/omxplayer/Config.in
 >  create mode 100644 package/omxplayer/omxplayer.hash
 >  create mode 100644 package/omxplayer/omxplayer.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 9d668bf..b12806d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -33,6 +33,7 @@ menu "Audio and video applications"
 >  	source "package/multicat/Config.in"
 >  	source "package/musepack/Config.in"
 >  	source "package/ncmpc/Config.in"
 > +	source "package/omxplayer/Config.in"
 >  	source "package/on2-8170-libs/Config.in"
 >  	source "package/opus-tools/Config.in"
 >  	source "package/pulseaudio/Config.in"
 > diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
 > new file mode 100644
 > index 0000000..2dc6166
 > --- /dev/null
 > +++ b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
 > @@ -0,0 +1,67 @@
 > +From 563dafc1129848419482b540d149d0b8687cac1e Mon Sep 17 00:00:00 2001
 > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > +Date: Sun, 10 Apr 2016 16:22:53 +0200
 > +Subject: [PATCH] Makefiles: clean up the cruft
 > +
 > +Most of the variables that Makefile.include tries (but fails) to set,
 > +are already available from Buildroot's variables:
 > +  - AR, AS, CC, CXX, OBJDUMP...
 > +  - CFLAGS, CXXFLAGS, CPPFLAGS...
 > +
 > +This leaves us with a few select variables that define include and
 > +library paths local to the omxplayer package, plus a few optimisations.
 > +
 > +Finally, also remove hard-coded, absolute paths pointing to the host
 > +system (won't work for cross-compilation, so our paranoid wrapper would
 > +catch those paths).

Is this likely to get accepted upstream? If not, perhaps just overriding
these variables on the make command line would be easier to maintain?

-- 
Bye, Peter Korsgaard
