From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:08:57 +0100
Subject: [Buildroot] [PATCH 4/9] arch/arm: do not allow soft-float for
 armv8a
In-Reply-To: <20170904172137.GB5223@scaer>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
 <bd6e8e2eaf13ecc5e45e360875cfff3494b86a8c.1504444617.git.yann.morin.1998@free.fr>
 <20170904172137.GB5223@scaer>
Message-ID: <20171124230857.0b6e1648@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Sep 2017 19:21:37 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-09-03 15:17 +0200, Yann E. MORIN spake thusly:
> > armv8a has made VFPv4 and NEON mandatory, so there is no point in
> > allowing software floating point, even in 32-bit mode.  
> 
> In fact, even though I'm pretty sure that OK in 64-bit, we might still
> have a reason to do soft-float in 32-bit mode, if only for legacy
> binary-only applications that were built as soft-float way back in the
> (not so) good old days...
> 
> In which case, we should instead depend on !BR2_ARCH_IS_64.
> 
> Thoughts?

I'm hesitating on this one. I believe the use-case you mention makes
sense, however I believe that it can still be supported with your
proposed patch.

Indeed, even if you want to run a binary-only soft-float application,
it doesn't prevent the rest of your system from using VFP, as long as
you use EABI (and not EABIhf).

The whole reason why EABI passes floating-point arguments into integer
registers is precisely to allow compatibility between soft-float code
and hard-float code. Thanks to that, a soft-float function can call a
hard-float function, and vice-versa.

Therefore, even if you have a binary-only soft-float application, there
is really no reason to build the entire system soft-float.

So, I think your original patch is OK as-is. However, I still see one
inconsistent thing: if we disallow soft-float because ARMv8-A mandates
VFPv4, why would we allow soft-float for ARMv7-A cores that have a
VFP ? To be consistent, we should also disallow soft-float.

Another way to think about this is: is it possible to build an AArch64
soft-float system? do we want to allow the user to select what is
*possible* or what makes sense?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
