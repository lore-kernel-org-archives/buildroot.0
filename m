From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 2 Oct 2019 21:06:43 +0200
Subject: [Buildroot] [PATCH] package/qt5base: fix building with correct
 optimization
In-Reply-To: <20191002204619.5fc12d9f@gmx.net>
References: <20191001102304.95346-1-giulio.benetti@benettiengineering.com>
 <20191001233246.36aef601@gmx.net> <20191001234838.33cbd903@gmx.net>
 <9706f5b4-d6c2-c7a4-934f-e95213232a5b@benettiengineering.com>
 <20191002204619.5fc12d9f@gmx.net>
Message-ID: <20191002210643.0d6d99cf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Wed, 2 Oct 2019 20:46:19 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Giulio,
>
> On Wed, 2 Oct 2019 17:53:54 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>
> > Hi Peter,
> >
> > On 10/1/19 11:48 PM, Peter Seiderer wrote:
> > > Re-added buildroot at builroot.org and Julien Corjon to CC (hit the wrong button for reply)...
> > >
> > > Regards,
> > > Peter
> > >
> > > On Tue, 1 Oct 2019 23:32:46 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > >> Hello Giulio,
> > >>
> > >> On Tue,  1 Oct 2019 12:23:04 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> > >>
> > >>> On previous patch:
> > >>> https://git.buildroot.net/buildroot/commit/?id=7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6
> > >>> we didn't take care that QMAKE_CXXFLAGS_RELEASE variable is set to
> > >>> QMAKE_CFLAGS_OPTIMIZE(-O2) inside the same file:
> > >>> mkspecs/common/gcc-base.conf
> > >>> So overriding all QMAKE_CFLAGS_OPTIMIZE* variables after gcc.base.conf
> > >>> file doesn't change the content of QMAKE_CXXFLAGS_RELEASE.
> > >>> QMAKE_CXXFLAGS_RELEASE/DEBUG is appended to the end of QMAKE_CXXFLAGS in
> > >>> mkspecs/features/default_post.prf if building with or without debug
> > >>> symbols.
> > >>>
> > >>> Let's override directly QMAKE_CFLAGS_RELEASE/DEBUG and
> > >>> QMAKE_CXXFLAGS_RELEASE/DEBUG in qmake.conf.in and drop all
> > >>> QMAKE_CFLAGS_OPTIMIZE* variables overriding.
> > >>
> > >> What is the difference in the resulting compile flags?
> >
> > Before QMAKE_CFLAGS_OPTIMIZE(-O2) was appended at the end.
>
> I see the following in the logfiles:
>
> 	/home/test/autobuild/run/instance-0/output-1/host/bin/microblazeel-linux-g++ -c -pipe \
> 		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -O0 \
> 		--sysroot=/home/test/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot \
> 		-O2 -std=c++1z ...
>
> - '-Os' is from BR2_OPTIMIZE_S=y?
> - '-O0' is from?

This one is from 'BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y' and package/qt5/qt5base/qt5base.mk:

 40 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
 41 QT5BASE_CFLAGS += -O0
 42 QT5BASE_CXXFLAGS += -O0
 43 endif

> - '-O2' is fixed/removed with your patch?
>
> Do your have an compiler command line example with your patch applied (did not yet
> find enough time to test the patch locally)?
>
> >
> > >>>
> > >>> Fixes:
> > >>> http://autobuild.buildroot.net/results/ada/adaa9b4bcc6f9d2b5e82c479859a07e8abf5cf13/
> > >>> http://autobuild.buildroot.net/results/a83/a83bdd1f3bf309c07abebe871b017c331ed36e67/
> > >>
> > >>    qgeoaddress.cpp: In function 'QString formattedAddress(const QGeoAddress&, const QString&)':
> > >>    qgeoaddress.cpp:285:1: error: VOIDmode on an output
> > >>     }
> > >>   ^
> > >>    (insn 849 12033 850 87 (parallel [
> > >>                (const_int 0 [0])
> > >>                (reg:SI 970)
> > >>                (mem/v:SI (reg/f:SI 3694 [ D.102094.d ]) [-1  S4 A32])
> > >>                (reg:SI 970)
> > >>                (reg:SI 3527)
> > >>                (const_int 0 [0])
> > >>                (const_int 32773 [0x8005])
> > >>                (const_int 0 [0])
> > >>                (clobber (scratch:SI))
> > >>            ]) "/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/microblazeel-buildroot-linux-uclibc/include/c++/7.4.0/bits/atomic_base.h":304 85 {atomic_compare_and_swapsi}
> > >>         (nil))
> > >>    qgeoaddress.cpp:285:1: internal compiler error: in do_output_reload, at reload1.c:7978
> > >>
> > >> And why does it fix in internal compile error?
> >
> > Oops right,
> > it fixes the ICE by *not* overriding -O0 with QMAKE_CFLAGS_OPTIMIZE(-O2)
> > appended.
> >
> > Do I reword the patch?
>
> Suggestion (or something similar):
>
> 	Avoids the internal compiler error by avoiding the '-O2' optimization and applying
> 	the '-Os' buildroot default.

With the above 'BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y' point it is a real fix
of the internal compile error (by respecting the intentional '-Os -O0' -> '-O0')...

Regards,
Peter

>
> Regards,
> Peter
>
> >
> > Best regards
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
