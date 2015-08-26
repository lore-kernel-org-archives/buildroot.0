From: Nimai Mahajan <nimaim@gmail.com>
Date: Wed, 26 Aug 2015 17:33:41 +0000 (UTC)
Subject: [Buildroot] [PATCH] qt5: disable for static-only builds
References: <1440601578-6669-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <loom.20150826T192713-927@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@...> writes:

> 
> Even though we have some specific code to support building Qt5 for
> static-only configurations, it doesn't work. The first problem is that
> our custom qmake.conf always passes -ldl, which makes a number of Qt5
> config.tests fail at configure time. Once this problem is fixed by
> removing -ldl from QMAKE_LIBS and adding it to QMAKE_LIBS_DYNLOAD
> instead, the next problem is that the plugin infrastructure of Qt5
> assumes that Linux has dynamic library support: the qlibrary_unix.cpp
> file includes <dlfcn.h>, and the only condition for this file to not
> be included is:
> 
> Until recently, building Qt5 statically was working because our C
> library was not built static-only: it provided <dlfcn.h> and
> libdl.so. But now that we have a really static only toolchain, Qt5 no
> longer builds.
> 
> The easiest solution is to simply make Qt5 depend on dynamic library
> support.


Highly recommend you disable static building for Qt anyway. There are 
issues with building any plugins statically because of import paths and 
such (see here: https://bugreports.qt.io/browse/QTBUG-35754). This is 
not scheduled to be implemented til 5.6. They also recommend building 
opengl as dynamic so the new framework can detect graphics libs at 
startup (see here: http://doc.qt.io/qt-5/windows-
requirements.html#dynamically-loading-graphics-drivers) so that will 
have to be revisited as well. 

> 
> [snip]
> 
> 
