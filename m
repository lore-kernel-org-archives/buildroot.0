From: daggs <daggs@gmx.com>
Date: Sat, 2 Jul 2016 19:58:21 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_4/4_v3=5D_kodi=3A_allow_enablement?=
	=?utf-8?q?_of_libamcodec_as=09codec_if_selected?=
In-Reply-To: <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>,
 <37g24dxqbs.ln2@ID-313208.user.individual.net>,
 <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
Message-ID: <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,
>
> Greetings,
> > 
> > > +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > > +KODI_DEPENDENCIES += libamcodec
> > > +KODI_CONF_OPTS += --enable-codec=amcodec
> > 
> > Hi,
> > 
> > using this defconfig
> > 
> > BR2_arm=y
> > BR2_cortex_a15=y
> > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_PACKAGE_KODI=y
> > BR2_PACKAGE_MESA3D=y
> > BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> > BR2_PACKAGE_MESA3D_OPENGL_ES=y
> > BR2_PACKAGE_XORG7=y
> > BR2_PACKAGE_LIBAMCODEC=y
> > 
> > $ grep -i unsafe .config
> > BR2_COMPILER_PARANOID_UNSAFE_PATH=y
> > 
> > compiling Kodi fails:
> > 
> > CPP     xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.o
> > arm-buildroot-linux-uclibcgnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/amcodec'
> > 
> > due to not compile-safe code used here:
> > https://github.com/xbmc/xbmc/blob/Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in#L29
> > 
> > Regards, Bernd
> > 
> will take a look on this, thanks.
> 
> Dagg.

I've looked into this issue, the root of the issue can be found at output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
where we see the following:
ifeq (@USE_LIBAMCODEC@,1)
SRCS += AMLCodec.cpp
SRCS += DVDVideoCodecAmlogic.cpp
INCLUDES += -I$(prefix)/include/amcodec
INCLUDES += -I$(prefix)/include/amplayer
endif

as prefix is set to /usr (see output/build/kodi-16.1-Jarvis/config.log), I'm not sure fixing prefix is the answer.
in general, replacing the include lines with the follows:
INCLUDES += -I$(shell $(CC) --print-sysroot)/$(prefix)/include/amcodec
INCLUDES += -I$(shell $(CC) --print-sysroot)/$(prefix)/include/amplayer

but I'm not this is the right way to fix this, thoughts?

Dagg.
