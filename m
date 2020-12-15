From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 15 Dec 2020 23:15:35 +0100
Subject: [Buildroot] [PATCH] toolchain-buildroot: glibc: Remove the
 default choice of built-in SunRPC
In-Reply-To: <e66a9d79-f300-c853-64da-b5859ae72209@mind.be>
References: <20201211121255.17309-1-kremneva@synopsys.com>
 <e66a9d79-f300-c853-64da-b5859ae72209@mind.be>
Message-ID: <868f433a-e7cc-9590-d2f0-050e949fa6d3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 15/12/2020 ? 22:24, Arnout Vandecappelle a ?crit?:
> 
> 
> On 11/12/2020 13:12, Veronika Kremneva wrote:
>> There is an error present when building lmbench with glibc-2.26 and above:
>> ----------------------------->8---------------------------
>> Makefile:226: recipe for target '../bin/arc/lib_udp.o' failed
>> make[2]: *** [../bin/arc/lib_udp.o] Error 1
>> In file included from lib_unix.c:9:
>> bench.h:39:10: fatal error: rpc/rpc.h: No such file or directory
>>    39 | #include <rpc/rpc.h>
>>       |          ^~~~~~~~~~~
>> compilation terminated.
>> Makefile:228: recipe for target '../bin/arc/lib_unix.o' failed
>> make[2]: *** [../bin/arc/lib_unix.o] Error 1
>> In file included from lib_timing.c:17:
>> bench.h:39:10: fatal error: rpc/rpc.h: No such file or directory
>>    39 | #include <rpc/rpc.h>
>>       |          ^~~~~~~~~~~
>> compilation terminated.
>> ----------------------------->8---------------------------
>> You can find more details about failed builds here:
>> http://autobuild.buildroot.net/?reason=lmbench-3.0-a9
>>
>> This happens because native implementation of Sun RPC was removed
>> from glibc and moved to a separate library (libtirpc):
>> https://fedoraproject.org/wiki/Changes/SunRPCRemoval
>>
>> Yet in Buildroot we still assume BR2_TOOLCHAIN_HAS_NATIVE_RPC
>> in case of glibc, which is not true.
>>
>> The following patch removes the default assumption that glibc
>> has a built-in implementation of SunRPC.
>>
>> Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>
>> ---
>>  toolchain/toolchain-buildroot/Config.in | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
>> index 2058ff1eb9..74aa9abc25 100644
>> --- a/toolchain/toolchain-buildroot/Config.in
>> +++ b/toolchain/toolchain-buildroot/Config.in
>> @@ -59,8 +59,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>>  	depends on !BR2_powerpc_SPE
>>  	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
>>  	select BR2_TOOLCHAIN_USES_GLIBC
>> -	# our glibc.mk enables RPC support
> 
>  As you see from this comment, we *do* enable rpc support in our glibc build.
> 
>  However, this feature is removed in glibc 2.32. In Buildroot, we are still
> using glibc 2.31 - except for ARC and RISCV-32. So I guess you're using one of
> those. Well, based on your e-mail, probably ARC :-). Please note in the commit
> message that it is really removed in glibc 2.32.
> 
>  I think this obsolete RPC was a transitory measure for when some versions of
> glibc still had RPC bundled. Now, I indeed think we can remove it.
> 
>  In addition to this, we should also remove the --enable-obsolete-rpc flag from
> glibc.mk. And maybe also check if nsswitch.conf needs to be adapted as well.
> 
>  Romain, can you think of anything else that has to change?

I have a patch series for the remaining changes:
http://patchwork.ozlabs.org/project/buildroot/list/?series=219086

As far I can see, when a package depends on RPC it can use either
BR2_TOOLCHAIN_HAS_NATIVE_RPC or BR2_PACKAGE_LIBTIRPC.

I don't think we have to update nsswitch.conf.

> 
>  Ideally we should be able to remove BR2_TOOLCHAIN_HAS_NATIVE_RPC completely,
> but there are external toolchains that still have it bundled, so we can't do
> that yet.
> 
>  Thomas, the script that generates the external bootlin toolchain
> Config.in.options files will need to be adapted as well.

Indeed but we have to update generated defconfig fragment from toolchain builder
project.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
> 
>> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>  	help
>>  	  This option selects glibc as the C library for the
>>  	  cross-compilation toolchain.
>>
