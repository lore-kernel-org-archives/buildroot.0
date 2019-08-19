From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2019 23:31:39 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper: explicitly set
 Build ID to none if BR2_REPRODUCIBLE
In-Reply-To: <20190816175655.GF27959@scaer>
References: <20190816170345.19480-1-itsatharva@gmail.com>
 <20190816175655.GF27959@scaer>
Message-ID: <cd6fef41-9d1e-0668-1231-9c561102e2fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/08/2019 19:56, Yann E. MORIN wrote:
> Atharva, All,
> 
> On 2019-08-16 22:33 +0530, Atharva Lele spake thusly:
>> Build ID is added to binaries at link time. Building in different output
>> directories causes some packages to have different Build IDs, thus resulting in
>> non-reproducibility.
>>
>> Adding "-Wl,--build-id=none" fixes this issue by disabling setting of Build ID.
>>
>> Diffoscope output for Build ID issue: https://gitlab.com/snippets/1886180/raw
>>
>> After this patch, build is reproducible - i.e. diffoscope does not produce any
>> output.
>>
>> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
>> ---
>>  toolchain/toolchain-wrapper.c  | 3 +++
>>  toolchain/toolchain-wrapper.mk | 4 ++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
>> index 7a4b9c4007..f7f2a9ec97 100644
>> --- a/toolchain/toolchain-wrapper.c
>> +++ b/toolchain/toolchain-wrapper.c
>> @@ -98,6 +98,9 @@ static char *predef_args[] = {
>>  #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
>>  	"-EB",
>>  #endif
>> +#ifdef BR2_REPRODUCIBLE
>> +    "-Wl,--build-id=none",
> 
> Actually, I would have preferred that we do pass a reproducible value
> instead of none, probably something based on SOURCE_DATE_EPOCH for
> eaxmple:
> 
>     #ifdef BR2_BUILD_ID
>         "-Wl,--build-id=" BR2_BUILD_ID,
>     #endif

 That would break the meaning of build-id. build-id uniquely identifies that
specific file. It is expected that if build-ids are identical, the relevant
parts of the ELF file (i.e. excluding debug info, notes, whatnot) are the same.
Setting all build-ids to the same value would completely defeat its purpose, so
then it's better to just remove it.

 Regards,
 Arnout


> 
> And then, below....
> 
>> +#endif
>>  #ifdef BR_ADDITIONAL_CFLAGS
>>  	BR_ADDITIONAL_CFLAGS
>>  #endif
>> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
>> index 970bde76a0..21fc08f3ee 100644
>> --- a/toolchain/toolchain-wrapper.mk
>> +++ b/toolchain/toolchain-wrapper.mk
>> @@ -59,6 +59,10 @@ else ifeq ($(BR2_RELRO_FULL),y)
>>  TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
>>  endif
>>  
>> +ifeq ($(BR2_REPRODUCIBLE),y)
>> +TOOLCHAIN_WRAPPER_ARGS += -DBR2_REPRODUCIBLE
> 
> ... here, you'd set something like:
> 
>     ifeq ($(BR2_REPRODUCIBLE),y)
>     TOOLCHAIN_WRAPPER_ARGS += -DBR2_BUILD_ID="$(BR2_BUILD_ID)"
>     endif
> 
> and then in the main Makefile, in the BR2_REPRODUCIBLE condition (lines
> 518 and following), you'd need something like:
> 
>     ifeq ($(BR2_REPRODUCIBLE),y)
>     [...]
>     BR2_BUILD_ID = $(shell echo $(SOURCE_DATE_EPOCH) |sha256sum |cut -d ' ' -f 1)
>     endif
> 
> Note: as per the docs, build-id can be any hex-string.
> 
> But before re-sending, please wait for feedback from others.
> 
> Regards,
> Yann E. MORIN.
> 
>> +endif
>> +
>>  define TOOLCHAIN_WRAPPER_BUILD
>>  	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
>>  		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
>> -- 
>> 2.22.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
