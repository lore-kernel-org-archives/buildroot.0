From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 09:35:15 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: simplify the conditions for
 BR2_TOOLCHAIN_ARM_HAS_SYNC_8
In-Reply-To: <20161121234340.30463-2-arnout@mind.be>
References: <20161121234340.30463-1-arnout@mind.be>
 <20161121234340.30463-2-arnout@mind.be>
Message-ID: <20161122093515.6db0df30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 00:43:40 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

>  config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
>  	bool
>  	default y
>  	depends on BR2_arm || BR2_armeb
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> -	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

Can we make this instead:

	depends on (BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_TOOLCHAIN_USES_GLIBC) || BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

This way, glibc toolchains (which were never affected by the _write
issue) still expose the fact that they support the __sync_8 thing.
Otherwise, your change introduces a regression: a 4.7 glibc external
toolchain was prior to your patch exposing the fact that it supports
8-byte sync, but no longer after your patch.

Also, what about the __atomic 8 bytes? As we discussed yesterday, it's
in fact affected by the same issue. How do we deal with that? Do we
introduce per-size BR2_TOOLCHAIN_HAS_ATOMIC_<size> options?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
