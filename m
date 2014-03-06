From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Mar 2014 09:51:03 +0000
Subject: [Buildroot] [PATCH] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5317B2EC.4010201@mind.be>
References: <1394039187-24328-1-git-send-email-Vincent.Riera@imgtec.com>
 <5317B2EC.4010201@mind.be>
Message-ID: <53184507.7040006@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2014 11:27 PM, Arnout Vandecappelle wrote:
> On 05/03/14 18:06, Vicente Olivert Riera wrote:
>> Building o32 ELF files for MIPS64 is an exotic configuration that nobody
>> should be using. If o32 is required, then is better if it's built for
>> MIPS 32-bit cores so only 32-bit instructions will be used leading to a
>> more efficient o32 usage.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   arch/Config.in.mips |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index d9c0c02..e2b1e60 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -47,6 +47,7 @@ choice
>>
>>   config BR2_MIPS_OABI32
>>   	bool "o32"
>> +	depends on !BR2_ARCH_IS_64
>>   config BR2_MIPS_NABI32
>>   	bool "n32"
>>   	depends on BR2_ARCH_IS_64
>>
>
>   Then maybe it's better to make the choice depend on BR2_ARCH_IS_64, and
> make the OABI32 symbol blind and default y on !BR2_ARCH_IS_64.

OABI32 is already the default on !BR2_ARCH_IS_64. Take a look to this 
part of the Config.in.mips:

choice
         prompt "Target ABI"
         depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
         default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
         default BR2_MIPS_NABI32 if BR2_ARCH_IS_64

>
>   Regards,
>   Arnout
>


-- 
Vincent
