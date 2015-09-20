From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Sun, 20 Sep 2015 13:28:26 +0000
Subject: [Buildroot] [PATCH] arc: add HS38 VDK virtual boards
In-Reply-To: <20150920150505.3743ee98@free-electrons.com>
References: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
 <20150920150505.3743ee98@free-electrons.com>
Message-ID: <1442755705.17404.8.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2015-09-20 at 15:05 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue,  8 Sep 2015 17:54:22 +0300, Alexey Brodkin wrote:
> > Virtualizer Development Kits (VDKs) are software development kits
> > containing design-specific virtual prototypes as well as debug and
> > analysis tools and sample software.
> 
> Are these publicly available? I.e can we run ourselves these
> configurations under the virtualizer?

Unfortunately Virtualizer is a first class Synopsys citizen...
product and it is only available for those who paid for it.

But if you're interested in running anything on ARC in simulation we
do have finally simulator engine for open-source projects
which is available for free after very simple registration and approval
by SNPS employee.

Just follow this URL and fill in short form with your details and
in a day or two you'll get download link:
http://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi

That simulator has only serial port but allows running both
ARCv1 (ARCompact family like ARC750/770) and new gen ARCv2 (ARCH S38).

> I was going to apply this patch, but I'm not sure it's really useful to
> have a SMP and a non-SMP configuration for exactly the same platform.
> We typically don't have multiple configurations for the same platform:
> people can always go ahead and enable/disable whatever they want in the
> kernel configuration.
> 
> What is the motivation for having both? Is the SMP-capable kernel not
> working on the non-SMP emulated hardware?

That's our sad truth.
The thing is true UP (uniprocessor) HW be it simulator or real HW lacks
so-called IDU (interrupt-distribution unit) which is required for SMP.

And so SMP kernel might be only run on SMP HW even if we have only one
core running and the second one is halted.

And vice versa UP kernel won't even start (will panic early) on SMP HW.

That's why we need 2 separate configs for UP and SMP.

-Alexey
