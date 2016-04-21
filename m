From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 13:26:39 +0200
Subject: [Buildroot] [PATCH] uboot build and deploy added to juno board
In-Reply-To: <5718AC9A.4060801@synopsys.com>
References: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
 <20160420220228.59d5e54f@free-electrons.com>
 <5718AC9A.4060801@synopsys.com>
Message-ID: <20160421132639.16cd8714@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 11:34:02 +0100, Joao Pinto wrote:

> > The whole point of Buildroot is to automate the build process, so this
> > should be done by a Buildroot package, rather than manually by the
> > user. So a package for ATF should probably be created.
> > 
> > I also work on an ARM64 platform that uses ATF+U-Boot, so I'll be able
> > to compare and tell you whether what you're proposing is only
> > applicable to Juno, or can be used for other platforms as well.
> 
> It would great to do it 100% automatic. I'll be waiting for your feedback
> regarding your ARM64 platform. If it is the same we could do it together.

Well, the build process is quite similar. I build ATF with:

  make CROSS_COMPILE=aarch64-linux-gnu- BL33=/path/to/uboot USE_COHERENT_MEM=0 PLAT=<platform> DEBUG=1 LOG_LEVEL=20 all fip

I think DEBUG=1 and LOG_LEVEL=20 are not important, but I think the
PLAT= and USE_COHERENT_MEM= variables are important in my case.

So I guess you do do something like:

  make CROSS_COMPILE=$(TARGET_CROSS) \
	BL33=$(call qstrip,$(BR2_BOOT_ATF_PAYLOAD_PATH) \
	$(BR2_BOOT_ATF_ADDITIONAL_VARIABLES) \
	all fip

and that's it. Of course, the location from where you download ATF
should be configurable, because I'm not using the ATF from ARM
directly, but a vendor-specific fork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
