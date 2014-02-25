From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 00:00:47 +0100
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <87sir6hklp.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 25 Feb 2014 23:51:30 +0100")
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
 <87sir6hklp.fsf@dell.be.48ers.dk>
Message-ID: <87ob1uhk68.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:
 >> Fix a large number of incorrect configure options for vlc.
 >> Configure warnings reported by Arnout Vandecappelle, in his analysis of vlc
 >> autobuild failures.

 >> ---
 >> package/vlc/vlc.mk | 70 +++++++++++++++++++++++++++---------------------------
 >> 1 file changed, 35 insertions(+), 35 deletions(-)

 >> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
 >> index 0e76e11..9bcedd1 100644
 >> --- a/package/vlc/vlc.mk
 >> +++ b/package/vlc/vlc.mk
 >> @@ -14,23 +14,23 @@ VLC_AUTORECONF = YES
 
 >> VLC_CONF_OPT += \
 >> --disable-a52 \
 >> -	--disable-shout \
 >> -	--disable-twolame \
 >> -	--disable-dca \
 >> -	--disable-dirac \
 >> -	--disable-schroedinger \
 >> -	--disable-quicksync \
 >> -	--disable-fluidsynth \
 >> +	--without-shout \
 >> +	--without-twolame \
 >> +	--without-dca \
 >> +	--without-dirac \
 >> +	--without-schroedinger \
 >> +	--without-quicksync \
 >> +	--without-fluidsynth \

 > Did you test these?

 > From a quick look:

 > ./configure --help | egrep 'a52|shout|twolame|dca|dirac|schroedinger|quicksync|fluidsynth'
 >   --enable-shout          libshout output plugin [default=auto]
 >   --enable-twolame        MPEG Audio Layer 2 encoder [default=auto]
 >   --enable-a52            A/52 support with liba52 (default enabled)
 >   --with-a52=PATH         a52 headers and libraries
 >   --with-a52-tree=PATH    a52dec tree for static linking
 >   --enable-dca            DTS Coherent Acoustics support with libdca
 >   --enable-dirac          dirac encoder [default=auto]
 >   --enable-schroedinger   dirac decoder and encoder using schroedinger
 >   --enable-quicksync      Intel QuickSync MPEG4-Part10/MPEG2 (aka H.264/H.262)
 >   --enable-fluidsynth     MIDI synthetiser with libfluidsynth [default=auto]

 > So they all seem to be of the --enable / --disable form and not --with / --without.

Ahh, now I get it. Our autoreconf somehow converts all those --enable /
--disable to --with / --without.

Anybody that has any idea why this is so? It quite unfortunate as we
will have to change all of this back once we bump the vlc version and no
longer need VLC_AUTORECONF = YES.

-- 
Bye, Peter Korsgaard
