From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2019 23:32:48 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper: explicitly set
 Build ID to none if BR2_REPRODUCIBLE
In-Reply-To: <20190816211240.GG27959@scaer>
References: <20190816170345.19480-1-itsatharva@gmail.com>
 <20190816211240.GG27959@scaer>
Message-ID: <e934c868-2f38-81fb-9157-83f836c7cdde@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/08/2019 23:12, Yann E. MORIN wrote:
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
> One thing I forgot in my previous review: --build-id has been supported
> only since binutils 2.18, released 12 years ago now (20017-08-28).
> 
> I'm not sure if some oldish toolchains are still using this version, and
> if so, whether we want to support those or not...

 We don't really have anything to deal with old binutils. Similar issues have
popped up in the past, and we always considered it long enough ago to swipe it
under the carpet.

 The oldest binutils we have in our external toolchains is 2.24.x, so I think
we're good.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
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
