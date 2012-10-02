From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 2 Oct 2012 19:50:08 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for
	proprietary packages
In-Reply-To: <506AEF12.5080906@lucaceresoli.net>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834801-2672-1-git-send-email-rbraun@sceen.net>
 <20120928142314.4810033e@skate>
 <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
 <20120928190526.79db5cde@skate>
 <CAAXf6LVi1SKx9ZTDuROYxkP=r62fr=SpMnNxYc-Q=_bz+7Snsg@mail.gmail.com>
 <5068558E.4070005@mind.be> <506AEF12.5080906@lucaceresoli.net>
Message-ID: <CAAXf6LWob8fHhJSAF2XgyHCn_nHkD+3U_-d0D7P4fFHAgHYT_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, all,

On Tue, Oct 2, 2012 at 3:41 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Arnout Vandecappelle wrote:
>>
>> On 28/09/12 20:52, Thomas De Schampheleire wrote:
>>>
>>>
>>> Op 28 sep. 2012 19:05 schreef "Thomas Petazzoni"
>>> <thomas.petazzoni@free-electrons.com
>>> <mailto:thomas.petazzoni@free-electrons.com>> het volgende:
>>>>
>>>>
>>>>  Thomas,
>>>>
>>>>  On Fri, 28 Sep 2012 18:40:04 +0200, Thomas De Schampheleire wrote:
>>>>
>>>>  > Additionally, it would be nice to get some context. Why do you need
>>>> this?
>>>>  > What its the use case?
>>>>  >
>>>>  > The proprietary packages are not in the current legal info, precisely
>>>>  > because you wouldn't distribute them.
>>>>  > If you have a package that you distribute under a non open-source
>>>> license,
>>>>  > I think it makes more sense to provide a real name to the license.
>>>>
>>>>  There are things like firmware, or DSP blobs or other stuff that are
>>>>  just provided in binary form, but their license allows free
>>>>  redistribution. Should we mark those as PROPRIETARY, or should we have
>>>>  a different license name for those?
>>>>
>>>>  Basically, the context is the intel-microcode package, which bundles a
>>>>  binary-only firmware for some Intel hardware. Which license
>>>>  informations should we attach to it?
>>>
>>>
>>> I think we need a specific category for those packages that are not
>>> intended for distribution. That is, when you
>>> generate the legal info, these packages are not included.
>>>
>>> Next to that, I can understand that there is another category of
>>> 'packages' that may be proprietary, but are intended
>>> for redistribution. I think we should keep this separate.
>>
>>
>>  Agreed.
>>
>>> Now, whether we use the name 'proprietary' for the first or second
>>> category is an open question.
>>
>>
>>  The word "proprietary" implies that it's not for redistribution. [1]
>> Something like 'Intel microcode license' would be appropriate however.
>>
>>  Two packages should only use the same license name if they have the same
>> terms of use and redistribution (although the exact wording or the exact
>> conditions may be different, cfr. various BSD-3c versions or exceptions in
>> GPLv2 licenses).
>>
>>  If we want to make it explicit that this is not an open source package,
>> we
>> could make it 'Intel microcode license (non-free)'.
>
>
> The current legal-info implementation is based on the assumption that
> Buildroot
> is used to build the root fs for an embedded device, for which packages can
> be
> divided in two broad categories:
>  * open-source packages that are publicly available, whose source code can
> or
>    must be redistributed;
>  * packages for which copying rights are reserved and the source is not
>    available in the public; these packages are often developed by (or for)
> the
>    device manufacturer and are kept proprietary as part of the device
>    industrial secret.
>
> All packages in the second category a marked as _LICENSE = PROPRIETARY,
> which
> means a) that they're not freely licensed and b) that the tarball will not
> be
> saved by Buildroot. This clearly prevents to specify in better detail the
> license of these packages.
>
> This is a short path I took based on the above assumptions, but it is not
> correct is all cases.
>
> intel-microcode is clearly not fitting any of the two categories: we want to
> describe its license, but we are not allowed to redistribute it freely, as
> the license text reported from Richard seems to signify.
>
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
>  Of course this would make package files more verbose for non-redistributed
> packages, but they are a minor part so it is probably not a problem.
>
> What do people think about such a solution?

I think it is a clean and suitable solution for this problem.

>
> Another solution would be to totally ignore the problem because it is
> affecting very few packages. But this would prevent Buildroot to provide
> intel-microcode in a "legally safe" way.
>

Best regards,
Thomas
