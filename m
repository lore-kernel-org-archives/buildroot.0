From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 1 Oct 2019 23:48:38 +0200
Subject: [Buildroot] [PATCH] package/qt5base: fix building with correct
 optimization
In-Reply-To: <20191001233246.36aef601@gmx.net>
References: <20191001102304.95346-1-giulio.benetti@benettiengineering.com>
 <20191001233246.36aef601@gmx.net>
Message-ID: <20191001234838.33cbd903@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-added buildroot at builroot.org and Julien Corjon to CC (hit the wrong button for reply)...

Regards,
Peter

On Tue, 1 Oct 2019 23:32:46 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Giulio,
>
> On Tue,  1 Oct 2019 12:23:04 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>
> > On previous patch:
> > https://git.buildroot.net/buildroot/commit/?id=7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6
> > we didn't take care that QMAKE_CXXFLAGS_RELEASE variable is set to
> > QMAKE_CFLAGS_OPTIMIZE(-O2) inside the same file:
> > mkspecs/common/gcc-base.conf
> > So overriding all QMAKE_CFLAGS_OPTIMIZE* variables after gcc.base.conf
> > file doesn't change the content of QMAKE_CXXFLAGS_RELEASE.
> > QMAKE_CXXFLAGS_RELEASE/DEBUG is appended to the end of QMAKE_CXXFLAGS in
> > mkspecs/features/default_post.prf if building with or without debug
> > symbols.
> >
> > Let's override directly QMAKE_CFLAGS_RELEASE/DEBUG and
> > QMAKE_CXXFLAGS_RELEASE/DEBUG in qmake.conf.in and drop all
> > QMAKE_CFLAGS_OPTIMIZE* variables overriding.
>
> What is the difference in the resulting compile flags?
>
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/ada/adaa9b4bcc6f9d2b5e82c479859a07e8abf5cf13/
> > http://autobuild.buildroot.net/results/a83/a83bdd1f3bf309c07abebe871b017c331ed36e67/
>
>   qgeoaddress.cpp: In function 'QString formattedAddress(const QGeoAddress&, const QString&)':
>   qgeoaddress.cpp:285:1: error: VOIDmode on an output
>    }
>  ^
>   (insn 849 12033 850 87 (parallel [
>               (const_int 0 [0])
>               (reg:SI 970)
>               (mem/v:SI (reg/f:SI 3694 [ D.102094.d ]) [-1  S4 A32])
>               (reg:SI 970)
>               (reg:SI 3527)
>               (const_int 0 [0])
>               (const_int 32773 [0x8005])
>               (const_int 0 [0])
>               (clobber (scratch:SI))
>           ]) "/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/microblazeel-buildroot-linux-uclibc/include/c++/7.4.0/bits/atomic_base.h":304 85 {atomic_compare_and_swapsi}
>        (nil))
>   qgeoaddress.cpp:285:1: internal compiler error: in do_output_reload, at reload1.c:7978
>
> And why does it fix in internal compile error?
>
> Regards,
> Peter
>
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/qt5/qt5base/qmake.conf.in | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
> > index 2eb564e172..66b80c302a 100644
> > --- a/package/qt5/qt5base/qmake.conf.in
> > +++ b/package/qt5/qt5base/qmake.conf.in
> > @@ -15,10 +15,10 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
> >  # modifications to gcc-base.conf
> >  QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
> >  QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
> > -QMAKE_CFLAGS_OPTIMIZE       =
> > -QMAKE_CFLAGS_OPTIMIZE_DEBUG =
> > -QMAKE_CFLAGS_OPTIMIZE_FULL  =
> > -QMAKE_CFLAGS_OPTIMIZE_SIZE  =
> > +QMAKE_CFLAGS_DEBUG =
> > +QMAKE_CXXFLAGS_DEBUG =
> > +QMAKE_CFLAGS_RELEASE =
> > +QMAKE_CXXFLAGS_RELEASE =
> >  CONFIG                 += nostrip
> >
> >  QMAKE_LIBS             += -lrt -lpthread -ldl
>
