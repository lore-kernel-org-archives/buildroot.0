From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 5 Jul 2021 19:25:32 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: fix build with gcc
 11
In-Reply-To: <20210705191957.5b2fbf40@gmx.net>
References: <20210705131553.1517949-1-fido_max@inbox.ru>
 <20210705191957.5b2fbf40@gmx.net>
Message-ID: <20210705192532.7ec719b7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Jul 2021 19:19:57 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Maxim,
>
> thanks for the new patch iteration...., but:
>
> On Mon,  5 Jul 2021 16:15:53 +0300, Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> > Fix the following build failure with gcc 11:
> >
> > text/qbytearraymatcher.h:103:38: error: 'numeric_limits' is not a member of 'std'
> >   103 |         const auto uchar_max = (std::numeric_limits<uchar>::max)();
> >       |                                      ^~~~~~~~~~~~~~
> >
> > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>
> My tested-by should go here...
>
> > ---
>
> A patch revision changelog here would be nice (see '22.5.5. Patch revision changelog' [1])...

e.g.:

Changes v1 -> v2:
  - re-generated 0007-Build-fixes-for-GCC-11.patch with 'git format-patch -N'

>
> >  .../qt5base/0007-Build-fixes-for-GCC-11.patch | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> >
> > diff --git a/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> > new file mode 100644
> > index 0000000000..789983a81e
> > --- /dev/null
> > +++ b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
> > @@ -0,0 +1,62 @@
> > +From e4b1895bc8d02060d41a203f8503402f7a396de5 Mon Sep 17 00:00:00 2001
> > +From: Ville Voutilainen <ville.voutilainen@qt.io>
> > +Date: Mon, 18 Jan 2021 09:58:17 +0200
> > +Subject: [PATCH] Build fixes for GCC 11
> > +
> > +Task-number: QTBUG-89977
> > +Change-Id: Ic1b7ddbffb8a0a00f8c621d09a868f1d94a52c21
> > +Reviewed-by: Lars Knoll <lars.knoll@qt.io>
> > +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> > +[Retrieved (and backported) from:
> > +https://github.com/qt/qtbase/commit/813a928c7c3cf98670b6043149880ed5c955efb9]
> > +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > +Tested-by: Peter Seiderer <ps.report@gmx.net>
>
> Not here...

For patches without new patch iteration the tested-by/reviewed-by etc. tags
a picked up automatically by patchwork, see e.g. [2]/[3]

Regards,
Peter

[2] https://patchwork.ozlabs.org/project/buildroot/patch/20210702080247.211116-1-fido_max at inbox.ru/
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20210702080247.211116-1-fido_max at inbox.ru/mbox/


>
> Regards,
> Peter
>
> [1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
>
> > +---
> > + src/corelib/text/qbytearraymatcher.h     | 2 ++
> > + src/corelib/tools/qsharedpointer_impl.h  | 3 ---
> > + src/plugins/platforms/xcb/qxcbwindow.cpp | 2 +-
> > + 3 files changed, 3 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/corelib/text/qbytearraymatcher.h b/src/corelib/text/qbytearraymatcher.h
> > +index 0eedfc1d20..f5f9bef7b8 100644
> > +--- a/src/corelib/text/qbytearraymatcher.h
> > ++++ b/src/corelib/text/qbytearraymatcher.h
> > +@@ -42,6 +42,8 @@
> > +
> > + #include <QtCore/qbytearray.h>
> > +
> > ++#include <limits>
> > ++
> > + QT_BEGIN_NAMESPACE
> > +
> > +
> > +diff --git a/src/corelib/tools/qsharedpointer_impl.h b/src/corelib/tools/qsharedpointer_impl.h
> > +index 790c187cb9..4aee98af53 100644
> > +--- a/src/corelib/tools/qsharedpointer_impl.h
> > ++++ b/src/corelib/tools/qsharedpointer_impl.h
> > +@@ -155,9 +155,6 @@ namespace QtSharedPointer {
> > + #endif
> > +         inline void checkQObjectShared(...) { }
> > +         inline void setQObjectShared(...) { }
> > +-
> > +-        inline void operator delete(void *ptr) { ::operator delete(ptr); }
> > +-        inline void operator delete(void *, void *) { }
> > +     };
> > +     // sizeof(ExternalRefCountData) = 12 (32-bit) / 16 (64-bit)
> > +
> > +diff --git a/src/plugins/platforms/xcb/qxcbwindow.cpp b/src/plugins/platforms/xcb/qxcbwindow.cpp
> > +index 9e7e1a5572..f0866a90ac 100644
> > +--- a/src/plugins/platforms/xcb/qxcbwindow.cpp
> > ++++ b/src/plugins/platforms/xcb/qxcbwindow.cpp
> > +@@ -698,7 +698,7 @@ void QXcbWindow::show()
> > +         if (isTransient(window())) {
> > +             const QWindow *tp = window()->transientParent();
> > +             if (tp && tp->handle())
> > +-                transientXcbParent = static_cast<const QXcbWindow *>(tp->handle())->winId();
> > ++                transientXcbParent = tp->handle()->winId();
> > +             // Default to client leader if there is no transient parent, else modal dialogs can
> > +             // be hidden by their parents.
> > +             if (!transientXcbParent)
> > +--
> > +2.31.1
> > +
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
