From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Aug 2017 23:33:32 +0200
Subject: [Buildroot] [PATCH] glibc: needs kernel headers >= 4.5 on
 mips(64)
In-Reply-To: <20170822163430.GA3722@scaer>
References: <20170820144154.15347-1-romain.naour@gmail.com>
 <20170820222602.1f51bd7c@windsurf> <20170821162846.GA3412@scaer>
 <20170821231004.0deded59@windsurf> <20170822163430.GA3722@scaer>
Message-ID: <440ef8da-06b1-3976-ff82-6eea105249bd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All

Le 22/08/2017 ? 18:34, Yann E. MORIN a ?crit :
> Thomas, All,
> 
> On 2017-08-21 23:10 +0200, Thomas Petazzoni spake thusly:
>> On Mon, 21 Aug 2017 18:28:46 +0200, Yann E. MORIN wrote:
>>
>>>> Yann is specifically working on a mechanism to allow architectures to
>>>> describe what minimum gcc version they need. Perhaps we should use that
>>>> to express this dependency as well. Adding Yann in Cc :)  
>>>
>>> And indeed, it was pretty trivial to do so with my changes:
>>>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/aarch64-cpus-2&id=96c77a38f423fd1745ea5601b71d3ac63c7ea11e
>>
>> I am not sure this patch is correct. Indeed, in the choice you have two
>> options: NaN 2008 and NaN legacy. With your patch, it's only when NaN
>> 2008 is chosen that you indicate the architecture needs at least gcc
>> 4.9.
>>
>> But in fact, even if NaN legacy is chosen, you need gcc 4.9, because
>> -mnan=legacy also only works with gcc 4.9: the -mnan option didn't
>> exist at all before gcc 4.9 (at least that's my understanding).
> 
> So, gcc before 4.9 do not have the -mnan option, so the symbol
> BR2_TOOLCHAIN_HAS_MNAN_OPTION is not set. And the code that adds -mnan
> is now conditioanl to that symbol.
> 
> So it does work:
> 
>  1- if the user selects NaN legacy, he is not restricted in the gcc
>     version he may use;
> 
>     1a- if gcc is older than 4.9, no -mnan option is passed,
>     1b- if gcc if 4.9 or later, -mnan=legacy is passed (although that is
>         the default in gcc, we force it);
> 
>  2- the user select NaN-2008, he is restricted in using a gcc 4.9 or
>     later, and we always pass -mnan=2008.
> 
> Isn't what we want?
> 
> Of course, I may have left a bug somewhere... ;-)
> 
>> However, I believe the current code is already bogus. Indeed,
>> BR2_MIPS_CPU_MIPS32 selects BR2_MIPS_NAN_LEGACY, which means
>> BR2_GCC_TARGET_NAN is set to legacy, so -mnan=legacy will be passed...
>> which will break the build for gcc < 4.9.
> 
> Not really, because when gcc is older than 4.9, BR2_GCC_TARGET_NAN is
> not set, so this condition is not met (line ~210):
> 
>     package/gcc/gcc.mk:ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
>     package/gcc/gcc.mk:HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
>     package/gcc/gcc.mk:endif
> 
> So there is no -mnan option pased in this case.
> 
> But with my patch, BR2_GCC_TARGET_NAN is always set now, so the
> condition above is now enclosed with:
> 
>     package/gcc/gcc.mk:ifeq ($(BR2_TOOLCHAIN_MIPS_HAS_MNAN_OPTION),y)
>     [the code above]
>     package/gcc/gcc.mk:endif
> 
>> There is definitely something to double check here.
>>
>>> Also, I think we should rename BR2_TOOLCHAIN_HAS_MNAN_OPTION to include
>>> the fact that it is mips, like: BR2_TOOLCHAIN_HAS_MIPS_MNAN_OPTION.
>>
>> Also what I thought when reviewing Vicente patches, but then I decided
>> to not do it, because the gcc option is really named -mnan and not
>> -mmips-nan or something like that.
> 
> Hence I renamed it BR2_TOOLCHAIN_MIPS_HAS_MNAN_OPTION because we already
> have symbols named as such:
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/aarch64-cpus-2&id=b8950fddae941f427ce7b4cc64d6388573a93101
> 
> (We're not doing a review of a series I haven't yet posted, are we? ;-] )

I'm glad to see you're already working on a fix.
I'm still working on glibc 2.26 bump (hence this patch) but I'm facing to a
build issue on x86_64 with mesa3d package.
I'll take a look at your series as soon as it'll be on the list :)

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
