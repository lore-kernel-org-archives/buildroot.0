From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 00:55:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-09
In-Reply-To: <20140610224740.325449ec@free-electrons.com>
References: <20140610063009.EDF82100CE6@stock.ovh.net>
 <20140610224740.325449ec@free-electrons.com>
Message-ID: <20140610225528.GF3561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Maxime, All,

On 2014-06-10 22:47 +0200, Thomas Petazzoni spake thusly:
> >        arm |                  qt5base-5.3.0 | NOK | http://autobuild.buildroot.net/results/3cd168b929bd65a6b9e5d3abbabb6c97ac1d0f08/
> 
> Qt5/RaspberryPi problem:
> 
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDisplay() const':
> qeglfshooks_pi.cpp:(.text+0x38): undefined reference to `vc_dispmanx_display_open'
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDestroy()':
> qeglfshooks_pi.cpp:(.text+0x5c): undefined reference to `vc_dispmanx_display_close'
> 
> Yann, Maxime, you are our RPi experts.

OK, I have the starting of an idea of why it fails.

rpi-userland installs libEGL.so and libGLESv2.so, and their associated
.pc files.

rpi-userland also installs a bunch of helper libraries, of which
libbcm_host.so and its associated .pc file.

However, one of the missing symbol vc_dispmanx_display_open is referenced
in both libEGL.so and libbcm_host.so.

That symbol is provided by libvchostif.so, but neither egl.pc nor
bcm_host.pc declare a dependence on libvchostif, although they both have
it as a DT_NEEDED tag.

So, the .pc files are wrong. But the linker should follow the DT_NEEDED
tags, no?

As a side note, if we fix this, we might be able to fix the other
packages that were dirty-patched to include the proper libs (libcec and
XBMC so far.)

Well, that's all for now. More on that tomorrow.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
