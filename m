From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 14:14:51 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <539C13BA.5000106@gmail.com>
References: <539C13BA.5000106@gmail.com>
Message-ID: <20140614141451.6780163c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sat, 14 Jun 2014 11:19:54 +0200, Marco Trapanese wrote:

> libavcodec/arm/ac3dsp_armv6.S: Assembler messages:
> libavcodec/arm/ac3dsp_armv6.S:40: Error: selected processor does not 
> support ARM mode `movw r8,#0x1fe0'
> 
> I was working on a 2014.05-git-00366-gba25b12-dirty version.
> I tried on a newer one (2014.08-git-00302-g712414c) but there is the 
> same error.

I tried building your configuration, and here it fails with a different
issue:

.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::destroyNativeWindow(void*)':
qeglfshooks_pi.cpp:(.text+0x2c): undefined reference to `vc_dispmanx_update_start'
qeglfshooks_pi.cpp:(.text+0x38): undefined reference to `vc_dispmanx_element_remove'
qeglfshooks_pi.cpp:(.text+0x40): undefined reference to `vc_dispmanx_update_submit_sync'
.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDestroy()':
qeglfshooks_pi.cpp:(.text+0x90): undefined reference to `vc_dispmanx_display_close'
.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDisplay() const':
qeglfshooks_pi.cpp:(.text+0xa0): undefined reference to `vc_dispmanx_display_open'
.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::createNativeWindow(QPlatformWindow*, QSize const&, QSurfaceFormat const&)':
qeglfshooks_pi.cpp:(.text+0x10c): undefined reference to `vc_dispmanx_update_start'
qeglfshooks_pi.cpp:(.text+0x15c): undefined reference to `vc_dispmanx_element_add'
qeglfshooks_pi.cpp:(.text+0x168): undefined reference to `vc_dispmanx_update_submit_sync'
collect2: error: ld returned 1 exit status

That's an issue with the RPi OpenGL implementation, I think we have had
a couple of similar failures in the autobuilders. Maxime, Yann, any
suggestion?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
