From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Nov 2014 23:33:35 +0100
Subject: [Buildroot] [PATCH v2 08/30] mplayer: use BR2_ARM_CPU_ARM*
	options
In-Reply-To: <1413923237-2861-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 21 Oct 2014 22:26:55 +0200")
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjc4x8lc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/mplayer/Config.in  | 3 +--
 >  package/mplayer/mplayer.mk | 4 ++--
 >  2 files changed, 3 insertions(+), 4 deletions(-)

 > diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
 > index 8b5d05e..6b97aeb 100644
 > --- a/package/mplayer/Config.in
 > +++ b/package/mplayer/Config.in
 > @@ -4,8 +4,7 @@ config BR2_PACKAGE_MPLAYER
 >  	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 >  			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 >  	# Broken support for <ARMv5
 > -	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
 > -		|| BR2_strongarm)
 > +	depends on !BR2_ARM_CPU_ARMV4
 >  	depends on BR2_LARGEFILE
 >  	help
 >  	  MPlayer is a movie player which runs on many systems and supports
 > diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
 > index 0c216d7..ee023b4 100644
 > --- a/package/mplayer/mplayer.mk
 > +++ b/package/mplayer/mplayer.mk
 > @@ -105,11 +105,11 @@ MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
 >  MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)
 
 >  # ARM optimizations
 > -ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv5te)
 > +ifeq ($(BR2_ARM_CPU_ARMV5),y)
 >  MPLAYER_CONF_OPTS += --enable-armv5te
 >  endif
 
 > -ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv6j)
 > +ifeq ($(BR2_ARM_CPU_ARMV6),y)
 >  MPLAYER_CONF_OPTS += --enable-armv6
 >  endif

Not related to this patch, but we should probably do the same as for
ffmpeg/gst-ffmpeg/gst1-libav and enable the armv6 stuff on armv7a.

-- 
Bye, Peter Korsgaard
