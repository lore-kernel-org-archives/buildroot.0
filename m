From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Oct 2013 10:24:02 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <524C4AD4.9040902@lucaceresoli.net>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
Message-ID: <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Wed, Oct 2, 2013 at 6:33 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Dear ThomasDe Schampheleire,
>
> thanksfor the comments and detailed analysis.

side note: I'm seeing some weird lack of spaces throughout the e-mail,
for example 'thanksfor', 'ThomasDe'. Is this a compression strategy?

>
> Find my comments below.
>
>
> Thomas Petazzoni wrote:
>>
>> Dear Thomas De Schampheleire,
>>
>> (Skipping items 2 and 3, since they have been solved apparently.)
>>
>> On Wed, 2 Oct 2013 16:06:13 +0200, Thomas De Schampheleire wrote:
>>
>>> 1. there is no longer a provision to 'hide' proprietary packages from
>>> the manifest, and not get warnings on them. Previously you could mark
>>> a package as license: PROPRIETARY, but this has been removed. I still
>>> think that a similar feature is useful.
>>
>> <pkg>_REDISTRIBUTE = NO
>>
>> is what you're looking for, no?
>
>
> No,<pkg>_REDISTRIBUTEonly prevents the source tarballfrom beingcopied.
>
> At the beginning we had a magic value:
>   FOO_LICENSE = PROPRIETARY
> which would prevent /any/ info from being generated for FOO.
>
> Then we preferred to separatethingsfor license declaration
> (_LICENSE*)and source tarball copying trigger (_REDISTRIBUTE).
> I still think this change was good and it cleaned up a lot the code,
> so I wonldn't step back.

I re-read the original thread, specifically your answer to it:
http://lists.busybox.net/pipermail/buildroot/2012-October/059402.html

Here is an excerpt:
---------------------
A clean solution is probably to let the _LICENSE do its work, i.e. simply
describe the license, and add a new _REDISTRUBUTE parameter (defaulting to
YES), to specify if the tarball must be copied or not.
Defining the license and choosing whether or not to redistribute would
become technically independent, which is more correct.

Examples:

MYAPP_LICENSE = PROPRIETARY
would become
MYAPP_LICENSE = PROPRIETARY
MYAPP_REDISTRIBUTE = NO
or
MYAPP_LICENSE = Copyright (C) 2012 My Company # just an idea
MYAPP_REDISTRIBUTE = NO

INTEL_MICROCODE_LICENSE = PROPRIETARY
would become
INTEL_MICROCODE_LICENSE = Intel microcode license
INTEL_MICROCODE_REDISTRIBUTE = NO
---------------------

These examples would mean that PROPRIETARY is still recognized as
magic value, but this does not match with the current code in
buildroot. The examples make a lot of sense to me, and I would be in
favor in changing the code towards this: recognize PROPRIETARY and not
save any legal info in this case (and ignore REDISTRIBUTE). At the
same time, the microcode situation can still use REDISTRIBUTE=NO but
it needs a license that is different than PROPRIETARY.
This is currently not ok for b43-firmware and owl-linux, but it is for
the other packages that set REDISTRIBUTE to NO (libfslcodec,
libfslparser, libfslvpuwrap, ux500-firmware).


>
> Three ideas pop up in my mind.
>
> Option 1:introduce a new tag such as:
>   FOO_SAVE_LEGAL_INFO = {YES|NO}
> defaulting to YES.If NO, nothing is saved for FOO: no manifest,
> no licenses.txt, no source tarball (and FOO_REDISTRIBUTE ignored).
>
> This somehow mimics the old behaviour, but with a new variable in lieu
> of a magic value.
>
> option 2, slightly different:
>   FOO_LIST_IN_MANIFEST= {YES|NO}
> defaulting to YES.If NO, nothing is saved for the package in manifest
> and licenses.txt, but FOO_REDISTRIBUTE tells whether the source tarball
> is to be saved.
>
> The latter mode would keep things separate and orthogonal, which is
> cleaner. But it's probably infrequent that people want to save one part
> of the info and not the other.
>
> option 3, a mix the other two:
>   FOO_SAVE_LEGAL_INFO = {YES|NO}, default YES
> FOO_REDISTRIBUTE= {YES|NO}, default $(FOO_SAVE_LEGAL_INFO)
>
> Meaning:
>  * by default FOO_SAVE_LEGAL_INFO rules it all, and we do the same thing
>    for manifest+licenses.txt and source tarball copying (save all or
>    save nothing);
>  * the two can be forced to behave differently by defining
>    FOO_REDISTRIBUTE with a value opposite to FOO_SAVE_LEGAL_INFO.
>
> Comments?

