From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 17:54:04 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <20130829093809.75fe7e76@skate>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <521534E2.7020606@mind.be> <20130822232633.7ba9b14d@skate>
 <52169E42.2040904@mind.be> <20130823064845.2ec4800d@skate>
 <521E5AB7.1050702@mind.be> <20130829093809.75fe7e76@skate>
Message-ID: <521F6E9C.6070703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 09:38, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 28 Aug 2013 22:16:55 +0200, Arnout Vandecappelle wrote:
>
>>    While testing your patch again, I discovered that "make source" doesn't
>> fetch the glibc source (same for eglibc) because BR2_PACKAGE_EGLIBC is
>> not y. This would be nice to fix still in 2013.08.
>
> Generally, 'make source' is unfortunately a bit broken with the new
> internal toolchain backend based on packages. One of the reason is that
> the 'make source' thing only works for one recursion level of
> dependencies on host packages. I've started working on fixing that, but
> it was more complex than I thought (or alternatively I was too stupid
> to see that there was a simple solution).

  Probably requires an pkg-generic change, like:

$(2)-all-source: $(2)-source $(suffix -source,$($(2)_DEPENDENCIES))


>>> But I guess I
>>> can probably make BR2_TOOLCHAIN_BUILDROOT_LIBC be equal to "glibc" in
>>> both the glibc and eglibc case, which would be sufficient to make the
>>> toolchain building logic use the "glibc" and "glibc-configure" targets
>>> for both the eglibc and glibc selections.
>>
>>    You could also choose to keep eglibc.mk and make glibc the derivative.
>> Or would that be strange?
>
> Have you seen my new patch set:

  Sorry, I thought I had checked before sending but obviously my search 
wasn't good enough.

>
> Subject: [Buildroot] [PATCH 00/12] Toolchain updates
> Date: Wed, 28 Aug 2013 08:35:19 +0200
>
> It already incorporates a single 'glibc' package that handles both
> glibc and eglibc, as per your suggestion. See PATCH 07/12 of this
> series.
>
> I renamed the package to 'glibc' because with the new activity in
> glibc, it is expected that eglibc will more or less disappear in the
> coming months/years. People are talking on how to merge back into glibc
> the changes that were kept separate in eglibc, etc.

  Oh, I didn't know that.


  Regards,
  Arnout

>
>>> Want me to rework the patch in this direction?
>>
>>    Would be nice, but as you say, merging later wouldn't be so difficult.
>> Except of course that by that time they may have diverged more.
>
> It's already done, see above.
>
>>> Note that later on, if we support several versions of glibc and eglibc,
>>> then package/glibc/Config.in would look like:
>>>
>>> if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>>>
>>> 	... versions of eglibc ...
>>>
>>> endif
>>>
>>> if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>>>
>>> 	... versions of glibc ...
>>>
>>> endif
>>
>>    Nothing wrong with that, right?
>
> No, nothing wrong at all :)
>
> Thanks!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
