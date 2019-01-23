From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Jan 2019 15:17:55 +0100
Subject: [Buildroot] [PATCH] support/scripts/apply-patches: use "git
 apply" as a fallback when applying patches
In-Reply-To: <875zutvvf2.fsf@tarshish>
References: <20190110203004.9812-1-thomas.petazzoni@bootlin.com>
 <87wonbhnny.fsf@tarshish> <20190111091552.72fba6ad@windsurf>
 <875zutvvf2.fsf@tarshish>
Message-ID: <55a5605d-5773-16d5-ef79-a37dac3c009a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2019 09:00, Baruch Siach wrote:
> 
> On Fri, Jan 11 2019, Thomas Petazzoni wrote:
>> On Fri, 11 Jan 2019 05:35:13 +0200, Baruch Siach wrote:
>>
>>>> Switching everybody to unconditionally use "git apply" seems a bit
>>>> risky, so instead we take a different route: if applying the patch
>>>> with "patch" fails, then we try with "git apply".  
>>>
>>> This makes git a host dependency. Should we add host-git, or list git
>>> with host requirements?
>>
>> It does not really make git a mandatory dependency. Indeed, "git apply"
>> is only tried if "patch" fails.
>>
>> So, before my patch, if a patch failed to apply because "patch" failed,
>> then it aborted the build.
>>
>> With my patch, if a patch fails to apply because "patch" failed, then
>> we will try "git apply". If "git apply" is not available, it will fail,
>> just like it used to be.
>>
>> So my proposal doesn't *require* git, it only tries harder to apply
>> patches by using "git apply" if available.
>>
>> Setups that used to work today without "git" installed will continue to
>> work with no change.
> 
> With this patch a package selection change that works on the developer's
> machine where git is installed, would fail on the production build
> machine that is missing git. Is there a clear error message in case of
> patch failure?

 I'm with Baruch here. The reason to have this feature is exactly to have the
possibility to have patches that modify binaries or that modify symlinks. Thus,
it becomes likely that someone will submit such a patch. It will work for the
developer, and it will also work in the autobuilders since all of them have git
installed (otherwise they wouldn't be able to clone the Buildroot repo). Thus,
any such patch will go unnoticed.

 I don't think it hurts to force git as a dependency.

 Regards,
 Arnout
