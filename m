From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 11 Nov 2019 18:47:07 +0000
Subject: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
In-Reply-To: <20191109144656.3da6a1b0@windsurf>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
Message-ID: <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11/9/19 5:46 AM, Thomas Petazzoni wrote:
> Hello,
>
> +Arnout for legacy handling.
>
> On Fri,  8 Nov 2019 09:41:10 -0800
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>> This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  arch/Config.in.arc | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
>> index c65bb01f1f4f..284951b82cee 100644
>> --- a/arch/Config.in.arc
>> +++ b/arch/Config.in.arc
>> @@ -11,13 +11,19 @@ config BR2_arc750d
>>  config BR2_arc770d
>>  	bool "ARC 770D"
>>  
>> -config BR2_archs38
>> +config BR2_archs
>>  	bool "ARC HS38"
>>  	help
>>  	  Generic ARC HS capable of running Linux, i.e. with MMU,
>> -	  caches and multiplier. Also it corresponds to the default
>> +	  caches and 32-bit multiplier. Also it corresponds to the default
>>  	  configuration in older GNU toolchain versions.
>>  
>> +config BR2_archs38
> This re-use of an existing name is a bit annoying. Indeed, all existing
> users of Buildroot that have a configuration with BR2_archs38 will now
> be building for a ARC system with a 64-bit multiplier, while they were
> previously building for a 32-bit multiplier.
>
> I see that what you have done is to try to be consistent between the
> BR2_ options and the gcc options. I'm hesitating between keeping the
> consistency but making the migration a bit annoying for users, or
> breaking the consistency to make the migration smooth for users.
>
> Since I think the number of affected users will probably be quite
> small/limited, I think I would be fine with merging your patch as-is,
> but I'd like to hear from others.

I agree that this might cause potential breakage, but this is not totally
uncharted territory for software build config. We've been building Linux kernel
with this option as default since mid 2018.

2018-09-07 00a99339f0a3 ARCv2: build: use mcpu=hs38 iso generic mcpu=archs?

Granted that kernel build is just one part of puzzle and any latent codegen issues
are more likely to surface with default applied to full software stack, I would
still vote for switching default to -mcpu=hs38

Thx,
-Vineet
