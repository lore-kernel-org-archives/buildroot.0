From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 22:24:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: replace -02 when
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
In-Reply-To: <3524c102-c20c-f86d-c58a-0932a27f1bb6@benettiengineering.com>
References: <20191227200853.1471986-1-fontaine.fabrice@gmail.com>
 <3524c102-c20c-f86d-c58a-0932a27f1bb6@benettiengineering.com>
Message-ID: <CAPi7W80y1gc4359Sg1SaHQbkWwvvvSdwg25Wz29ewVrsQ2rviQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

Le ven. 27 d?c. 2019 ? 21:22, Giulio Benetti
<giulio.benetti@benettiengineering.com> a ?crit :
>
> Hi Fabrice,
>
> I've already sent a patch for this:
> https://patchwork.ozlabs.org/patch/1200350/
>
> It uses qmake.conf.in instead of hacking gcc-base.conf and most of all
> it allows to have correct optimization flags according to Buildroot.
>
> Since you have seen the problem, can you please review my patch?
I missed your patch, I'll set mine as Not Applicable as I tested yours
and it is better and fixes the build failure. You can add my
Tested-by: (I can't find your patch in my mailbox).
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>
> On 12/27/19 9:08 PM, Fabrice Fontaine wrote:
> > This will fix the following build failure with qt5location:
> >
> > /home/buildroot/autobuild/run/instance-1/output-1/host/bin/microblazeel-linux-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -O0 --sysroot=/home/buildroot/autobuild/run/instance-1/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot -O2 -std=c++1z -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -Wvla -Wdate-time -Wshift-overflow=2 -Wduplicated-cond -Wno-stringop-overflow -D_REENTRANT -fPIC -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_BUILD_POSITIONING_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_CORE_LIB -I. -I../3rdparty/clipper -I../3rdparty/clip2tri -I../../include -I../../include/QtPositioning -I../../include/QtPositioning/5.12.5 -I../../include/QtPositioning/5.12.5/QtPositioning -I/home/buildroot/autob
> >   uild/run/instance-1/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/5.12.5 -I/home/buildroot/autobuild/run/instance-1/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/5.12.5/QtCore -I/home/buildroot/autobuild/run/instance-1/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/qt5 -I/home/buildroot/autobuild/run/instance-1/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore -I.moc -I/home/buildroot/autobuild/run/instance-1/output-1/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qgeoaddress.o qgeoaddress.cpp
> >
> > qgeoaddress.cpp: In function 'QString formattedAddress(const QGeoAddress&, const QString&)':
> > qgeoaddress.cpp:285:1: error: VOIDmode on an output
> >   }
> >   ^
> > (insn 849 12033 850 87 (parallel [
> >              (const_int 0 [0])
> >              (reg:SI 970)
> >              (mem/v:SI (reg/f:SI 3694 [ D.102094.d ]) [-1  S4 A32])
> >              (reg:SI 970)
> >              (reg:SI 3527)
> >              (const_int 0 [0])
> >              (const_int 32773 [0x8005])
> >              (const_int 0 [0])
> >              (clobber (scratch:SI))
> >          ]) "/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/microblazeel-buildroot-linux-uclibc/include/c++/7.4.0/bits/atomic_base.h":304 85 {atomic_compare_and_swapsi}
> >       (nil))
> > qgeoaddress.cpp:285:1: internal compiler error: in do_output_reload, at reload1.c:7978
> >
> > Fixes:
> >   - http://autobuild.buildroot.org/results/a593cfffbf05132e945d7d6efa5888a2646d5486
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >   package/qt5/qt5base/qt5base.mk | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index 1a152be94b..8d4dd49871 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -40,6 +40,11 @@ QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
> >   ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
> >   QT5BASE_CFLAGS += -O0
> >   QT5BASE_CXXFLAGS += -O0
> > +
> > +# This allows to replace -O2 which overrides -O0
> > +define QT5BASE_CONFIGURE_REPLACE_O2
> > +     $(SED) 's,^QMAKE_CFLAGS_OPTIMIZE\s*=.*,QMAKE_CFLAGS_OPTIMIZE = -O0,' $(@D)/mkspecs/common/gcc-base.conf
> > +endef
> >   endif
> >
> >   ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> > @@ -349,6 +354,7 @@ define QT5BASE_CONFIGURE_CMDS
> >       touch $(QT5BASE_ARCH_CONFIG_FILE)
> >       $(QT5BASE_CONFIGURE_ARCH_CONFIG)
> >       $(QT5BASE_CONFIGURE_HOSTCC)
> > +     $(QT5BASE_CONFIGURE_REPLACE_O2)
> >       (cd $(@D); \
> >               $(TARGET_MAKE_ENV) \
> >               PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> >
>
Best Regards,

Fabrice
