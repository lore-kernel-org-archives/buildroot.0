From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 5 Aug 2016 12:24:54 +0000
Subject: [Buildroot] [PATCH] config: add Synopsys nSIM and nSIM OSCI
	platforms
In-Reply-To: <20160805140115.071073db@free-electrons.com>
References: <1470394586-6091-1-git-send-email-vzakhar@synopsys.com>
 <20160805140115.071073db@free-electrons.com>
Message-ID: <1470399797.3430.75.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-08-05 at 14:01 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,??5 Aug 2016 13:56:26 +0300, Vlad Zakharov wrote:
> > 
> > nSIM and nSIM OSCI are 2 simulation platforms from Synopsys
> > that could emulate both ARCompact and ARCv2 CPUs.
> > 
> > Note for ARCv2 we provide both UP (uni-processor) and SMP
> > (multi-processor) configs.
> > 
> > So-called "standalone" nSIM and it's free flavor Free nSIM
> > have only 1 peripheral - serial port. Still they are
> > (especially free version) very useful for regression testing
> > and debugging of Linux kernel.
> > 
> > nSIM OSCI emulates more functional boards having not only serial port
> > but as well:
> > ?* LCD screen
> > ? * PS/2 keyboard
> > ???* Ethernet controller (which communicates with the host)
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> 
> Thanks for this contribution. It would be useful to add a readme.txt
> file that explains how to start the result of the Buildroot build with
> those simulation platforms, especially the one that is freely available.
> 
> > 
> > ---
> > ?configs/snps_nsim_700_defconfig??????????| 18 ++++++++++++++++++
> > ?configs/snps_nsim_hs38_defconfig?????????| 19 +++++++++++++++++++
> > ?configs/snps_nsim_hs38_smp_defconfig?????| 19 +++++++++++++++++++
> > ?configs/snps_nsimosci_700_defconfig??????| 19 +++++++++++++++++++
> > ?configs/snps_nsimosci_hs38_defconfig?????| 20 ++++++++++++++++++++
> > ?configs/snps_nsimosci_hs38_smp_defconfig | 20 ++++++++++++++++++++
> 
> Do we really need all those combinations? I do understand the 700 vs.
> HS38 difference, but couldn't the rest be handled with just different
> DTBs ? It seems annoying to have both one kernel defconfig for each of
> those, and then one Buildroot configuration for each of those as well.

Unfortunately it's not only different .dtb.
On ARC for SMP we need to modify kernel configuration as well.

I hope some day we'll be able to run the same one kernel binary on any
flavor of ARCv2 CPU (be it UP or SMP) but now we cannot.

We still have way too many differences between UP and SMP.
If you just git grep?CONFIG_SMP in arch/arc you'l see some of those.

In general I agree so many configs in BR look weird and what's worse requires
much more work on maintenance. So we may try to select more useful configs but
for me it's hard to make this decision because from one point of view in case of
ARCv2 we're more interested in SMP configs (that's one of the main differences compared
to older ARCompact CPUs) but in simulation SMP setups work significantly slower
and IMHO UP versions are much more usable if SMP itself is not a requirement.

-Alexey
