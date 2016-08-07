From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 11:29:35 +0200
Subject: [Buildroot] [PATCH] openblas: fix build issues on ARM
In-Reply-To: <9111A0DF-B21B-4A2E-9CA7-FEAE55D1E91A@gmail.com>
References: <1470520434-15516-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <9111A0DF-B21B-4A2E-9CA7-FEAE55D1E91A@gmail.com>
Message-ID: <20160807112935.3a9ca090@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Aug 2016 01:13:40 -0700, Khem Raj wrote:

> > + - Assuming that one uses -mfloat-abi=hard on ARMv7 is completely
> > +   wrong. -mfloat-abi=softfp is a perfectly valid choice on ARMv7, and
> > +   OpenBLAS should not make such assumptions.  
> 
> perhaps they do not support softfp, this should be confirmed.

Hum, right, they might have some assembly code that assumes floating
point arguments are passed in FP registers.

> > +-ifeq ($(CORE), ARMV5)
> > +-CCOMMON_OPT += -marm -march=armv5
> > +-FCOMMON_OPT += -marm -march=armv5  
> 
> -marm option is also removed. I wonder if this code will now build when we have thumb/thumb2 ISA
> selected as default for an arm machine.

So maybe I should keep the -marm flag here, and in fact just remove
-march=armv5. Also, for the ARMv7-A, I could keep the flag, and make
the ARMV7 OpenBLAS platform only selectable when ARMv7 + EABIhf +
VFPv3/v4 is available.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
