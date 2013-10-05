From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 05 Oct 2013 23:07:54 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
Message-ID: <52507FAA.2030300@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas De Schampheleire wrote:

> Hi Luca,
>
> On Wed, Oct 2, 2013 at 6:33 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Dear ThomasDe Schampheleire,
>>
>> thanksfor the comments and detailed analysis.
> side note: I'm seeing some weird lack of spaces throughout the e-mail,
> for example 'thanksfor', 'ThomasDe'. Is this a compression strategy?

Of course! I plan to xz my future mail messages, be prepared th that!

No, just joking. I noticed it as well, but I'm sure i did not make so
many mistakes when typing.I'm afraid I guess it's a Thunderbird bug.

>> Find my comments below.
>>
>>
>> Thomas Petazzoni wrote:
>>> Dear Thomas De Schampheleire,
>>>
>>> (Skipping items 2 and 3, since they have been solved apparently.)
>>>
>>> On Wed, 2 Oct 2013 16:06:13 +0200, Thomas De Schampheleire wrote:
>>>
>>>> 1. there is no longer a provision to 'hide' proprietary packages from
>>>> the manifest, and not get warnings on them. Previously you could mark
>>>> a package as license: PROPRIETARY, but this has been removed. I still
>>>> think that a similar feature is useful.
>>> <pkg>_REDISTRIBUTE = NO
>>>
>>> is what you're looking for, no?
>>
>> No,<pkg>_REDISTRIBUTEonly prevents the source tarballfrom beingcopied.
>>
>> At the beginning we had a magic value:
>>    FOO_LICENSE = PROPRIETARY
>> which would prevent /any/ info from being generated for FOO.
>>
>> Then we preferred to separatethingsfor license declaration
>> (_LICENSE*)and source tarball copying trigger (_REDISTRIBUTE).
>> I still think this change was good and it cleaned up a lot the code,
>> so I wonldn't step back.
> I re-read the original thread, specifically your answer to it:
> http://lists.busybox.net/pipermail/buildroot/2012-October/059402.html
>
> Here is an excerpt:
> ---------------------
> A clean solution is probably to let the _LICENSE do its work, i.e. simply
> describe the license, and add a new _REDISTRUBUTE parameter (defaulting to
> YES), to specify if the tarball must be copied or not.
> Defining the license and choosing whether or not to redistribute would
> become technically independent, which is more correct.
>
> Examples:
>
> MYAPP_LICENSE = PROPRIETARY
> would become
> MYAPP_LICENSE = PROPRIETARY
> MYAPP_REDISTRIBUTE = NO
> or
> MYAPP_LICENSE = Copyright (C) 2012 My Company # just an idea
> MYAPP_REDISTRIBUTE = NO
>
> INTEL_MICROCODE_LICENSE = PROPRIETARY
> would become
> INTEL_MICROCODE_LICENSE = Intel microcode license
> INTEL_MICROCODE_REDISTRIBUTE = NO
> ---------------------
>
> These examples would mean that PROPRIETARY is still recognized as
> magic value, but this does not match with the current code in

No, the meaning of my quoted text is that there is no magic word
anymore. "PROPRIETARY" is treated just like "BSD-3c" or "Fuzzy License".
This what the current BR code does as well.

