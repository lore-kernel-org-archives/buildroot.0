From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Jan 2015 23:27:32 +0100
Subject: [Buildroot] [PATCH] linux: fix fbtft kernel extension
In-Reply-To: <20150111194805.02290e5a@free-electrons.com>
References: <1420982335-6015-1-git-send-email-ps.report@gmx.net>,
 <20150111194805.02290e5a@free-electrons.com>
Message-ID: <trinity-ce2b7205-25e9-43cf-b68d-1ce7c190d861-1421015252763@3capp-gmx-bs24>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Sonntag, 11. Januar 2015 um 19:48 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Richard Fergusson" <fergie4000@gmail.com>
> Betreff: Re: [PATCH] linux: fix fbtft kernel extension
>
> Dear Peter Seiderer,
> 
> On Sun, 11 Jan 2015 14:18:55 +0100, Peter Seiderer wrote:
> > Fixes fbtft kernel extension bug reported by Richard Fergusson ([1]):
> > 
> > drivers/video/Kconfig:2525: can't open file
> > "drivers/video/fbdev/fbtft/Kconfig"
> > 
> > Fix: write the right fbtft/KConfig path to video/Kconfig or
> > video/fbdev/Kconfig (instead of hard coded one)
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2015-January/117057.html
> > 
> > Reported-by: Richard Fergusson <fergie4000@gmail.com>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> I only had a quick look, but I don't really see the relationship
> between the bug report and this fix. Could you elaborate a bit?
> 

Without this patch (and raspberrypi_defconfig and BR2_LINUX_KERNEL_EXT_FBTFT=y)
a wrong path is added to drivers/video/Kconfig

$ tail -2 build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/Kconfig 
endmenu
source "drivers/video/fbdev/fbtft/Kconfig"

$ ls build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/fbtft/Kconfig 
build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/fbtft/Kconfig

The patch changes the wrong addition 'source "drivers/video/fbdev/fbtft/Kconfig"' to
the right 'source "drivers/video/fbtft/Kconfig"' in case linux < 3.15...

Hope this explenation is better?

Regards,
Peter

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
