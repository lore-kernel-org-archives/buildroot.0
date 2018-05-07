From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 May 2018 10:53:04 +0200
Subject: [Buildroot] Automatic module loading with mdev is broken?
In-Reply-To: <CAFr9PX=ddYhUua7VTCDTBBsPWDzmV-F3xWy2VcxKf_ko7cdQSA@mail.gmail.com>
 (Daniel Palmer's message of "Mon, 7 May 2018 17:30:52 +0900")
References: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
 <87sh74nevl.fsf@dell.be.48ers.dk>
 <CAFr9PX=ddYhUua7VTCDTBBsPWDzmV-F3xWy2VcxKf_ko7cdQSA@mail.gmail.com>
Message-ID: <87lgcvonin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Palmer <daniel@0x0f.com> writes:

 > Hi Peter,
 > Your change works but looking at the text of the original change that
 > caused the regression 'First alias in question is "platform:Fixed MDIO
 > bus".' it seems it would fail with that? The driver that creates that
 > alias still exists ->
 > https://github.com/torvalds/linux/blob/master/drivers/net/phy/fixed_phy.c#L261

Ok. Looking at the error message it was really about the sysfs entry:

sort: /sys/devices/platform/Fixed

So that was presumably '/sys/devices/platform/Fixed MDIO bus'. This is
fixed by the find .. -print0 | xargs -0 sort

There may or may not be situations where the modalias info contains
spaces. I have so far not seen such situation though. fixed_phy does not
provide it:

/sbin/modinfo build/linux-4.14.34/drivers/net/phy/fixed_phy.ko
icense:        GPL
author:         Vitaly Bordug
description:    Fixed MDIO bus (MDIO bus emulation with fixed PHYs)
depends:        libphy
intree:         Y
name:           fixed_phy
vermagic:       4.14.34 SMP

There unfortunately doesn't seem to be an obvious/easy way to handle
modalias entries containing spaces. The easy solution would be to use
xargs -d '\n' but that is not supported by the busybox applet, so I
guess we need to use tr to replace \n with \0 and then xargs -0.

But I would prefer to wait with that until we know it is needed.

-- 
Bye, Peter Korsgaard
