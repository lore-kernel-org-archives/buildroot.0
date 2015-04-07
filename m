From: Adrian Weiler <a.weiler@aldea.de>
Date: Tue, 07 Apr 2015 19:16:31 +0200
Subject: [Buildroot] [PATCH 1/1] Support for the Lamobo R1 a.k.a.
 BananaPi-R1 router board
In-Reply-To: <20150406123346.3bfcae3f@free-electrons.com>
References: <1426530919-27935-1-git-send-email-a.weiler@aldea.de>	<1426530919-27935-2-git-send-email-a.weiler@aldea.de>
 <20150406123346.3bfcae3f@free-electrons.com>
Message-ID: <552410EF.6020603@aldea.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

thank you for the review.

At 06.04.2015, 12:33 Thomas Petazzoni wrote:
> [...] Having a patch adding an entire subsystem + drivers is not OK.
I was not aware of this. Are there guidelines somewhere? I know
http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot,
but there is no hint on the scope of contributions.

The main speciality of the BananaPi-R1 board is the Broadcom BCM53125S
ethernet switch which features 5 ports @ 1Gb/s. Unfortunately there is
no driver for it as of Linux 3.19.3. The only implementation for a
driver I could find was an OpenWRT patch and it seems that OpenWRT is
more or less the only publicly available distribution supporting this
board (i probably also works with Android). However there are also some
major driver issues with the WLAN chip on this board, and these issues
are probably easier to track down in a more lightweight environment than
OpenWRT.

My intent was to extract a minimum subset from OpenWRT to get this board
running. Of course I can remove all the customizations which are not
absolutely required for a basic operation of the board (busybox,
dnsmasq, etc...). But without a driver for the ethernet switch, this
does not make much sense. And the driver is useless without the user
land tool to configure it. So does it make sense at all to add support
for this board to buildroot?

> [...] So either find a way of downloading this patch, or make
> Buildroot point to a Git tree where a complete Git tree of the kernel
> can be found,
That depends on where there is any interest of having this platform
supported by buildroot at all.

> [...] If I understand correctly, this utility is only useful in
> combination with the OpenWRT-specific switch configuration subsystem
> that was added by your patch. Since this subsystem is not in the
> mainline kernel, I'm really unsure we want to have the corresponding
> userspace utilities in Buildroot.
I don't think the switch configuration subsystem is OpenWRT-specific.
The configuration subsystem is based on netlink sockets, which is fairly
common, and already supported in buildroot (by the libnl library). Only
the Unified Configuration Interface (UCI) is OpenWRT-specific. I already
removed all UCI dependencies from the switch configuration utility so it
can be used entirely from the command line. But of course this
configuration utility is specific to the B53xxx family of ethernet switches.

Best regards,
Adrian
