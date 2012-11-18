From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Nov 2012 15:12:45 +0200
Subject: [Buildroot] [PATCH v3] libusb: disable on avr32
In-Reply-To: <20121118130836.GE25380@sapphire.tkos.co.il>
References: <1353243578-6980-1-git-send-email-spdawson@gmail.com>
 <20121118130836.GE25380@sapphire.tkos.co.il>
Message-ID: <20121118131245.GF25380@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Sun, Nov 18, 2012 at 03:08:36PM +0200, Baruch Siach wrote:
> On Sun, Nov 18, 2012 at 12:59:38PM +0000, spdawson at gmail.com wrote:
> > From: Simon Dawson <spdawson@gmail.com>
> > 
> > For target architecture avr32, the gpsd package fails to build when
> > libusb is selected. The following autobuild failure illustrates the problem.
> > 
> >   http://autobuild.buildroot.net/results/aa3d4763a0e90c995bc8431cf345730ee22e65a1/build-end.log
> > 
> > The issue is that libusb requires timerfd_settime and timerfd_create, but
> > the underlying syscalls are not implemented on avr32.
> > 
> > This patch disables the libusb package for the avr32 target architecture.
> > 
> > This will also fix autobuild failures such as the following
> > 
> >   http://autobuild.buildroot.net/results/1a17810c2183e389244143dea55b0241c62c0bee/build-end.log
> > 
> > In this case, the pcsc-lite package fails to build on the avr32 architecture,
> > due to the dependency on libusb.
> > 
> > Signed-off-by: Simon Dawson <spdawson@gmail.com>
> > ---
> 
> [...]
> 
> >  	  http://pcsclite.alioth.debian.org/ccid.html
> >  
> >  comment "ccid needs a toolchain with thread support"
> > -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
> 
> Showing this comment when BR2_avr32 is enabled is not very helpful, IMHO,
> especially when the toolchain does have threads support.

Replying to myself: was the intension here to say

    depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_avr32

? Otherwise it doesn't make much sense either. Or am I missing something here?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
