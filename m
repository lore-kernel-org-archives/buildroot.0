From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 2 May 2013 14:03:53 +0000
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <20130501000905.609d0ced@skate>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
 <20130429224541.6f46b3b4@skate>	<517FEC03.1010709@mind.be>
 <20130501000905.609d0ced@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339FE6A5@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >     Maybe others will have a suggestion on this point?
> 
>   Not entirely clean either, but what about the following:
> 
> [toolchain/gcc/Config.in]
> config BR2_ARCH_HAS_ALL_GCC
> 	bool
> 
> config BR2_ARCH_HAS_GCC_4_4
> 	bool
> 	default y if BR2_ARCH_HAS_ALL_GCC
> 
> [arch/Config.in]
> config BR2_mips
> 	select BR2_ARCH_HAS_ALL_GCC
> ...
> 
> [arch/Config.in.arm]
> config BR2_arm1176jzf_s
> 	select BR2_ARCH_HAS_ALL_GCC
> ...
> config BR2_cortex_a8
> 	select BR2_ARCH_HAS_GCC_4_4
> ...

The problem with this is that you end up in Config.in.arm with a lot of "select BR2_ARCH_HAS_ALL_GCC" lines. It is more logical, but it adds a lot of clutter IMHO. 

Unfortunately, we cannot make "BR2_ARCH_HAS_ALL_GCC" default y, because we don't have the 'deselect' keyword, so we need to add it everywhere. For ARM and x86, the architectures that aren't supported by all GCC versions are the exception, so instead of adding additional lines for just the exceptions, we end up with extra code everywhere.

I also tried to let default values depend on earlier versions:
config BR2_ARCH_HAS_GCC_4_5
	bool
	default y if BR2_ARCH_HAS_GCC_4_4

But this doesn't work for several architectures, such as BR2_sparc_sparcsfleon, that do have GCC 4.4, but no 4.5 for instance.

The reverse logic helps in the sense that the BR2_HAS_NO_GCC_x_y lines will go away over time when old GCC versions get deprecated.

I will send both variants later today.

Mischa
