From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 23:53:28 +0200
Subject: [Buildroot] [PATCH 0/4] qt5base: fix build issue with mesa3d
 w/out xcb
In-Reply-To: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
References: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
Message-ID: <311da92f-99f6-1f18-cf81-d14b53c5273f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-18 22:34, Ga?l PORTAY wrote:
> Hi all,
> 
> This patch series fixes the build issue with qt5multimedia, qt5webkit
> and qt5wayland when mesa3d is selected as then OpenGL EGL backend but
> the XCB library is not selected.
> 
> The first patch fixes the issue in qt5base by backporting a patch which
> is in review[1]. The patch extends the QMAKE_CXXFLAGS with cflags
> contained in the egl.pc file to pass the flag MESA_EGL_NO_X11_HEADERS to
> the compiler and prevent the build issue.
> 
> The last three patches reverts the workaround setup earlier in
> 2018.02-rc2.
> 
> Fixes:
> 
> 	In file included from
> 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39:0,
> 	                 from qsgvideonode_egl.h:48,
> 	                 from qsgvideonode_egl.cpp:40:
> 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22:
> 	fatal error: X11/Xlib.h: No such file or directory
> 	#include <X11/Xlib.h>
> 	                     ^
> 	compilation terminated.
> 	Makefile:550: recipe for target '.obj/qsgvideonode_egl.o' failed
> 
> Tested with 5.6.3, 5.9.4 and 5.10.1 (with mesa3d without xcb).
> 
> Tests should be extended to others ELG platforms and with mesa3d + xcb.
> 
> [1]: https://codereview.qt-project.org/#/c/198906/

 Unfortunately, upstream gave negative review on this patch, but they failed to
offer better alternatives... For the record, what they say is:

"For other systems like Yocto, such flags should be picked up by the configure
system automatically from pkg-config. It may be worth investigating why that is
not happening. The patch here does not look like something that belongs to egl.prf."

 To me, the fix actually looks good. Well, maybe it should go somewhere else
than in egl.prf, but I really don't see where...

 So, I've applied the series to master.

 I have also added an example defconfig. In addition, it turns out that the same
problem occurs with odroid-mali as a backend, and that we have an autobuilder
failure from this, so I've added that as well in the commit message.

 Thanks!

 Regards,
 Arnout

> 
> Regards,
> Ga?l PORTAY (4):
>   qt5base: fix build issue with mesa3d w/out xcb
>   Revert "qt5wayland: fix build issue with mesa3d w/out xcb"
>   Revert "qt5webkit: fix build issue with mesa3d w/out xcb"
>   Revert "qt5multimedia: fix build issue with mesa3d w/out xcb"
> 
>  ...002-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
>  ...001-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  9 +-----
>  package/qt5/qt5wayland/qt5wayland.mk               |  7 ----
>  package/qt5/qt5webkit/qt5webkit.mk                 |  9 +-----
>  5 files changed, 76 insertions(+), 23 deletions(-)
>  create mode 100644 package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
>  create mode 100644 package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
