From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 04 Dec 2014 22:19:13 +0100
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <5480B48A.8060705@gmail.com>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
 <2598910.830VmRFfsL@aquila> <5480B48A.8060705@gmail.com>
Message-ID: <2300509.9auvbGzPAa@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 04 December 2014 11:22:50 Gary Bisson wrote:
> Jerome, All,
> 
> On 12/04/2014 05:14 AM, J?r?me Pouiller wrote:
> > [snip]
> > 
> >> It seems I can't build Qt5 properly now... I get the following errors;
> >> In file included from ../../../../include/QtCore/qtextstream.h:1:0,
> >> 
> >>                    from ../../../../include/QtCore/QTextStream:1,
> >>                    from qeglfsscreen.h:47,
> >>                    from qeglfswindow.h:46,
> >> 
> >>                    from qeglfsintegration.cpp:44:
> >> ../../../../include/QtCore/../../src/corelib/io/qtextstream.h:54:2:
> >> error: #error qtextstream.h must be included before any header file that
> >> defines Status
> >> 
> >>    #error qtextstream.h must be included before any header file that
> >> 
> >> defines Status
> >> ...
> >> Makefile:1860: recipe for target '.obj/qeglfsscreen.o' failed
> >> make[6]: *** [.obj/qeglfsscreen.o] Error 1
> >> Makefile:117: recipe for target 'sub-eglfs-make_first' failed
> >> make[5]: *** [sub-eglfs-make_first] Error 2
> >> 
> >> Could you send your entire config file? That might be easier to track
> >> down the issue this way.
> > 
> > hmmm... weird, I cannot reproduce it. Did you applied patch named
> > "qt5base:
> > fix Vivante x11/EGL configuration"?
> 
> Yes, here is my git log:
> $ git log --oneline -15
> 89f26bf qmx6_defconfig: update
> 137294b freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
> fc6af14 nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
> 1ccd90a Vivante drivers: bump to version 3.10.17-1.0.1
> 3f47b07 qt5base: fix Vivante x11/EGL configuration
> f15dbd5 qt5base: apply new patch naming policy
> 169008f libdrm: fix support for xserver with Vivante drivers
> c88d616 xdriver_xf86-video-imx-viv: new package
> c04135b gpu-viv-bin-mx6q: change output selection mechanism
> f160a0f gpu-viv-bin-mx6q: make fb/x11 choice explicit
> 75d8516 gpu-viv-bin-mx6q: fix GLESv2 support
> 9f07513 gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
> f3288a5 gpu-viv-bin-mx6q: use self-extractible helper
> 85bc45d mesa3d: Give possibility to external backends to enable DRI/Gallium
> 820bd03 libz160: new package
> 
> > Just in case it would be useful, you will find my .config here:
> >     https://gist.github.com/jerome-pouiller/3c5a0c5c6f3a06cd5f75
> 
> Is it normal that your configuration is using the FB version of the
> vivante libs? In my case I wanted to test everything at once (X11 libs &
> Qt5). Have you tried with the X libs?

It looks like you enabled EGLFS in Qt5. EGLFS need framebuffer version of gpu-
viv-bin-mx6q. If you want to use X11, you have to enable xcb in qt5 (as in 
example in commit log of "07/14 xdriver_xf86-video-imx-viv").

I do not see any simple generic solution to prevent user to choose EGLFS in Qt 
if X11 backend is selected in gpu-viv-bin-mx6q :-(

You will find below configuration I use for X11:
   https://gist.github.com/jerome-pouiller/a35bcd4a65a49d5683d1

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
