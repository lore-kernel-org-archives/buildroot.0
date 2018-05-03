From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 3 May 2018 23:34:22 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add tainting support
In-Reply-To: <20180428185332.7d805102@windsurf>
References: <1520326085-18337-1-git-send-email-angelo@amarulasolutions.com>
 <1520326085-18337-2-git-send-email-angelo@amarulasolutions.com>
 <20180428185332.7d805102@windsurf>
Message-ID: <CA+TH9VnVMba-qZi9n8yDo8WYjXpAS5O1XQZGhzQgzrKjinLr3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-04-28 18:53 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Tue,  6 Mar 2018 09:48:04 +0100, Angelo Compagnucci wrote:
>
>> +# Check here if there are packages declaring they harm
>> +# the reproducibility of the build
>> +.PHONY: check-tainted
>> +check-tainted:
>> +ifneq ($(BR2_REPRODUCIBLE),)
>> +ifneq ($(BR2_TAINTED_BY),)
>
> I don't think BR2_REPRODUCIBLE has anything to do with this 'tainting'
> thing.
>
> BR2_REPRODUCIBLE is about getting binary identical results given a
> Buildroot configuration. But even with BR2_REPRODUCIBLE disabled,
> Buildroot aims at building the same source code, which the nodejs npm
> stuff does not allow to do. So the 'tainting' happens regardless of
> whether BR2_REPRODUCIBLE=y or not.
>
> If you remove the BR2_REPRODUCIBLE condition, then the Buildroot build
> would always fail as soon as one package taints the build, so I'm not
> sure a hard failure is a good approach here. Perhaps just a warning at
> the end of the build ?

Fair enough, will do.

>
>>  .PHONY: target-post-image
>> -target-post-image: $(TARGETS_ROOTFS) target-finalize
>> +target-post-image: check-tainted $(TARGETS_ROOTFS) target-finalize
>>       @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>>               $(call MESSAGE,"Executing post-image script $(s)"); \
>>               $(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>> @@ -1063,6 +1074,7 @@ help:
>>       @echo '  source                 - download all sources needed for offline-build'
>>       @echo '  external-deps          - list external packages used'
>>       @echo '  legal-info             - generate info about license compliance'
>> +     @echo '  check-tainted          - check if any selected package harms build reproducibility'
>
> Not sure it is really useful to make this a first class target,
> documented in the help text. A warning at the end of the build is
> probably enough.

I think this should be kept especially for CI systems in which it's
useful to know if a user introduced something that harms the build.

> Or maybe simply mention it as a Config.in comment ?
>
> comment "WARNING: nodejs modules will make your build non reproducible!"
>         depends on BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
>
>>       @echo '  printvars              - dump all the internal variables'
>>       @echo
>>       @echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index a2a12e7..e643ecf 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -556,6 +556,10 @@ ifndef $(2)_REDISTRIBUTE
>>   endif
>>  endif
>>
>> +ifdef $(2)_TAINTS
>> + BR2_TAINTED_BY+=$$($(2)_RAWNAME)
>> +endif
>
> I think "TAINTS" is very vague. Unfortunately, I don't have a good
> proposal. In addition, it's not only about tainting the build in terms
> of reproducibility, but also about the lack of integration with the
> download and legal infrastructures.

Yes, it's not the best name probably, but the concept is here.

>
> I'm not sure what a good name for this would be. I've added Arnout in
> Cc, he often has interesting (and creative) ideas on such topics.
>
>> +# Save a legal warning if tainted
>> +ifneq ($$(call qstrip,$$($(2)_TAINTS)),)
>
> Implementation detail: you always use the construct:
>
> ifneq ($(var),)
>
> which is negative logic. Please use:
>
> ifeq ($(var),YES)
>
> instead. Of course, unless the variable really is empty vs. non-empty,
> but that isn't the case here.
>
> Also, your patch series was sent at a time where patchwork was missing
> some patches, so your PATCH 2/2 was not recorded. It would be useful if
> you could resend this patch series.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
