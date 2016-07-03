From: daggs <daggs@gmx.com>
Date: Sun, 3 Jul 2016 07:40:33 +0200
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec
 as codec if selected
In-Reply-To: <f6f8aa1e-e673-4d86-a51a-807987b14209@mind.be>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>
 <37g24dxqbs.ln2@ID-313208.user.individual.net>
 <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
 <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>,
 <f6f8aa1e-e673-4d86-a51a-807987b14209@mind.be>
Message-ID: <trinity-03edb1a5-1beb-41bf-9ff0-5e241acea84c-1467524433514@3capp-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> On 02-07-16 19:58, daggs wrote:
> > Greetings Bernd,
> >>
> >> Greetings,
> >>>
> >>>> +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> >>>> +KODI_DEPENDENCIES += libamcodec
> >>>> +KODI_CONF_OPTS += --enable-codec=amcodec
> >>>
> >>> Hi,
> >>>
> >>> using this defconfig
> >>>
> >>> BR2_arm=y
> >>> BR2_cortex_a15=y
> >>> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> >>> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >>> BR2_PACKAGE_KODI=y
> >>> BR2_PACKAGE_MESA3D=y
> >>> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> >>> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> >>> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> >>> BR2_PACKAGE_XORG7=y
> >>> BR2_PACKAGE_LIBAMCODEC=y
> >>>
> >>> $ grep -i unsafe .config
> >>> BR2_COMPILER_PARANOID_UNSAFE_PATH=y
> >>>
> >>> compiling Kodi fails:
> >>>
> >>> CPP     xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.o
> >>> arm-buildroot-linux-uclibcgnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/amcodec'
> >>>
> >>> due to not compile-safe code used here:
> >>> https://github.com/xbmc/xbmc/blob/Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in#L29
> >>>
> >>> Regards, Bernd
> >>>
> >> will take a look on this, thanks.
> >>
> >> Dagg.
> > 
> > I've looked into this issue, the root of the issue can be found at output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
> > where we see the following:
> > ifeq (@USE_LIBAMCODEC@,1)
> > SRCS += AMLCodec.cpp
> > SRCS += DVDVideoCodecAmlogic.cpp
> > INCLUDES += -I$(prefix)/include/amcodec
> > INCLUDES += -I$(prefix)/include/amplayer
> 
>  That is just wrong, the cpp file does #include <amcodec/codec.h> so there is no
> need for this additional -I...
> 
>  So IMHO the fix is to remove those INCLUDES lines.
> 
>  Regards,
>  Arnout

that was one of the first things I've tried, the problem is that that one of the headers under include/amcodec includes another header from the same folder in this format: #include <abc.h>
I can change it to either #include "abc.h" is this preferable? also this will require a change in libamcodec it self, a change that I'm not sure that can be accepted by the maintainer.
