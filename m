From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Jun 2021 23:15:03 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/zstd: Add option for cli
 binary
In-Reply-To: <CADYdroPnDVLtebqbg3CshBxyQmTsNCOJzZ_h4uyt4Y8sH04aeg@mail.gmail.com>
References: <20210525172652.821351-1-nolange79@gmail.com>
 <20210525172652.821351-5-nolange79@gmail.com>
 <CAAXf6LUvCxZ_o2T0puJZ8ybDOyh20303-tXWLsgh3HNqt_OvrQ@mail.gmail.com>
 <CADYdroPhUpEKwZhKWH7kw8VjDQxN5yXiRrS3CXMP59Dzj4dvLg@mail.gmail.com>
 <1c5020ee-d779-2c8d-e6ea-2bc6e7bd2d9f@mind.be>
 <CADYdroPnDVLtebqbg3CshBxyQmTsNCOJzZ_h4uyt4Y8sH04aeg@mail.gmail.com>
Message-ID: <d8b91d45-c58b-b8bd-394c-87fac09e385e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/06/2021 23:47, Norbert Lange wrote:
> Am Mo., 14. Juni 2021 um 22:20 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
>>
>>
>>
>> On 01/06/2021 11:20, Norbert Lange wrote:
>>> Am Mo., 31. Mai 2021 um 17:02 Uhr schrieb Thomas De Schampheleire
>>> <patrickdepinguin@gmail.com>:
>>>>
[snip]
>>>> In fact, I even wonder if it is needed to provide the PROG_DEFAULT at
>>>> all. If shared libraries are supported, I see no reason why one would
>>>> like a static version of the binary.
>>>
>>> upstream treats DSO and programs separately, the static binary could
>>> have some more flags not available for DSO which seem to be considered
>>> less configurable.
>>
>>  I looked at the source and simply see no way how this is even possible - the
>> command line argument parsing is entirely in the source files in the program
>> directory, and there are no different -D options for zstd-dll...
>>
>>> Some time ago I had to use the static library cause some features
>>> where only available there.
>>
>>  Maybe that was in the past and is no longer the case?
> 
> Its still the case, see lib/README.md and the macro ZSTD_STATIC_LINKING_ONLY,
> probably less than some time ago.

 That's for the static library. The programs always define
ZSTD_STATIC_LINKING_ONLY, even when building zstd-dll. Huh, I wonder how that
even works...


> The statically program build could be using those extra features too.

 They *are* using those extra features, so I'm not sure how the dll thing works
even... Maybe they just use inline functions or something like that.



[snip]
>>  However, wouldn't it be more logical to do
>>
>>        { [ ! -e $(@D)/programs/zstd ] && \
> 
> That would fail and stop the build if zstd exists (which is the case
> for zstd-release and zstd-dll but not for zstd-small,
> zstd-decompress).

 Ah, yes, I knew there was a reason why I prefer if ...; then over ... ||

> ie. the build either creates $(@D)/programs/zstd or
> $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET)
> 
> The code that correctly succeeds
> when $(@D)/programs/zstd exists or a link to $(ZSTD_BUILD_PROG_TARGET)
> can be made is:
> 
> [ ! -e $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) ] || \
>   ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd
> 
> or
> 
> [ -e $(@D)/programs/zstd ] || \
>   ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd

 Or

	if [ ! -e $(@D)/programs/zstd ]; then \
		ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd; \
	fi


[snip]
>>  So in conclusion, I think there should be just one config option
>> BR2_PACKAGE_ZSTD_PROG_FULL (default y) which builds zstd-dll if !static and
>> zstd-release if static.
> 
> hmm, so then we don't need a config?
> I mean zstd-small only has an advantage if no libzstd is used
> (zstd-dll is smaller). At least as it it now,

 Good point. Your v3 is a lot simpler :-)


 Regards,
 Arnout


> perhaps config options with some macros from lib/README.md would make
> more sense...
> 
>>
>>
>>>
>>> Norbert
>>> (Waiting for some more feedback and possibly upstreaming  part of the
>>> series before rerolling)
>>
>>  Good plan :-)
> 
> Procrastination is a super-power.
> 
> Norbert
> 
>>
>>
>>  Regards,
>>  Arnout
>>
