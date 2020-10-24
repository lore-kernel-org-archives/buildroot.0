From: Derrick Pallas <derrick@meter.com>
Date: Sat, 24 Oct 2020 12:02:27 -0700
Subject: [Buildroot] [PATCH 1/1] package/meson: fix blank entry in
 cross-compilation.conf
In-Reply-To: <20201024203231.36f8b4a5@gmx.net>
References: <20201023061251.29900-1-derrick@meter.com>
 <20201024203231.36f8b4a5@gmx.net>
Message-ID: <f7739bed-eba2-8c5e-837e-d66e9b7940e8@meter.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for looking Peter.

On 10/24/20 11:32 AM, Peter Seiderer wrote:
> On my system (for a RPi4 configuration) already without your patch:
> 
> 	$ grep cpu host/etc/meson/cross-compilation.conf
> cpu_family ='aarch64'
> cpu = 'cortex-a72'
> 
> GCC_TARGET_CPU comes from arch/arch.mk:
> 
> GCC_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
> 
> Anything special with your configuration/build environment (which
> buildroot version)? What is the BR2_GCC_TARGET_CPU entry in
> your .config file?

I've tried this on both the development branch and on 2020.08.1 and I 
get the same results. The target is an x86_64/silvermont. After taking a 
second look, the problem seems to be that arch/Config.in.x86 does not 
actually set BR2_GCC_TARGET_CPU; instead, it sets BR2_GCC_TARGET_ARCH 
with a value that might better described as BR2_GCC_TARGET_CPU. Thus, my 
config has

	BR2_ARCH = x86_64 # because BR2_x86_64
	BR2_GCC_TARGET_ARCH = silvermont # because BR2_x86_silvermont

Is the config variable misnamed for x86? Adding Thomas Petazzoni, since 
it looks like he did the original breakout of BR2_GCC_TARGET_ARCH and 
then later removed it from several archs (e.g. arm) in favor of cpu.

Or should there be a fallback from BR2_GCC_TARGET_CPU to 
BR2_GCC_TARGET_ARCH if the former does not exist?

Thanks, ~Derrick
