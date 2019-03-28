From: Andreas Naumann <dev@andin.de>
Date: Thu, 28 Mar 2019 10:50:52 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <2d6cbad4-6270-6d2b-c4a6-863d78591e7c@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
 <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
 <20190326081814.0109d351@windsurf>
 <42086765-6c53-b726-f09e-184209193b0d@mind.be>
 <2b455f83-78f6-432c-eb27-ceece04209c8@andin.de>
 <2d6cbad4-6270-6d2b-c4a6-863d78591e7c@mind.be>
Message-ID: <624e302a-22a4-4921-81a5-eef5a0ddf07f@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 28.03.19 um 09:58 schrieb Arnout Vandecappelle:
> 
> 
> On 27/03/2019 23:10, Andreas Naumann wrote:
>> 
>> 
>> Am 26.03.19 um 11:09 schrieb Arnout Vandecappelle:
>>> 
>>> 
>>> On 26/03/2019 08:18, Thomas Petazzoni wrote:
>>>> Hello,
>>>> 
>>>> On Tue, 26 Mar 2019 00:16:47 +0100 Arnout Vandecappelle 
>>>> <arnout@mind.be> wrote:
>>>> 
>>>>>> This is done by re-running the install step of the qmake 
>>>>>> generated Makefile with the package build directory
>>>>>> prepended (to the staging/host path). Even though this does
>>>>>> create lengthy pathes it allows for easy separation of the
>>>>>> staging files from the host destined files by just omitting
>>>>>> the resulting BUILD_DIR+HOST_DIR path from the following
>>>>>> rsync call to the real target folder.
>>>>> 
>>>>> We have not converged yet on whether this is the right
>>>>> approach. So maybe, in order to move forward, it would be
>>>>> better to split the patch up into a first bit that creates
>>>>> the qmake package but does not define target install steps,
>>>>> then convert the relevant packages to qmake packages, and
>>>>> finally change the qmake infra to do target install and
>>>>> changes all the packages again. It's more work to do it this
>>>>> way, obviously, but it would allow us to already commit part
>>>>> of the series before we have converged on it completely.
>>>> 
>>>> While I understand your idea of splitting things up further in 
>>>> terms of patches, I think we can try to agree on how the
>>>> target installation step should be done and use the approach
>>>> proposed by Andreas to
>>> 
>>> Sure, that's why I said "maybe". It's not a requirement, but it
>>> is also frustrating to respinning a series and seeing no progress
>>> on it. That's why I proposed the option.
>> 
>> Splitting the conversion of each package (and doing this one
>> package at a time?) really seems like a lot work and I dont know if
>> it leads to a nicer history. I propose to split up the infra
>> introduction in two parts (config,build,staging vs target install),
>> but keep the conversion of each package in one patch. Or maybe one
>> patch for the straightforward cases and the rest individually?
> 
> Sounds good to me. As Thomas wrote: you don't have to do it if it's
> too much work.
> 
> IIUC your proposal would be:
> 
> 1. Basic qmake infra 2. Convert all packages to qmake infra (trivial
> because the difficult cases still use custom staging/target install
> commands, you just don't remove them). 3. Add target install support
> to qmake infra 4. Convert all easy packages to target install from
> qmake infra (i.e. just remove the target install commands) 5-N.
> Convert difficult packages.
> 

Actually I meant to not do step 2, but this should be doable as well.
I'll see how it goes.

> I repeat: it would be nicer this way, but if it's take too much time
> to do it, we'll accept it as just two or three patches as well.
> 
> [snip]
>>>>> However, I'm not sure that this is the way we want to go.
>>>>> What is wrong with the pkg-files-list? You said before that
>>>>> it was incorrect, but if that is the case, it should be
>>>>> fixed.
>> 
>> pkg-files-list currently breaks the parallel build. I did send a
>> patch for that. However I suspect the lists might still not be
>> correct because if a package provides a file which already exists
>> it wont be recorded, right?
> 
> It will be recorded twice in that case. And the check-uniq-files
> script checks in the finalize step that this doesn't actually
> happen.

oh i see. I didnt fully understand step_pkg_size_inner.

> 
>> This situation is problematic anyway but currently solved by at
>> least a deterministic package build/install order in which "the
>> last wins". Using the staging pkg-files-list for target install
>> would reverse that to "first package wins". Finally, when building
>> in parallel, this will become a real issue.
> 
> Yes and no. It's not an issue because each package installs in its
> own host/staging/target dirs. It may become an issue when combining
> these dirs from different packages, but that combination is still
> deterministic (it is not done in parallel and the order is fixed with
> sort).

True. Thanks for pointing out.


regards,
Andreas

> 
> But since we agreed to tmpinstall anyway, the point is moot.
> 
> Regards, Arnout
> 
> 
> [snip]
> 
