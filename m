From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 12 Aug 2013 19:02:46 +0100
Subject: [Buildroot] [PATCH] arch/mips: Restrict n32 for Sourcery
 CodeBench toolchains.
In-Reply-To: <20130812194242.6fd25c55@skate>
References: <1376311394-17106-1-git-send-email-markos.chandras@imgtec.com>
 <20130812194242.6fd25c55@skate>
Message-ID: <CAG2jQ8g55tajeQVkU6AyUyUyus=bHQO-NNxmYRdRpA2d2-U=ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 August 2013 18:42, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Mon, 12 Aug 2013 13:43:14 +0100, Markos Chandras wrote:
>> n32 is not supported in Sourcery CodeBench toolchains.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>> See
>> https://sourcery.mentor.com/GNUToolchain/release2477?@template=datasheet
>> --- arch/Config.in.mips | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index 6242bcc..a01d6bb 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -46,7 +46,10 @@ config BR2_MIPS_OABI32
>>       bool "o32"
>>  config BR2_MIPS_NABI32
>>       bool "n32"
>> -     depends on BR2_ARCH_IS_64
>> +     depends on BR2_ARCH_IS_64 && \
>> +             !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305 && \
>> +             !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209 && \
>> +             !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
>>  config BR2_MIPS_NABI64
>>       bool "n64"
>>       depends on BR2_ARCH_IS_64
>
> I am not sure it's the right way of writing this: in the menuconfig,
> the ABI selection comes first, and then we have the toolchain
> selection. So it is quite likely that the user will chose the ABI
> first, and the enter the toolchain menu to make its toolchain
> configuration.
>
> With your proposal, if the user chooses n32, then goes in the toolchain
> menu and selects one of the CodeSourcery toolchain, the result would be
> a change in the ABI selection.
>
> I think I would prefer to add a depends on !BR2_MIPS_NABI32 on the
> affected toolchains (to prevent them from being selected), and then add
> something like:
>
> comment "CodeSourcery toolchains are only available for MIPS o32 and n64"
>         depends on BR2_MIPS_NABI32
>
> (of course adapt the comment to the reality)
>
> Would you mind reworking the patch in this direction?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Thomas,

No problem. I will submit a new patch

-- 
Regards,
Markos Chandras
