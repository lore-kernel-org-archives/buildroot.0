From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 07:25:24 +0100
Subject: [Buildroot] [PATCH] openpgm: Blacklist Blackfin ADI 2014R1
 toolchain
In-Reply-To: <5502098A.6030909@openwide.fr>
References: <1425754315-524-1-git-send-email-romain.naour@openwide.fr>
 <20150308085356.11aae236@free-electrons.com>
 <54FC7C44.1040707@openwide.fr>
 <20150308183023.06960971@free-electrons.com>
 <5502098A.6030909@openwide.fr>
Message-ID: <20150313072524.4933137d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 12 Mar 2015 22:47:54 +0100, Romain Naour wrote:

> Yann said in the commit log:
> "The fact that atomic operations are available is not really a
> specificity of the toolchain, but rather of the architecture."

That is correct, but you could imagine, on an architecture that does
have atomic operations, a compiler version that does not implement the
corresponding compiler intrinsics.

Back then, we decided to not support such situations, because it was
making the handling of this atomic operation support too complicated.

> >> config BR2_ARCH_HAS_ATOMICS
> >>   	# The following toolchains lack required compiler intrinsics
> >> 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
> >>   	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
> >>   	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> >> 	default y
> > 
> > Nope. We first need to find out whether the Blackfin architecture has
> > what's needed to provide atomic intrinsics. Depending on that, we'll
> > now if it's a toolchain limitation or not.
> 
> I'm not sure but blackfin seems to have some (one?) atomic instruction(s):
> 
> http://www.analog.com/media/en/dsp-documentation/processor-manuals/ADSP-BF539_HRM_rev03.pdf
> "The processor provides a single atomic operation: TESTSET"
> 
> http://blackfin.uclinux.org/doku.php?id=toolchain:application_binary_interface
> "The Blackfin does not have an atomic 64 bit load/store instruction"

What we need to check is if more recent versions of gcc on Blackfin do
have the atomic intrinsics available. If not, when we can simply decide
to set BR2_ARCH_HAS_ATOMICS to false on Blackfin. If however some more
recent gcc versions for Blackfin do have those instructions, then we
will have to handle a toolchain-level criteria to decide whether atomic
operations are available or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
