From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 14 Jul 2017 14:47:15 -0500
Subject: [Buildroot] [PATCH] package/Makefile.in: Tweak TARGET_ABI for
	MPC8548
In-Reply-To: <20170712093218.5a6a20ff@windsurf.lan>
References: <20170712024737.21578-1-andrew.smirnov@gmail.com>
 <20170712093218.5a6a20ff@windsurf.lan>
Message-ID: <CAHQ1cqFpf7ggXb=wWnmqHpoScMe-B8wmWO6az2f7RAx72C72OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 12, 2017 at 2:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 11 Jul 2017 19:47:37 -0700, Andrey Smirnov wrote:
>> From: Mark Hinds <mhinds@spaceflightindustries.com>
>>
>> Add -mcpu=8548 -mhard-float to TARGET_ABI so that hardware FP is used
>> to build all of the package in the system.
>>
>> Signed-off-by: Mark Hinds <zoronic@gmail.com>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  package/Makefile.in | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index b95e5e3..958d72c 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -78,7 +78,7 @@ ifeq ($(BR2_powerpc_8540),y)
>>  TARGET_ABI += -mabi=spe -mfloat-gprs=single -Wa,-me500
>>  endif
>>  ifeq ($(BR2_powerpc_8548),y)
>> -TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2
>> +TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -mcpu=8548 -mhard-float
>
> Adding the -mcpu is useless, because it's already passed thanks to
> BR2_GCC_TARGET_CPU, defined to 8548 when BR2_powerpc_8548=y in
> arch/Config.in.powerpc.
>

Oh! Missed that, my bad.

> Unconditionally passing -mhard-float here is wrong, because people may
> want to use soft-float, which can be selected using the
> BR2_POWERPC_SOFT_FLOAT option.
>

Good point, haven't thought about that.

> When BR2_SOFT_FLOAT=y (which is selected by BR2_POWERPC_SOFT_FLOAT), we:
>
>  * Pass --with-float=soft when building gcc (see package/gcc/gcc.mk).
>    This solves the case of internal toolchain being used.
>
>  * Add -msoft-float in the toolchain wrapper when an external toolchain
>    is used (toolchain/toolchain-external/pkg-toolchain-external.mk).
>
> However, we indeed never explicitly pass --with-float=hard (when
> building gcc) or -mhard-float (for external toolchains).
>
> Could you describe more precisely the problem you're seeing? Are you
> using the internal toolchain backend, or an external toolchain? In the
> latter case, which external toolchain are you using?
>

It's been a while, since I investigated this patch, but I believe we
were seeing performance improvements on heavily numerical application
on our system with "-mhard-float" while using custom built
crosstools-ng e500 toolchain. But given how I didn't notice two
significant problems with this patch and it is clearly not ready for
prime time, let me go back and do more research/double check that I
wasn't doing something dumb and missing the obvious.

I'll follow up with a separate patch if it's truly useful.

Thanks,
Andrey Smirnov
