From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 21:48:48 +0300
Subject: [Buildroot] [PATCH] qt5base: fix build when egl headers need a
	definition
Message-ID: <201309182148.48115.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[This time, sent to the list]

On Wednesday 18 September 2013 19:55:39 you wrote:
> > @@ -0,0 +1,21 @@
> > +--- a/configure
> > ++++ b/configure
> > +@@ -5391,6 +5391,7 @@
> > +         QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
> > +         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
> > +         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
> > ++        QMakeVar set QMAKE_CFLAGS_EGL "$QMAKE_CFLAGS_EGL"
> > +     fi       # detect EGL support
> > +     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL;
> > then +         CFG_EGL=yes
> > +--- a/mkspecs/features/egl.prf
> > ++++ b/mkspecs/features/egl.prf
> > +@@ -14,6 +14,8 @@
> > + } else {
> > +     INCLUDEPATH += $$QMAKE_INCDIR_EGL
> > +     LIBS_PRIVATE += $$QMAKE_LIBS_EGL
> > ++    QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
> > ++    QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_EGL
> 
> Shouldn't we have separate QMAKE_CFLAGS_EGL and QMAKE_CXXFLAGS_EGL ? Or
> are you following a pattern used in other places?

Setting only QMAKE_CFLAGS_EGL did not fix the build. Platform plugins are 
written in C++ and the build system honors CXXFLAGS only. I saw the same 
assignments in other .prf files, too.
