From: amit.chaudhuri at bt.com <amit.chaudhuri@bt.com>
Date: Wed, 16 Jul 2014 08:52:30 +0100
Subject: [Buildroot] Kernel oops on imx53 / ARM - Unhandled fault:
 alignment exception (0x801)
In-Reply-To: <20140715173440.65fa4f2d@free-electrons.com>
References: <8CF2946A95E16D4A92067339B0D48BE59AD1126633@EMV66-UKRD.domain1.systemhost.net>,
 <20140715173440.65fa4f2d@free-electrons.com>
Message-ID: <8CF2946A95E16D4A92067339B0D48BE59AEB5AF502@EMV66-UKRD.domain1.systemhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas - thanks for the suggestion. (Newer kernel version).  Unfortunately, I'm tied to 2.6.35 by something on the graphics side.

Any other options?

Regards,

Amit
________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: 15 July 2014 16:34
To: Chaudhuri,A,Amit,JRM13 R
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Kernel oops on imx53 / ARM - Unhandled fault: alignment exception (0x801)

Hello,

On Tue, 15 Jul 2014 16:12:06 +0100, amit.chaudhuri at bt.com wrote:

> I am using buildroot to create a toolchain for Freescale's imx53qsb board.
> Part of the target we're looking for is Qt5 with support for their eglfs
> platform.
>
> If I only build part of Qt5 and don't satisfy dependencies for eglfs I get
> a bootable system. When I add all of the dependencies I appear to need, I
> get the relevant Qt5 modules compiled & linked but my kernel dies with
> "Unhandled fault: alignment exception (0x801) at 0xdf039e16". I've added the
> console error message and disassembly of the crash site below.
>
> In narrowing down the things that tip me over the edge I've settled on the
> addition of udev and evdev as being likely factors.

Enabling udev/evdev will force the activation of devtmpfs in the
kernel, and therefore the call of the devtmpfs_init() function in the
kernel, which triggers the unaligned access.

> I *think* I need to add -mno-unaligned-access to the compilation flags for
> everything. But I've not worked out how to do that. If alignment is my issue
> how does one add custom compilation flags to all packages?
>
> If I'm mis-diagnosing the problem, I'd be keen to have that pointed out.
> All help much appreciated..

Basically: run a newer kernel.

My understanding is that this issue has been fixed in newer kernel
versions by allowing unaligned accesses on ARMv6 and ARMv7. The kernel
you're using was at a time where ARMv7 toolchains were not generating
unaligned accesses.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
