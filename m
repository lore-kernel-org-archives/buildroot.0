From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 22:30:38 +0200
Subject: [Buildroot] [PATCH 1/5] linux: split calling "all" and
 "$(LINUX_TARGET_NAME)" targets
In-Reply-To: <20190422200830.2831-2-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
 <20190422200830.2831-2-thomas.petazzoni@bootlin.com>
Message-ID: <20190422203038.GB6200@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-22 22:08 +0200, Thomas Petazzoni spake thusly:
> In commit ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
> LINUX_BUILD_CMDS"), we changed LINUX_BUILD_CMDS to essentially do:
> 
>   make all $(LINUX_TARGET_NAME)
> 
> Unfortunately, it turns out that it breaks the build of a number of
> defconfigs, with errors such as:
> 
>   fixdep: error opening file: arch/xtensa/boot/lib/.inftrees.o.d: No such file or directory
> 
> Calling "all" and "$(LINUX_TARGET_NAME)" as separate make invocations
> avoids this problem, and fixes the build of several defconfigs.
[--SNIP--]
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1eac3287ab..dca3d63cd9 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -444,7 +444,8 @@ define LINUX_BUILD_CMDS
>  	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
>  		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
>  	)
> -	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all $(LINUX_TARGET_NAME)
> +	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all

Usually, it is not necessary to specify the 'all' target, as this is the
default. So, I would just drop it.

I don't have a striong feeling either way, though, and I can see value
in aving an explicit 'all' call.

However, What I'd like to see added is a comment that states we can't
have a single call:

    # Having 'all' and '$(LINUX_TARGET_NAME)' in the same call is not parallel-safe

(so that we do not try to "simplify" it back in the future.)

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	$(LINUX_BUILD_DTB)
>  	$(LINUX_APPEND_DTB)
>  endef
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
