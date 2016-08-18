From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 21:30:49 +0200
Subject: [Buildroot] [PATCH 2/2] tinycbor: fix issue on unnamed union
In-Reply-To: <CAPi7W80+STMRFnA9S9iLUXP2TvaNmdeFeagTjsMjLj0qOxEoqw@mail.gmail.com>
References: <1471290845-115279-1-git-send-email-fabrice.fontaine@orange.com>
 <1471290845-115279-2-git-send-email-fabrice.fontaine@orange.com>
 <87fuq5xnt4.fsf@dell.be.48ers.dk>
 <39A58E7A-0045-4782-AE36-3BB3DF6D42D7@gmail.com>
 <87inv0vjl6.fsf@dell.be.48ers.dk>
 <CAPi7W80+STMRFnA9S9iLUXP2TvaNmdeFeagTjsMjLj0qOxEoqw@mail.gmail.com>
Message-ID: <20160818213049.2120fe59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Aug 2016 22:57:58 +0200, Fabrice Fontaine wrote:
> Dear Peter,
> 
> After more investigation, it seems that the uclibc for the blackfin target
> is configured without __UCLIBC_HAS_GLIBC_CUSTOM_STREAMS__
> (./output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/runtime/usr/include/bits/uClibc_config.h).
> Without this option, fopencookie is not available in the toolchain and so
> the implementation of open_memstream function within tinycbor fails so I
> would suggest to disable tinycbor if BR2_bfin target is set.
> 
> If this solution is acceptable, I can provide a patch.

This solution as-is is not acceptable: we now have support for Blackfin
in the internal toolchain backend, in which case uClibc is built with
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y.

Therefore, what you want to do is:

	# package uses fopencookie(), not available with this toolchain
	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX

Could you resend a new patch series that takes into account this
aspect, and the other comments made by Peter Korsgaard?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
