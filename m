From: daggs <daggs@gmx.com>
Date: Sat, 5 Nov 2016 15:32:16 +0100
Subject: [Buildroot] [PATCH v5] kodi: allow enablement of libamcodec as
 codec if selected
In-Reply-To: <20161105131616.554ec4b0@free-electrons.com>
References: <20161104154727.19939-1-daggs@gmx.com>,
 <20161105131616.554ec4b0@free-electrons.com>
Message-ID: <trinity-ecea44a5-17fb-4e08-8387-56351c423a8c-1478356336355@3capp-mailcom-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Saturday, November 05, 2016 at 2:16 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH v5] kodi: allow enablement of libamcodec as codec if selected
>
> Hello,
> 
> On Fri,  4 Nov 2016 17:47:27 +0200, Dagg Stompler wrote:
> > allow usage of amcodec if kodi is built and libamcodec is selected
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> Thanks for the new iteration. However, I believe there's a
> better/simpler way to achieve this.
> 
> > diff --git a/package/kodi/0012-support_libamcodec_cross_compile.patch b/package/kodi/0012-support_libamcodec_cross_compile.patch
> > new file mode 100644
> > index 0000000..97feb8c
> > --- /dev/null
> > +++ b/package/kodi/0012-support_libamcodec_cross_compile.patch
> > @@ -0,0 +1,24 @@
> > +kodi: fix amcodec includes for cross compilation.
> > +
> > +when building kodi over buildroot with amcodec set, the include paths differs from
> > +native installation. this occurs because the prefix is not set.
> > +so by supplying the LIBAMCODEC_INCLUDE_PATH upon compilation, this issue is resolved.
> > +
> > +Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > +
> > +--- a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in	2016-11-04 11:46:19.000000000 +0200
> > ++++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in	2016-11-04 11:47:13.000000000 +0200
> > +@@ -26,8 +26,11 @@ endif
> > + ifeq (@USE_LIBAMCODEC@,1)
> > + SRCS += AMLCodec.cpp
> > + SRCS += DVDVideoCodecAmlogic.cpp
> > +-INCLUDES += -I$(prefix)/include/amcodec
> > +-INCLUDES += -I$(prefix)/include/amplayer
> > ++ifeq (${LIBAMCODEC_INCLUDE_PATH},)
> > ++LIBAMCODEC_INCLUDE_PATH=$(prefix)
> > ++endif
> > ++INCLUDES += -I${LIBAMCODEC_INCLUDE_PATH}/include/amcodec
> > ++INCLUDES += -I${LIBAMCODEC_INCLUDE_PATH}/include/amplayer
> > + endif
> 
> Just have a patch that deletes those two lines:
> 
> > +-INCLUDES += -I$(prefix)/include/amcodec
> > +-INCLUDES += -I$(prefix)/include/amplayer
> 
> > +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > +KODI_DEPENDENCIES += libamcodec
> > +KODI_CONF_OPTS += --enable-codec=amcodec
> > +KODI_MAKE_OPTS += LIBAMCODEC_INCLUDE_PATH=${STAGING_DIR}/usr
> 
> And, then, something like this (it includes reworking existing RPi
> related code):
> 
> ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> KODI_DEPENDENCIES += rpi-userland
> KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
> KODI_INCLUDES += \
> 	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
> KODI_LIBS += -lvcos -lvchostif
> endif
> 
> ...
> else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> KODI_DEPENDENCIES += libamcodec
> KODI_CONF_OPTS += --enable-codec=amcodec
> KODI_INCLUDES += \
> 	$(STAGING_DIR)/usr/include/amcodec \
> 	$(STAGING_DIR)/usr/include/amplayer
> endif
> 
> KODI_CONF_ENV += \
> 	INCLUDES="$(KODI_INCLUDES)" \
> 	LIBS="$(KODI_LIBS)"
> 
imho, this might be the simpler way but isn't the right way for kodi 16 as there is an existing code for it.
that said, in kodi 17 the code has changed and the submitted patch isn't relevant anymore.
I'll try the kodi 17 fix on the current latest git, if it works I'll submit it to the list.

Dagg.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