> buildroot. The examples make a lot of sense to me, and I would be in
> favor in changing the code towards this: recognize PROPRIETARY and not
> save any legal info in this case (and ignore REDISTRIBUTE). At the
> same time, the microcode situation can still use REDISTRIBUTE=NO but
> it needs a license that is different than PROPRIETARY.
> This is currently not ok for b43-firmware and owl-linux, but it is for
> the other packages that set REDISTRIBUTE to NO (libfslcodec,
> libfslparser, libfslvpuwrap, ux500-firmware).
>
>
>> Three ideas pop up in my mind.
>>
>> Option 1:introduce a new tag such as:
>>    FOO_SAVE_LEGAL_INFO = {YES|NO}
>> defaulting to YES.If NO, nothing is saved for FOO: no manifest,
>> no licenses.txt, no source tarball (and FOO_REDISTRIBUTE ignored).
>>
>> This somehow mimics the old behaviour, but with a new variable in lieu
>> of a magic value.
>>
>> option 2, slightly different:
>>    FOO_LIST_IN_MANIFEST= {YES|NO}
>> defaulting to YES.If NO, nothing is saved for the package in manifest
>> and licenses.txt, but FOO_REDISTRIBUTE tells whether the source tarball
>> is to be saved.
>>
>> The latter mode would keep things separate and orthogonal, which is
>> cleaner. But it's probably infrequent that people want to save one part
>> of the info and not the other.
>>
>> option 3, a mix the other two:
>>    FOO_SAVE_LEGAL_INFO = {YES|NO}, default YES
>> FOO_REDISTRIBUTE= {YES|NO}, default $(FOO_SAVE_LEGAL_INFO)
>>
>> Meaning:
>>   * by default FOO_SAVE_LEGAL_INFO rules it all, and we do the same thing
>>     for manifest+licenses.txt and source tarball copying (save all or
>>     save nothing);
>>   * the two can be forced to behave differently by defining
>>     FOO_REDISTRIBUTE with a value opposite to FOO_SAVE_LEGAL_INFO.
>>
>> Comments?
> As said above, my original though would be to reintroduce PROPRIETARY.

I do not like to have a BR variable whose meaning can be either a magic
word "PROPRIETARY", that BR handles in a specific way, or a generic string,
that's just a text to carry around for BR.
Hence my proposal of splitting the whole thing in two variables:
FOO_SAVE_LEGAL_INFO = {YES|NO} and FOO_LICENSE = <plain text>. They have
two different meanings.

But this is just my opinion.

>
>>
>>>> 4. Suppose that a package has no license files and explicitly declares
>>>> this with FOO_LICENSE_FILES =
>>>> In this case, you will still get a warning: "cannot save license
>>>> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
>>>> I think it would be better to distinghuish the situation 'empty' and
>>>> 'not defined'.
>>> Agreed. However, in make, doing FOOBAR = or not defining FOOBAR leads
>>> to the same thing: FOOBAR is an empty variable. So we have to decide on
>>> an explicit magic value to use when no license files are available (and
>>> ensure this magic value is never going to be used for the name of a
>>> license file).
>>>
>>> FOO_LICENSE_FILES = N/A
>>> FOO_LICENSE_FILES = not-available
>>> FOO_LICENSE_FILES = none
>>> FOO_LICENSE_FILES = NONE
>>
>> It's not clear to me whether this is the correct way to address the problem
>> of packages having license file.
>>
>> I think usually that means they /do/ have a license, but it's only written
>> in the top lines of source files and/or in a README containing other stuff.
>> IOW, the license text is there, but we currently have no way to extract it.
> This is also how I see it.
>
>> This topic was discussed with the first round of implementation of the
>> legal-info stuff, sometime around FOSDEM 2012. At that time we concluded
>> we could leave out this quite rare case.
>>
>> Unfortunately they are not so rare, so should we invent something now to
>> handle them? Is it worth the effort?
>>
>> Some options are:
>>   * manually copy the license snippet in package/foo/COPYING and set
>>     FOO_LICENSE_FILES = $(TOPDIR)/package/foo/COPYING(just an idea,
>>     may not actually work);this would require checking if our file is in
>>     line with upstream at each version bump;
>>   * writing in FOO_LICENSE_FILES some instruction for BR to go in the
>>     sources and grab the snippet; say:
>>       FOO_LICENSE_FILES = src/foo-main.c at 20+14
>>     meaning: pick 14 lines starting at line 20 from src/foo-main.c and
>>     that's your license text;
>>   * do nothing.
>>
>> I'm not super-happy with any of these, so I'm very open to discussionand
>> other ideas.
> To try and extract the license in buildroot is very fragile, and
> pretty complex too.
> Ideally upstream should make sure there is an appropriate license text
> (at least for GPL this is required).
> But as it is not realistic to expect all packages to comply with this,

I fully agree.

> I think a magic value for LICENSE_FILES as ThomasP suggested
> (none/NONE) is sensible. This does not conflict with the definition of
> a license as specified in LICENSE.

"none" may either mean there is no license text (as Arnout noticed this 
should
be fairly rare, but who knows) or that the license text exists, but BR 
cannot
produce it as a file. We probably should these two cases visible in the
manifest.


-- 
Luca
