From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:05:12 +0200
Subject: [Buildroot] [PATCH v2 1/6] arm: update processor types
In-Reply-To: <1431959088-15257-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150518220512.556d53ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Mon, 18 May 2015 11:24:43 -0300, Guido Mart?nez wrote:

>  config BR2_USE_MMU
> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> -	default y if !BR2_bfin
> +	bool "Enable MMU support"
> +	depends on BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> +	depends on !BR2_cortex_m3 && !BR2_bfin

This breaks things, because now BR2_USE_MMU is empty on architectures
others than arm, armeb, sh and xtensa.

What we probably need is something like this:

config BR2_ARCH_MMU_OPTIONAL
	bool

config BR2_ARCH_MMU_MANDATORY
	bool

and have all ARM cores select BR2_ARCH_MMU_OPTIONAL except Cortex M3,
SuperH and Xtensa select BR2_ARCH_MMU_OPTIONAL, all other architectures
except Blackfin selecting BR2_ARCH_MMU_MANDATORY.

And then:

	bool "Enable MMU support" if BR2_ARCH_MMU_OPTIONAL
	default y if BR2_ARCH_MMU_MANDATORY || BR2_ARCH_MMU_OPTIONAL

or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
