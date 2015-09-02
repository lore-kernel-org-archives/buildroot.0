From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Sep 2015 00:00:12 +0200
Subject: [Buildroot] [PATCH] qt5base: Fix compile errors in qurl.h /
 qeglplatformscreen.cpp
In-Reply-To: <1441195419-3616-1-git-send-email-marc.andre@netline.ch>
References: <1441195419-3616-1-git-send-email-marc.andre@netline.ch>
Message-ID: <55E7716C.7010701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marc,

On 02-09-15 14:03, Marc wrote:
> Update the already existing fix for EGL/X11 header issue to fix
> an additional problem encountered on my system where I had
> compile errors in qeglplatformscreen.cpp. The problem was related
> to the wrong order of includes. The X11 headers must always be
> included last, as indicated in
> http://lists.qt-project.org/pipermail/development/2013-March/010511.html
> 
> I decided instead of adding a new patch to update the existing patch,
> because it is an additional fix for the same problem. If you don't agree
> I am happy to submit a seperate patch.
> 
> Signed-off-by: Marc <marc.andre@netline.ch>

 Please use your full (real) name in the Sob. It's a legal statement, where you
assert that you have the right to contribute this patch under the appropriate
license.

> ---
>  package/qt5/qt5base/0003-xcb-egl-fixes.patch | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt5/qt5base/0003-xcb-egl-fixes.patch b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
> index 53f8453..56b4923 100644
> --- a/package/qt5/qt5base/0003-xcb-egl-fixes.patch
> +++ b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
> @@ -1,11 +1,13 @@
> -The vivante headers pull in X11 defines which break eglconvenience
> +Some EGL headers pull in X11 defines which break eglconvenience
>  
>  * Adds a missing include to qeglplatformcontext.cpp
>  * Fix namespace collision on CursorShape, pulled in from X11/X.h
>  * Do not pass MESA_EGL_NO_X11_HEADERS when xcb is use
> +* Reorder includes to have the X11-header the last include
>  
> -[based on patch from Yocto project]
> -Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> +Based on patch from Yocto project and buildroot patch from J?r?me Pouiller <jezz@sysmic.org>
> +Updated to fix issue in qeglplatformscreen (reorder includes, see also
> +http://lists.qt-project.org/pipermail/development/2013-March/010511.html)

 You should also add your Sob here, Also, since most of the original patch is
still maintained, you should not remove J?r?me's Sob.

 Regards,
 Arnout


>  
>  
>  diff -Nuar a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
> @@ -61,4 +63,19 @@ diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/pl
>   #include "qeglplatformscreen_p.h"
>   
>   QT_BEGIN_NAMESPACE
> +--- qtbase-opensource-src-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:46:57.116883353 +0200
> ++++ qtbase-opensource-src-5.5.0/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:47:36.560882333 +0200
> +@@ -31,11 +31,11 @@
> + **
> + ****************************************************************************/
> + 
> +-#include "qeglplatformscreen_p.h"
> +-#include "qeglplatformwindow_p.h"
> + #include <QtGui/qwindow.h>
> + #include <qpa/qwindowsysteminterface.h>
> + #include <QtPlatformSupport/private/qopenglcompositor_p.h>
> ++#include "qeglplatformscreen_p.h"
> ++#include "qeglplatformwindow_p.h"
> + 
> + QT_BEGIN_NAMESPACE
>   
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
