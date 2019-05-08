From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 8 May 2019 15:29:32 +0200
Subject: [Buildroot] [PATCH 02/15] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <20190508120136.GB31209@scaer>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-3-romain.naour@gmail.com> <20190506194908.GB6887@scaer>
 <7a5d0c4c-abe5-b7e4-4ea1-160fc2be3a5f@gmail.com>
 <20190506200155.GC6887@scaer> <ee0b92f0-1fae-c844-a84a-bda08e33e71c@smile.fr>
 <20190508120136.GB31209@scaer>
Message-ID: <efdcab25-8db0-78f8-c918-b9c35186a19e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 08/05/2019 ? 14:01, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2019-05-07 10:26 +0200, Romain Naour spake thusly:
>> Le 06/05/2019 ? 22:01, Yann E. MORIN a ?crit?:
>>> The defconfigs as they are in Buildroot do not need it, so I fail to
>>> understand why we, in Buildroot, would need that.
>> I believe that's the same reason why we remove Werror in packages's compiler
>> flags. Building with Werror is not bulletproof when we start using a newer
>> compiler that introduce new warnings. This is the case here.
> 
> What you say makes sense, but then it means we should *always* disable
> Werror for the kernel builds, not just in the defconfigs, as you did. We
> would need something like:
> 
>     diff --git a/linux/linux.mk b/linux/linux.mk
>     index 51fd41fa15..85364451a8 100644
>     --- a/linux/linux.mk
>     +++ b/linux/linux.mk
>     @@ -315,6 +315,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>      	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
>      	$(if $(BR2_arm)$(BR2_armeb),
>      		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>     +	$(if $(BR2_powerpc)$(BR2_powerpc64)$(B R2_powerpc64le),
>     +		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR,$(@D)/.config))
>      	$(if $(BR2_TARGET_ROOTFS_CPIO),
>      		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
>      	# As the kernel gets compiled before root filesystems are
> 
> This is the way we disable Werror in packages. We don;t do that in the
> defconfigs, we do it in the pacakge's .mk file (or we patch/sed it out).
> 
>> So, It's clearly intended for kernel developers.
> 
> All the more reasons to always disable it, and not limit it to the
> defconfigs.

Ok, I updated the patch with your suggestion.
Thanks!

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
