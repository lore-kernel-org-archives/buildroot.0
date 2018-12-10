From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Dec 2018 16:17:38 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_New=3A_Can_not_build_qt5ba?=
 =?utf-8?q?se_5=2E11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A?=
 =?utf-8?b?IGludmFsaWQgY29udmVyc2lvbiBmcm9tIOKAmHZvaWQq4oCZIHRvIOKAmEVH?=
 =?utf-8?q?LNativeDisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermis?=
 =?utf-8?q?sive=5D?=
Message-ID: <bug-11556-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

            Bug ID: 11556
           Summary: Can not build qt5base 5.11.2 with weston 3.0.0 and
                    vivante GPU. error: invalid conversion from ?void*? to
                    ?EGLNativeDisplayType {aka wl_display*}?
                    [-fpermissive]
           Product: buildroot
           Version: 2018.11
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: koller at stettbacher.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7896
  --> https://bugs.busybox.net/attachment.cgi?id=7896&action=edit
Patch to reproduce the problem

There is a 100% reproduceable error with the attached patch. The full error
looks like this:



qeglfsvivwlintegration.cpp: In member function ?virtual void
QEglFSVivWaylandIntegration::platformInit()?:
qeglfsvivwlintegration.cpp:63:50: error: invalid conversion from ?void*? to
?EGLNativeDisplayType {aka wl_display*}? [-fpermissive]
     mNativeDisplay = fbGetDisplay(mWaylandDisplay);
                                                  ^
qeglfsvivwlintegration.cpp: In member function ?virtual wl_egl_window*
QEglFSVivWaylandIntegration::createNativeWindow(QPlatformWindow*, const QSize&,
const QSurfaceFormat&)?:
qeglfsvivwlintegration.cpp:84:101: error: invalid conversion from ?void*? to
?EGLNativeWindowType {aka wl_egl_window*}? [-fpermissive]
     EGLNativeWindowType eglWindow = fbCreateWindow(mNativeDisplay, 0, 0,
size.width(), size.height());
                                                                               
                     ^
qeglfsvivintegration.cpp: In member function ?virtual void
QEglFSVivIntegration::platformInit()?:
qeglfsvivintegration.cpp:68:60: error: invalid conversion from ?void*? to
?EGLNativeDisplayType {aka wl_display*}? [-fpermissive]
     mNativeDisplay = fbGetDisplayByIndex(framebufferIndex());
                                                            ^
qeglfsvivintegration.cpp: In member function ?virtual wl_egl_window*
QEglFSVivIntegration::createNativeWindow(QPlatformWindow*, const QSize&, const
QSurfaceFormat&)?:
qeglfsvivintegration.cpp:91:101: error: invalid conversion from ?void*? to
?EGLNativeWindowType {aka wl_egl_window*}? [-fpermissive]
     EGLNativeWindowType eglWindow = fbCreateWindow(mNativeDisplay, 0, 0,
size.width(), size.height());
                                                                               
                     ^
Makefile:1305: recipe for target '.obj/qeglfsvivwlintegration.o' failed
make[7]: *** [.obj/qeglfsvivwlintegration.o] Error 1
make[7]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5base-5.11.2/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv_wl'
Makefile:123: recipe for target 'sub-eglfs_viv_wl-make_first' failed
make[6]: *** [sub-eglfs_viv_wl-make_first] Error 2
make[6]: *** Waiting for unfinished jobs....
Makefile:1305: recipe for target '.obj/qeglfsvivintegration.o' failed
make[7]: *** [.obj/qeglfsvivintegration.o] Error 1
make[7]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5base-5.11.2/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv'
Makefile:98: recipe for target 'sub-eglfs_viv-make_first' failed
make[6]: *** [sub-eglfs_viv-make_first] Error 2



*** Reproduce the Problem ***
To reproduce the problem, please follow these steps:
- Apply the attached patch to buildroot 2018.11
- make polytab_defconfig
- make

*** Hardware used ***
The used computer on module is a Ka-Ro TX6Q. If you supply a patch for my
problem, I am able to test it instantly, since I have a working hardware next
to me.
https://www.karo-electronics.de/743.html

*** Goal ***
The goal is to have a successful build with a working weston integration with
hardware acceleration.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
