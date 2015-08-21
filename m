From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 00:16:34 +0200
Subject: [Buildroot] [PATCH v2] pkg-kernel-module: Die when kernel
	module are disabled
In-Reply-To: <878u9898vt.fsf@dell.be.48ers.dk>
References: <1439795444-32337-1-git-send-email-nrubinstein@aldebaran.com>
 <20150817163030.15ea69aa@free-electrons.com>
 <87h9nx887c.fsf@dell.be.48ers.dk> <20150818094747.GC3799@free.fr>
 <878u9898vt.fsf@dell.be.48ers.dk>
Message-ID: <20150821221634.GC3753@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-18 12:41 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  > Unless we add an hidden kconfig knob BR2)LINUX_NEEDS_MODULES that
>  > packages may select if they want to build modules. Of a visible knob
>  > (user-selectable) that packages can depend on if they need to build
>  > kernel modules...
> 
> Or the pkg-kernel-module infrastructure can just set a variable that
> gets checked by LINUX_KCONFIG_FIXUP_CMDS, E.G. something like:

OK, I don;t know why I missed that mail of yours (except it is not in
the same thread we were "battling" in).

> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index 6fb7704..436a721 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -91,6 +91,10 @@ define $(2)_KERNEL_MODULES_INSTALL
>  endef
>  $(2)_POST_INSTALL_TARGET_HOOKS += $(2)_KERNEL_MODULES_INSTALL
>  
> +ifeq ($(BR2_PACKAGE_$(2)),y)
> +LINUX_NEEDS_MODULES = YES
> +endif
> +
>  endef
>  
>  ################################################################################
> 
> 
> And then:
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index d91dbb2..eb7ce7e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -219,6 +219,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
>         $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
> +       $(if $(LINUX_NEEDS_MODULES),
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
>  endef
>  
>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)

Yes, that should work.

Of course, you are right, we'd only use that variable after all .mk are
parsed, being in the kconfig-fixup commands.

I'll see to implement and test that.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
