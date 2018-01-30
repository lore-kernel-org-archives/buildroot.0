From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:01:47 +0100
Subject: [Buildroot] [PATCH 3/3] package: linuxptp: workaround for
 system crash if PHY is not initialized
In-Reply-To: <1517155221-19399-3-git-send-email-brain@jikos.cz>
References: <1517155221-19399-1-git-send-email-brain@jikos.cz>
 <1517155221-19399-3-git-send-email-brain@jikos.cz>
Message-ID: <20180130230147.46cc03ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jan 2018 17:00:21 +0100, Petr Kulhavy wrote:
> On some systems (tested on i.MX6 with Freescale kernel 4.1) the system freezes
> if phc2sys starts before the PHY is initialized (phc2sys opens /dev/ptp0).
> 
> Unfortunately systemd network.target does not guarantee the PHY to be initialized.
> This workaround pulls in the network-online.target dependency, which postpones
> the phc2sys start after the link is up.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Do we really want to workaround this, which appears to be a kernel
problem?

> +# workaround for crashing Freescale PHY if initialized after /dev/ptp0 is open
> +After=network-online.target
> +Wants=network-online.target

Does it make sense to have After and Wants set to the same value ? Are
both really needed ?

(Again: I don't know much about systemd, so don't hesitate to teach me
even the basics!)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
