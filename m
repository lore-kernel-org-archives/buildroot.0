From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 12 Feb 2016 21:52:46 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160212213523.7a50a906@free-electrons.com>
References: <20160212073018.E5E46101657@stock.ovh.net>
 <20160212104541.0e3774b1@free-electrons.com> <56BE31F1.7010700@gmail.com>
 <20160212213523.7a50a906@free-electrons.com>
Message-ID: <56BE461E.2010801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 12/02/2016 21:35, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Fri, 12 Feb 2016 20:26:41 +0100, Romain Naour wrote:
> 
>>>>          arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/7dcaeb8fbb5739c36aa0615e3d8a13e9c32993b0/
>>>
>>> I guess would be fixed by http://patchwork.ozlabs.org/patch/572201/.
>>
>> I reopened a bug about this issue the upstream fix is not enough. See
>> https://phab.enlightenment.org/T2718
> 
> I don't see this bug as being reopened. Am I missing something ?

Wrong link sorry.

> 
>> So, for the moment we can build efl 1.15 only with Lua 5.1 (Lua 5.1 was the
>> default version used at the time I tested the efl bump series).
> 
> Right, so http://patchwork.ozlabs.org/patch/572201/ would fix the
> problem for now, correct ?
> 
> BTW, your patch references https://phab.enlightenment.org/T2728, but
> this URL cannot be accessed without creating an account on this
> Phabricator instance, which is somewhat annoying.

Yes this one, I just changed the visibility. can you retry now ?

> 
>> I have a local branch that bump the efl to the latest version (1.17.0) and the
>> support for lua-old doesn't build with (5.1, 5.2 and 5.3) due to this issue.
> 
> Due to which issue ?

The issue I reported while I reopened T2728.

host-efl-1.16.1/src/lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
collect2: error: ld returned 1 exit status

> 
>> The problem for 2016.02 is it's too late to enable lua-jit support in efl. So
>> people using efl with 2016.02 will have to switch to lua-jit when efl will be
>> updated to a newer version :-/
>>
>> Do you want me to send a small series (3 patches) adding lua-jit support for
>> 2016.02 ?
> 
> No, it's too late for such a change. I prefer a minimal solution, so if
> forcing the use of Lua 5.1 fixes the problem for now (as your patch
> http://patchwork.ozlabs.org/patch/572201/) suggests, I'd prefer this
> option.

Ok, so you can apply this patch.

> 
>>>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/00a5ef3a4e10700c79b83bc1ab026808ce930030/
>>>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c98add9541defd5f12415b69521a1b32ddfa270d/
>>>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/527d982ab6616eb7bef9419a9e793f7a46c32830/
>>>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d4e18789c1da2d8518db873d7833af186daf9859/
>>>
>>> Romain, didn't we say we should add some exclusion for this issue ? If
>>> so, can you submit a patch ?
>>
>> Technically, it's a toolchain issue with gcc 4.9. So if we rebuild a new nios2
>> toolchain with gcc 5.3 this error is gone. Otherwise we can add an autobuilder
>> exception for br-nios2-full-2015.11-rc1-71-g90d1299.tar.bz2.
>>
>> Even we can remove BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII since the new
>> codesourcery toolchain use gcc 5.2.
> 
> For the time being, can we simply do:
> 
> -       depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # triggers compiler bug
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_nios2
> 
> Or simply as you suggest, we add an exclusion in the autobuilders.
> Probably the easiest. Can you send a patch doing this ?

Yes, I prefer to add an exclusion in the autobuilders. I'll send a patch.
Also, I need to check if each 'depends on
!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII' are still valid for the new CS
nios2 toolchain.

> 
>>>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700/
>>>
>>> Romain, is the patch for this pending somewhere ?
>>
>> We need to rebuild a nios2 toolchain with the upstream patch applied [1] and
>> disable for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII:
>>
>> [1]
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=83da6e748c8f105f07e17f53aa6b99ed7867ff5f
>>
>> Otherwise we can apply this one: http://patchwork.ozlabs.org/patch/561414/
> 
> We need to do three things here I believe:
> 
>  1/ Add a BR2_TOOLCHAIN_BINUTILS_HAS_BUG_xyz option, which the CodeSourcery
>     option would select and Qt GUI would depends
>     on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_xyz
> 
>  2/ Add the patch to the binutils package.

I tested the patch with binutils 2.26 [1], I'm testing it with 2.25.1.

[1] http://patchwork.ozlabs.org/patch/580038/

> 
>  3/ Add an exclusion to the autobuilder script, until the toolchains
>     are rebuilt with the upstream patch.
> 
> Do you think you can work on this ?

I'm on it.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
