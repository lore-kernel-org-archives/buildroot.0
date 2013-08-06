From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Aug 2013 10:59:28 +0200
Subject: [Buildroot] Buildroot and NOMMU
In-Reply-To: <38F83949ED76A946BE17B6F2F98F362E0DA5D1@MX33.campus.intern>
References: <38F83949ED76A946BE17B6F2F98F362E0DA4F3@MX33.campus.intern>
 <38F83949ED76A946BE17B6F2F98F362E0DA5D1@MX33.campus.intern>
Message-ID: <20130806105928.41ed18f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pl?ss Tobias,

Sorry, I had your e-mail in my list of e-mails to reply, but failed to
do so.

On Tue, 6 Aug 2013 08:02:14 +0000, Pl?ss Tobias TA.E.1001 wrote:

> Buildroot offers an option which enables an MMU-less build. However,
> if this option is checked in buildroot, uClibc and BusyBox are still
> built with MMU on. In order to disable the MMU for BusyBox and uClibc
> as well, one has to
> 
> make uclibc-menuconfig, as well as
> make busybox-menuconfig
> 
> and disable the MMU in these individual menuconfigs. However,
> building BusyBox without MMU works without problems, but uClibc
> definitely *wants* an MMU, and I was unable to figure out some
> settings which allow disabling the MMU. It always produces the same
> warning: undefined reference to "fork". Which is very plausible,
> since fork() needs an MMU; the replacement would be vfork() but
> uClibc doesn't know that, and in the standard implementation, it
> looks like vfork() is missing or so. So the quintessence of this is:
> for ARM targets, it is - at least without modifying some code - not
> possible to force an NO MMU build for uClibc.
> 
> But then I wonder what the NOMMU option is for, if uClibc build fails
> when this option is enabled? and why can one build uClibc for targets
> like Blackfin, which do not have an MMU as well? Could somebody
> clarify?

The noMMU support in Buildroot is still a work in progress, and the
problems you pointed definitely exist and are simply due to a lack of
work on getting noMMU better in Buildroot.

Until recently, Blackfin was only working using external toolchains.
Gustavo sent some patches to make the internal toolchain backend work
for Blackfin, but I think it still generates some ELF binaries while
FLAT binaries would be expected. Gustavo also said he would have more
fixes to bring ARM noMMU to a better shape, but he hasn't posted those
patches yet.

So the short answer is that yes, noMMU isn't working properly yet, and
patches are welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
