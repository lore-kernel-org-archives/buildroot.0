From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 19 May 2015 12:53:42 -0300
Subject: [Buildroot] [PATCH v2 1/6] arm: update processor types
In-Reply-To: <20150518220512.556d53ae@free-electrons.com>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-2-git-send-email-guido@vanguardiasur.com.ar>
 <20150518220512.556d53ae@free-electrons.com>
Message-ID: <20150519155342.GA23051@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 18, 2015 at 10:05:12PM +0200, Thomas Petazzoni wrote:
> >  config BR2_USE_MMU
> > -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> > -	default y if !BR2_bfin
> > +	bool "Enable MMU support"
> > +	depends on BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> > +	depends on !BR2_cortex_m3 && !BR2_bfin
> 
> This breaks things, because now BR2_USE_MMU is empty on architectures
> others than arm, armeb, sh and xtensa.
Ugh, stupid me.

> What we probably need is something like this:
> 
> config BR2_ARCH_MMU_OPTIONAL
> 	bool
> 
> config BR2_ARCH_MMU_MANDATORY
> 	bool
> 
> and have all ARM cores select BR2_ARCH_MMU_OPTIONAL except Cortex M3,
> SuperH and Xtensa select BR2_ARCH_MMU_OPTIONAL, all other architectures
> except Blackfin selecting BR2_ARCH_MMU_MANDATORY.
> 
> And then:
> 
> 	bool "Enable MMU support" if BR2_ARCH_MMU_OPTIONAL
> 	default y if BR2_ARCH_MMU_MANDATORY || BR2_ARCH_MMU_OPTIONAL
> 
> or something like that.
Yes, I'll work on something like that.

Sorry for the noise :(

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
