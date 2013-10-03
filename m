From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 18:40:02 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
Message-ID: <524D9DE2.7090509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/13 10:24, Thomas De Schampheleire wrote:
> Hi Luca,
>
> On Wed, Oct 2, 2013 at 6:33 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Thomas Petazzoni wrote:
>>>
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
>>>
>>> <pkg>_REDISTRIBUTE = NO
>>>
>>> is what you're looking for, no?
>>
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
>
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
> buildroot.

  Yes it does. In the example, only MYAPP_LICENSE is still PROPRIETARY 
and it doesn't carry any meaning anymore.

> The examples make a lot of sense to me, and I would be in
> favor in changing the code towards this: recognize PROPRIETARY and not
> save any legal info in this case (and ignore REDISTRIBUTE).

  +1 to this. Perhaps PROPRIETARY isn't the best name, though, but I 
can't think of anything better.

> At the
> same time, the microcode situation can still use REDISTRIBUTE=NO but
> it needs a license that is different than PROPRIETARY.
> This is currently not ok for b43-firmware and owl-linux, but it is for
> the other packages that set REDISTRIBUTE to NO (libfslcodec,
> libfslparser, libfslvpuwrap, ux500-firmware).

  gst-fsl-plugins and on2-8170-libs set PROPRIETARY as well.

  Note that for b43-firmware, the license is not specified, and for 
owl-linux, the "license" isn't a license but only a warranty disclaimer. 
So for these, perhaps a better text is something like "Do not use unless 
you are licensed by H&D Wireless AB".

[snip]

>>>> 4. Suppose that a package has no license files and explicitly declares
>>>> this with FOO_LICENSE_FILES =
>>>> In this case, you will still get a warning: "cannot save license
>>>> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
>>>> I think it would be better to distinghuish the situation 'empty' and
>>>> 'not defined'.
>>>
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
>>
>> It's not clear to me whether this is the correct way to address the problem
>> of packages having license file.
>>
>> I think usually that means they /do/ have a license, but it's only written
>> in the top lines of source files and/or in a README containing other stuff.
>> IOW, the license text is there, but we currently have no way to extract it.
>
> This is also how I see it.

  So in this situation, the proper way to deal with it is to issue a 
warning, right? Which is exactly what the current code does.

  I can think of only one situation (except for the PROPRIETARY case) 
where no license text is provided and we don't need to be warned of this, 
and that is when it is public domain. But maybe that's just a limit of my 
imagination :-).

  That said, it would be good if we would just error out when a license 
is defined but no license files are provided. Now we check for that 
during review (and require an explicit comment if no license file 
exists), but it's of course even better if that can be done during 
autobuilder tests. As to the naming, I think N/A is very good because the 
chance of having an N directory with an A file is very small.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
