From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Jun 2016 12:54:34 +0100
Subject: [Buildroot] [PATCH v2 next 1/7] toolchain: add common binutils
 version hidden config options
In-Reply-To: <20160608232106.2c24920e@free-electrons.com>
References: <1464693078-15767-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160608232106.2c24920e@free-electrons.com>
Message-ID: <5763E4FA.3070207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 08/06/16 22:21, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 May 2016 12:11:12 +0100, Vicente Olivert Riera wrote:
>> This commit adds a number of hidden Config.in options, that will be used
>> to handle dependencies on the binutils version. We mimic the model that
>> was used for the kernel headers dependency mechanism.
>>
>> These hidden options will be selected by the internal and external
>> toolchain backend logic respectively, in follow-up commits.
>>
>> These options will be helpful when we need to make packages depend on
>> certain version of binutils. Further patches will do this for gcc and
>> valgrind packages.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I was about to apply this series, but in fact, I'm going to reject it,
> as I believe the annoyance / benefit ratio is not good.
> 
> You are introducing those binutils version selectors to solve two
> problems:
> 
>  * The fact that gcc 4.8 does not work on MIPS with binutils >= 2.25.
>    binutils 2.25 is already our default, and as soon as binutils 2.27
>    is released, 2.26 will be the default, and 2.24 will be removed,
>    leaving in fact no way to select gcc 4.8 on MIPS.
> 
>    So I would prefer that we simply disallow gcc 4.8 on MIPS completely.
> 
>  * The fact that Valgrind doesn't work on MIPS soft-float with binutils
>    >= 2.25. Same comment here: just disable Valgrind on MIPS soft-float
>    and that's it.

not only that. I think it's useful to know which gcc version a toolchain
has. That's why we have GCC_AT_LEAST options.
Also, I think it's useful to know which linux headers a toolchain has.
That's why we have HEADERS_AT_LEAST options.

And I also think it would be good to know which binutils version a
toolchain has, with BINUTILS_AT_LEAST options. And probably it would be
good to know which C library version as well, with GLIBC_AT_LEAST,
UCLIBC_AT_LEAST and MUSL_AT_LEAST.

Regards,

Vincent.


> Normally, the version option are used to indicate that something
> *works* only after a certain version (like kernel headers >= 3.10, or
> gcc >= 4.9).
> 
> But here, you're using the options in the opposite way: to say that
> anything after binutils 2.25 (included) is broken. With 2.24 going away
> in the near future, I rather prefer the above solutions that to add
> those additional binutils version options.
> 
> So could you instead submit patches that:
> 
>  1/ Disallow gcc 4.8 on MIPS
>  2/ Disallow valgrind on MIPS soft-float
> 
> Thanks!
> 
> Thomas
> 
