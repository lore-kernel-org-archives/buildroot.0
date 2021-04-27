From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 27 Apr 2021 11:32:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <33b0e1b6-513f-d721-4fb5-7dca4a0f7601@mind.be>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <c5b1b792-4ac6-7452-eb36-8c8916413bf0@gmail.com>
 <a5e2b86e-834a-6134-03c8-e961197eb37d@mind.be>
 <50a8821f-07df-fb84-8dbf-90e17b3fe9b3@gmail.com>
 <33b0e1b6-513f-d721-4fb5-7dca4a0f7601@mind.be>
Message-ID: <09499a98-50fa-171f-ced9-8455db23ccac@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/04/2021 ? 10:44, Arnout Vandecappelle a ?crit?:
> 
> 
> On 27/04/2021 10:37, Romain Naour wrote:
>> Hi Arnout,
>>
>> Le 27/04/2021 ? 09:34, Arnout Vandecappelle a ?crit?:
>>>
>>>
>>> On 26/04/2021 23:19, Romain Naour wrote:
>>>> Hello Arnout,
>>>>
>>>> Le 26/04/2021 ? 21:36, Arnout Vandecappelle a ?crit?:
>>>>>
>>>>>
>>>>> On 26/04/2021 12:10, Romain Naour wrote:
>>>>> [snip]
>>>>>>  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
>>>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
>>>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>>>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)
>>>>>
>>>>>  Now you're messing with these packages, maybe you can take the opportunity to
>>>>> get rid of the versioned subdirectory. That's a leftover from when we had
>>>>> version selection for glibc.
>>>>
>>>> See Yann's reply.
>>>>
>>>> I'm not a big fan of not having the glibc version choice. I would prefer having
>>>> the choice between the latest version (bleeding-edge) and the previous one
>>>> (stable). Bumping Glibc introduce some breaking change that need to be fixed in
>>>> several packages.
>>>
>>>  Although I'm not a fan of version choice at all, there may indeed be a point in
>>> having a choice here, because of all the breakage that glibc introduces.
>>>
>>>  There are a couple of caveats though:
>>>
>>> - It actually makes our work harder, because we *still* have to fix the
>>> breakage, and we have a harder time detecting it (because less autobuilders will
>>> be using the new glibc version).
>>
>> Indeed.
>>
>>> - The "stable" version isn't really stable in the usual sense: upstream glibc
>>> doesn't maintain it - so that means we have to do it ourselves. In practice, I
>>> think that means we should track either Debian or SUSE glibc (Redhat is a bit
>>> *too* stable IMHO).
>>
>> Glibc project maintain several "stable" version, so we don't have to maintain
>> previous glibc version ourselves.
>>
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.33/master
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.32/master
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.31/master
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.30/master
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.29/master
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/release/2.28/master
> 
>  Oh, my bad, I really thought they abandoned the 2.31 branch once 2.33 was released.

Glibc still maintain those branches but there is no point releases

https://lwn.net/Articles/736429/

> 
>  That takes away a major argument against version selection.
> 
>>
>> I would use such upstream stable branches instead of tracking glibc distribution
>> packages.
>>
>>> - Usually the glibc fixes are backward compatible, but if there's ever a fix
>>> that breaks older glibc, then we're in a pickle... That said, we already have
>>> that problem with external toolchains, we just ignore it.
>>>
>>>  So the only reason to re-introduce the version choice would be for users that
>>> don't want to fix their proprietary packages but do want to update Buildroot.
>>> But then, "stable" would have to stay the same for longer than a single LTS
>>> cycle (in the LTS we already don't update glibc). So I think it's a lot of
>>> effort for little added value in the end.
>>
>> I see another reason, while bumping glibc we have to make sure that most of
>> issues related to the bump has been fixed in packages (or glibc itself) before
>> the next Buildroot release. Having 3 months between releases seems to me short.
> 
>  Again: having a version selection doesn't help us here, because we need those
> issues to be fixed for the latest version anyway.

Sure.

> 
>  The only thing we can do with the version selection is that we can make the
> broken packages depend on !BR2_GLIBC_AT_LEAST_2_32.
> 
>  (Note that the implication is that we need external toolchain version symbols
> and _AT_LEAST symbols for all glibc versions, like we have for GCC).

We need to be agree with all other maintainers if we want to handle two glibc
versions. Or make the final decision to only support one glibc version.

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
>>
>>>
>>>> For toolchain-builder project, this means that the stable and bleeding-edge
>>>> toolchain use the same glibc version, unlike for other toolchain elements.
>>>
>>>  For musl and uClibc we don't have a version choice either.
>>
>> Indeed but Glibc development produce more commits between releases than musl or
>> uClibc, and only Glibc provide stable branches.
> 
> [snip]
> 