As said above, my original though would be to reintroduce PROPRIETARY.

>
>
>>> 4. Suppose that a package has no license files and explicitly declares
>>> this with FOO_LICENSE_FILES =
>>> In this case, you will still get a warning: "cannot save license
>>> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
>>> I think it would be better to distinghuish the situation 'empty' and
>>> 'not defined'.
>>
>> Agreed. However, in make, doing FOOBAR = or not defining FOOBAR leads
>> to the same thing: FOOBAR is an empty variable. So we have to decide on
>> an explicit magic value to use when no license files are available (and
>> ensure this magic value is never going to be used for the name of a
>> license file).
>>
>> FOO_LICENSE_FILES = N/A
>> FOO_LICENSE_FILES = not-available
>> FOO_LICENSE_FILES = none
>> FOO_LICENSE_FILES = NONE
>
>
> It's not clear to me whether this is the correct way to address the problem
> of packages having license file.
>
> I think usually that means they /do/ have a license, but it's only written
> in the top lines of source files and/or in a README containing other stuff.
> IOW, the license text is there, but we currently have no way to extract it.

This is also how I see it.

>
> This topic was discussed with the first round of implementation of the
> legal-info stuff, sometime around FOSDEM 2012. At that time we concluded
> we could leave out this quite rare case.
>
> Unfortunately they are not so rare, so should we invent something now to
> handle them? Is it worth the effort?
>
> Some options are:
>  * manually copy the license snippet in package/foo/COPYING and set
>    FOO_LICENSE_FILES = $(TOPDIR)/package/foo/COPYING(just an idea,
>    may not actually work);this would require checking if our file is in
>    line with upstream at each version bump;
>  * writing in FOO_LICENSE_FILES some instruction for BR to go in the
>    sources and grab the snippet; say:
>      FOO_LICENSE_FILES = src/foo-main.c at 20+14
>    meaning: pick 14 lines starting at line 20 from src/foo-main.c and
>    that's your license text;
>  * do nothing.
>
> I'm not super-happy with any of these, so I'm very open to discussionand
> other ideas.

To try and extract the license in buildroot is very fragile, and
pretty complex too.
Ideally upstream should make sure there is an appropriate license text
(at least for GPL this is required).
But as it is not realistic to expect all packages to comply with this,
I think a magic value for LICENSE_FILES as ThomasP suggested
(none/NONE) is sensible. This does not conflict with the definition of
a license as specified in LICENSE.

>
>
>>> 5. the manifest also lists all host packages, like automake, autoconf,
>>> ... while these are not distributed on target. Strictly speaking you
>>> do not have to list these in the customer documentation of a product,
>>> in my interpretation. I find it confusing that both target and host
>>> packages are mixed like that.
>>> Of course, it's probably difficult to change this, because some
>>> packages can be built for host _and_ target, and the legal-info
>>> infrastructure does not know which of these was used for a particular
>>> project.
>>
>> I think we discussed that the legal-info for target and host packages
>> should be separated: either the CSV should mention whether it's used
>> for the target or the host (or both), or there should be two separate
>> CSV files.
>
>
> Yeah, we did.it's on my todo list, but not quite getting close to the
> top ofit...

Isn't it roughly sufficient to change this line in package/pkg-generic.mk:
@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))

to indicate that this is a host or target package, and change
legal-manifest to save to two separate files manifest.csv and
host-manifest.csv ?

Best regards,
Thomas
