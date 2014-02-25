From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 23:51:30 +0100
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <1393360566-4849-1-git-send-email-spdawson@gmail.com> (Simon
 Dawson's message of "Tue, 25 Feb 2014 20:36:06 +0000")
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
Message-ID: <87sir6hklp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 > Fix a large number of incorrect configure options for vlc.
 > Configure warnings reported by Arnout Vandecappelle, in his analysis of vlc
 > autobuild failures.

 > ---
 >  package/vlc/vlc.mk | 70 +++++++++++++++++++++++++++---------------------------
 >  1 file changed, 35 insertions(+), 35 deletions(-)

 > diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
 > index 0e76e11..9bcedd1 100644
 > --- a/package/vlc/vlc.mk
 > +++ b/package/vlc/vlc.mk
 > @@ -14,23 +14,23 @@ VLC_AUTORECONF = YES
 
 >  VLC_CONF_OPT += \
 >  	--disable-a52 \
 > -	--disable-shout \
 > -	--disable-twolame \
 > -	--disable-dca \
 > -	--disable-dirac \
 > -	--disable-schroedinger \
 > -	--disable-quicksync \
 > -	--disable-fluidsynth \
 > +	--without-shout \
 > +	--without-twolame \
 > +	--without-dca \
 > +	--without-dirac \
 > +	--without-schroedinger \
 > +	--without-quicksync \
 > +	--without-fluidsynth \

Did you test these?

From a quick look:

./configure --help | egrep 'a52|shout|twolame|dca|dirac|schroedinger|quicksync|fluidsynth'
  --enable-shout          libshout output plugin [default=auto]
  --enable-twolame        MPEG Audio Layer 2 encoder [default=auto]
  --enable-a52            A/52 support with liba52 (default enabled)
  --with-a52=PATH         a52 headers and libraries
  --with-a52-tree=PATH    a52dec tree for static linking
  --enable-dca            DTS Coherent Acoustics support with libdca
  --enable-dirac          dirac encoder [default=auto]
  --enable-schroedinger   dirac decoder and encoder using schroedinger
  --enable-quicksync      Intel QuickSync MPEG4-Part10/MPEG2 (aka H.264/H.262)
  --enable-fluidsynth     MIDI synthetiser with libfluidsynth [default=auto]

So they all seem to be of the --enable / --disable form and not --with / --without.

 >  	--disable-zvbi \
 > -	--disable-kate \
 > -	--disable-caca \
 > +	--without-kate \
 > +	--without-caca \
 >  	--disable-jack \
 > -	--disable-samplerate \
 > -	--disable-chromaprint \
 > -	--disable-goom \
 > +	--without-samplerate \
 > +	--without-chromaprint \
 > +	--without-goom \

Same here:

./configure --help | egrep 'kate|caca|samplerate|chromaprint|goom'
  --enable-kate           kate codec [default=auto]
  --enable-caca           libcaca output [default=auto]
  --enable-samplerate     Resampler with libsamplerate [default=auto]
  --enable-chromaprint    (Chromaprint based audio fingerprinter)
  --enable-goom           goom visualization plugin [default=auto]



 >  	--disable-projectm \
 >  	--disable-vsxu \
 > -	--disable-mtp \
 > +	--without-mtp \
 >  	--without-opencv

And here:

./configure --help | egrep 'mtp'
  --enable-mtp            MTP devices support [default=auto]



 >  # Set powerpc altivec appropriately
 > @@ -49,10 +49,10 @@ endif
 
 >  # bonjour support needs avahi-client, which needs avahi-daemon and dbus
 >  ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
 > -VLC_CONF_OPT += --enable-bonjour
 > +VLC_CONF_OPT += --with-bonjour
 >  VLC_DEPENDENCIES += avahi dbus
 >  else
 > -VLC_CONF_OPT += --disable-bonjour
 > +VLC_CONF_OPT += --without-bonjour

./configure --help | egrep 'bonjour'
  --enable-bonjour        Bonjour services discovery [default=auto]


 >  endif
 
 >  ifeq ($(BR2_PACKAGE_DBUS),y)
 > @@ -96,10 +96,10 @@ VLC_CONF_OPT += --disable-swscale
 >  endif
 
 >  ifeq ($(BR2_PACKAGE_FLAC),y)
 > -VLC_CONF_OPT += --enable-flac
 > +VLC_CONF_OPT += --with-flac
 >  VLC_DEPENDENCIES += flac
 >  else
 > -VLC_CONF_OPT += --disable-flac
 > +VLC_CONF_OPT += --without-flac
 >  endif

./configure --help | egrep 'flac'
  --enable-flac           libflac decoder/encoder support [default=auto]


 >  ifeq ($(BR2_PACKAGE_MESA3D),y)
 > @@ -110,10 +110,10 @@ VLC_CONF_OPT += --disable-glx
 >  endif
 
 >  ifeq ($(BR2_PACKAGE_OPUS),y)
 > -VLC_CONF_OPT += --enable-opus
 > +VLC_CONF_OPT += --with-opus
 >  VLC_DEPENDENCIES += opus
 >  else
 > -VLC_CONF_OPT += --disable-opus
 > +VLC_CONF_OPT += --without-opus
 >  endif

./configure --help | egrep 'opus'
  --enable-opus           Opus support [default=auto]


.. And so on. What's going on here?

-- 
Bye, Peter Korsgaard
