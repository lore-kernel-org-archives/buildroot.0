From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 23:33:37 +0200
Subject: [Buildroot] [PATCH] package/gst1-libav: disable on avr32
In-Reply-To: <1401917114-18730-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 4 Jun 2014 23:25:14 +0200")
References: <1401917114-18730-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vbsgnyvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > gst1-libav produces particularly large binaries, and the relocations
 > needed for it do not fit in the possible relocation mechanisms
 > available on avr32. Let's just disable it.

 > Fixes:
 >     http://autobuild.buildroot.net/results/15e/15e31d92848b53f001bd6acde71409af3091215c/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Note: I don't do avr32, and don't know much about it.
 > I'm just applying the same resolution as for samba{,4} in the
 > same conditions on avr32 (in #80bff82be).
 > ---
 >  package/gstreamer1/gst1-libav/Config.in | 1 +
 >  package/tvheadend/tvheadend.mk          | 2 +-
 >  2 files changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
 > index 4f9c2b8..2ab786e 100644
 > --- a/package/gstreamer1/gst1-libav/Config.in
 > +++ b/package/gstreamer1/gst1-libav/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_GST1_LIBAV
 >  	bool "gst1-libav"
 > +	depends on !BR2_avr32 # binary too large, relocations don't fit
 >  	select BR2_PACKAGE_GST1_PLUGINS_BASE
 >  	help
 >  	  GStreamer plugin (formerly gst-ffmpeg).
 > diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
 > index f0bb834..7014161 100644
 > --- a/package/tvheadend/tvheadend.mk
 > +++ b/package/tvheadend/tvheadend.mk
 > @@ -35,7 +35,7 @@ define TVHEADEND_CONFIGURE_CMDS
 >  endef
 
 >  define TVHEADEND_BUILD_CMDS
 > -	$(MAKE) -C $(@D)
 > +	$(MAKE) -C $(@D) V=1
 >  endef

Committed without the tvheadend change, thanks.

-- 
Bye, Peter Korsgaard
