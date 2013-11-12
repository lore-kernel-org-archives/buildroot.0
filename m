From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 14:42:04 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina> <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
Message-ID: <5282302C.7000005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 12:32, Thomas De Schampheleire wrote:
> Hi Thomas,
>
> On Tue, Nov 12, 2013 at 12:09 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Tue, 12 Nov 2013 09:56:37 +0100, Thomas De Schampheleire wrote:
>>
>>>>   I think it's a better idea to choose a new name - if only to help
>>>> people who are using this variable in custom packages. Or better
>>>> yet, remove it completely - it's anyway not used anymore.
>>>
>>> The only remaining place is in the foo-patch block, to get the
>>> location of patches for that package.
>>> That is outside the inner-generic-package, so we cannot use $(4)
>>> anymore. How do you propose to solve that?
>>
>> Currently:
>>
>>   <foo>_DIR => build directory
>>
>>   <foo>_DIR_PREFIX => prefix of the package directory in Buildroot
>>                       sources
>>
>>   <foo>_DL_DIR => location of the package download directory, for
>>                   git/cvs downloads (apparently not used consistently)
>>
>> I think it would make a lot more sense to have:
>>
>>   <foo>_DIR => points to the package directory in Buildroot sources, e.g
>>                package/busybox/ for Busybox. This would allow packages
>>                to easily reference their own directory, to get access to
>>                configuration files and others, instead of having to know
>>                they are located in package/busybox/. This could also be
>>                used in the patching step instead of the DIR_PREFIX thing.

  As I mentioned before, I would prefer to not reuse the same name with a 
different meaning, because it may confuse users who have custom 
modifications that rely on that variable. So instead I'd remove the 
<foo>_DIR completely (so that it's pretty clear that this variable is 
empty if anybody still uses it), and instead use e.g. <foo>_BR_DIR for 
this purpose.

>
> Suppose we change this definition, do you suggest to change all .mk
> files that currently reference package/foo to use FOO_DIR instead?
> While FOO_DIR is useful for the infrastructure, like in the patching
> case, I don't think it is necessary to change a file
> package/foo/foo.mk to remove the hardcoded package/foo inside the
> file. The likelihood of files being moved is very small, plus it will
> be very hard to enforce consistent usage of FOO_DIR in favor of
> package/foo in this case.

  How is that hard?

  I would do what we usually do for new policy: enforce it for new 
packages, but leave it alone for existing packages until someone grows 
tired of the inconsistency and sends a global fixup patch. That also has 
the advantage that we can still change our mind on the short term without 
needing to change things all over the place again.

  That said, I think that using package/foo in the .mk file is a lot 
clearer than $(FOO_XXXDIR).

>
>>
>>   <foo>_BUILDDIR => points to the package build directory in $(BUILD_DIR)
>>
>>   <foo>_SRCDIR => points to the package source directory (currently
>>                   identical to <foo>_BUILDDIR, would change when we
>>                   introduce OOT build for packages). Actually, more than
>>                   half of the patch set I have to introduce OOT is about
>>                   using <foo>_SRCDIR vs <foo>_BUILDDIR in the right
>>                   places.
>>
>>   <foo>_DL_DIR => same as before.
>
> In general, I think the new variable names make sense.

  +1.

  ThomasP, perhaps you can resubmit the patches for <foo>_SRCDIR vs 
<foo>_BUILDDIR, since they can be applied independently of OOT.

  Regards,
  Arnout

>
> Best regards,
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
