From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 3 Jul 2021 00:12:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build with gcc
 11
In-Reply-To: <20210703000905.680afb9e@gmx.net>
References: <20210702080247.211116-1-fido_max@inbox.ru>
 <c5801345-6ed7-6c12-52e6-9f6c35f44ec1@grinn-global.com>
 <20210703000905.680afb9e@gmx.net>
Message-ID: <20210703001231.79d3cd0a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

one nitpick, see below...

On Sat, 3 Jul 2021 00:09:05 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Bartosz, Maxim,
> 
> On Fri, 2 Jul 2021 10:15:42 +0200, Bartosz Bilas <b.bilas@grinn-global.com> wrote:
> 
> > Hello Maxim,
> > 
> > I was about to send the same patch but it turned out that there are more 
> > files that have missing includes of this header such as 
> > qoffsetstringarray_p.h, see below:
> > 
> > ../../../include/QtCore/5.15.2/QtCore/private/../../../../../src/corelib/tools/qoffsetstringarray_p.h:70:22: 
> > error: ?numeric_limits? is not a member of ?std?
> >  ?? 70 |???????? Last <= std::numeric_limits<quint8>::max(),
> >  ????? |????????????????????? ^~~~~~~~~~~~~~
> > ../../../include/QtCore/5.15.2/QtCore/private/../../../../../src/corelib/tools/qoffsetstringarray_p.h:70:43: 
> > error: wrong number of template arguments (1, should be 3)
> >  ?? 70 |???????? Last <= std::numeric_limits<quint8>::max(),
> > 
> > Maybe it would be better to combine all of these patches that fix build 
> > for gcc11 into one patch and rebase it when something new will occur?  
> 
> Disagree here, prefer one package patch per upstream patch as it is easier to
> keep track of the upstream relation/credits etc.
> 
> This one seems sufficient to fix the qt6base host-gcc-11 compile, so this one
> has a justification on its own right and you can add my
> 
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> 
> @Bartek: You see more compile failures? Host-build/Host-gcc-11 related ones
> or target-build/target-gcc-11 related ones? Feel free to add related
> patches/fixes...
> 
> Regards,
> Peter
> 
> 
> > 
> > Best
> > Bartek
> > On 02.07.2021 10:02, Maxim Kochetkov via buildroot wrote:  
> > > Fix the following build failure with gcc 11:
> > >
> > > text/qbytearraymatcher.h:103:38: error: 'numeric_limits' is not a member of 'std'
> > >    103 |         const auto uchar_max = (std::numeric_limits<uchar>::max)();
> > >        |                                      ^~~~~~~~~~~~~~
> > >
> > > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > > ---
> > >   .../qt5base/0007-Build-fixes-for-GCC-11.patch | 61 +++++++++++++++++++
> > >   1 file changed, 61 insertions(+)
> > >   create mode 100644 package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> > >
> > > diff --git a/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> > > new file mode 100644
> > > index 0000000000..0a7eda478e
> > > --- /dev/null
> > > +++ b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> > > @@ -0,0 +1,61 @@
> > > +From 7f4717b06cacc1a74d5c63dcb41b32e9e2224f4f Mon Sep 17 00:00:00 2001
> > > +From: Ville Voutilainen <ville.voutilainen@qt.io>
> > > +Date: Mon, 18 Jan 2021 09:58:17 +0200
> > > +Subject: [PATCH 1/1] Build fixes for GCC 11

check-package complains:

	ackage/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch:4: generate your patches with 'git format-patch -N'

Patch subject should be '[PATCH] ...'...

Regards,
Peter


> > > +
> > > +Task-number: QTBUG-89977
> > > +Change-Id: Ic1b7ddbffb8a0a00f8c621d09a868f1d94a52c21
> > > +Reviewed-by: Lars Knoll <lars.knoll@qt.io>
> > > +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> > > +[Retrieved (and backported) from:
> > > +https://github.com/qt/qtbase/commit/813a928c7c3cf98670b6043149880ed5c955efb9]
> > > +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > > +---
> > > + src/corelib/text/qbytearraymatcher.h     | 2 ++
> > > + src/corelib/tools/qsharedpointer_impl.h  | 3 ---
> > > + src/plugins/platforms/xcb/qxcbwindow.cpp | 2 +-
> > > + 3 files changed, 3 insertions(+), 4 deletions(-)
> > > +
> > > +diff --git a/src/corelib/text/qbytearraymatcher.h b/src/corelib/text/qbytearraymatcher.h
> > > +index 0eedfc1d20..f5f9bef7b8 100644
> > > +--- a/src/corelib/text/qbytearraymatcher.h
> > > ++++ b/src/corelib/text/qbytearraymatcher.h
> > > +@@ -42,6 +42,8 @@
> > > +
> > > + #include <QtCore/qbytearray.h>
> > > +
> > > ++#include <limits>
> > > ++
> > > + QT_BEGIN_NAMESPACE
> > > +
> > > +
> > > +diff --git a/src/corelib/tools/qsharedpointer_impl.h b/src/corelib/tools/qsharedpointer_impl.h
> > > +index 790c187cb9..4aee98af53 100644
> > > +--- a/src/corelib/tools/qsharedpointer_impl.h
> > > ++++ b/src/corelib/tools/qsharedpointer_impl.h
> > > +@@ -155,9 +155,6 @@ namespace QtSharedPointer {
> > > + #endif
> > > +         inline void checkQObjectShared(...) { }
> > > +         inline void setQObjectShared(...) { }
> > > +-
> > > +-        inline void operator delete(void *ptr) { ::operator delete(ptr); }
> > > +-        inline void operator delete(void *, void *) { }
> > > +     };
> > > +     // sizeof(ExternalRefCountData) = 12 (32-bit) / 16 (64-bit)
> > > +
> > > +diff --git a/src/plugins/platforms/xcb/qxcbwindow.cpp b/src/plugins/platforms/xcb/qxcbwindow.cpp
> > > +index 9e7e1a5572..f0866a90ac 100644
> > > +--- a/src/plugins/platforms/xcb/qxcbwindow.cpp
> > > ++++ b/src/plugins/platforms/xcb/qxcbwindow.cpp
> > > +@@ -698,7 +698,7 @@ void QXcbWindow::show()
> > > +         if (isTransient(window())) {
> > > +             const QWindow *tp = window()->transientParent();
> > > +             if (tp && tp->handle())
> > > +-                transientXcbParent = static_cast<const QXcbWindow *>(tp->handle())->winId();
> > > ++                transientXcbParent = tp->handle()->winId();
> > > +             // Default to client leader if there is no transient parent, else modal dialogs can
> > > +             // be hidden by their parents.
> > > +             if (!transientXcbParent)
> > > +--
> > > +2.31.1
> > > +    
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
