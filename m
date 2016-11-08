From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:25:05 +0100
Subject: [Buildroot] [PATCH master 1/3] MIPS: remove M5100 core
In-Reply-To: <335eb04b-311e-4aab-d412-c88eded124ef@mind.be>
References: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
 <335eb04b-311e-4aab-d412-c88eded124ef@mind.be>
Message-ID: <6d6b7294-33f2-feae-49a1-d836bfd2ab0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 *Note that this patch is for master, not for next...*

On 08-11-16 23:19, Arnout Vandecappelle wrote:
> 
> 
> On 08-11-16 11:32, Vicente Olivert Riera wrote:
>> This is a microcontroller class (MCU) core which is not suitable for
>> running Linux.
> 
>  I don't really understand this. What makes it a microcontroller class core that
> is not suitable for running Linux? Do you mean to say that no SoCs exist with
> sufficient memory to be able to run Linux? Or is it just that it's noMMU? The
> latter shouldn't be a problem.

 OK, the answer is simple: the kernel doesn't support this core.

> 
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  arch/Config.in.mips                    | 5 -----
>>  package/gcc/Config.in.host             | 5 ++---
>>  toolchain/toolchain-external/Config.in | 2 +-
>>  3 files changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index 3662fed..289e35d 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -47,10 +47,6 @@ config BR2_mips_interaptiv
>>  	bool "interAptiv"
>>  	depends on !BR2_ARCH_IS_64
>>  	select BR2_MIPS_CPU_MIPS32R2
>> -config BR2_mips_m5100
>> -	bool "M5100"
>> -	depends on !BR2_ARCH_IS_64
>> -	select BR2_MIPS_CPU_MIPS32R5
> 
>  Missing legacy handling.

 Forget it, this core was introduced in this cycle so no legacy handling is needed.


Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


> 
>  Regards,
>  Arnout
> 
>>  config BR2_mips_m5101
>>  	bool "M5101"
>>  	depends on !BR2_ARCH_IS_64
>> @@ -133,7 +129,6 @@ config BR2_GCC_TARGET_ARCH
>>  	default "mips32r5"	if BR2_mips_32r5
>>  	default "mips32r6"	if BR2_mips_32r6
>>  	default "interaptiv"	if BR2_mips_interaptiv
>> -	default "m5100"		if BR2_mips_m5100
>>  	default "m5101"		if BR2_mips_m5101
>>  	default "m6201"		if BR2_mips_m6201
>>  	default "p5600"		if BR2_mips_p5600
>> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
>> index 446df4d..f46656c 100644
>> --- a/package/gcc/Config.in.host
>> +++ b/package/gcc/Config.in.host
>> @@ -64,9 +64,8 @@ choice
>>  		# musl ppc64 unsupported
>>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>>  		# Unsupported MIPS cores
>> -		depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && \
>> -			!BR2_mips_m5101 && !BR2_mips_m6201 && !BR2_mips_i6400 && \
>> -			!BR2_mips_p6600
>> +		depends on !BR2_mips_interaptiv && !BR2_mips_m5101 && \
>> +			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
>>  		# musl mips64 unsupported
>>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
>>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
>> index 5324599..22f760b 100644
>> --- a/toolchain/toolchain-external/Config.in
>> +++ b/toolchain/toolchain-external/Config.in
>> @@ -530,7 +530,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>>  		BR2_x86_64
>>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>>  	# Unsupported MIPS cores
>> -	depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && !BR2_mips_m5101
>> +	depends on !BR2_mips_interaptiv && !BR2_mips_m5101
>>  	# Unsupported for MIPS R6
>>  	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
>>  	select BR2_TOOLCHAIN_EXTERNAL_MUSL
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
