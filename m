From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Aug 2013 22:16:55 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <20130823064845.2ec4800d@skate>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <521534E2.7020606@mind.be> <20130822232633.7ba9b14d@skate>
 <52169E42.2040904@mind.be> <20130823064845.2ec4800d@skate>
Message-ID: <521E5AB7.1050702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Thomas,

  While testing your patch again, I discovered that "make source" doesn't 
fetch the glibc source (same for eglibc) because BR2_PACKAGE_EGLIBC is 
not y. This would be nice to fix still in 2013.08.

On 08/23/13 06:48, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Fri, 23 Aug 2013 01:26:58 +0200, Arnout Vandecappelle wrote:
>
>>> I don't know for sure, but the package aren't that complex, so I don't
>>> think merging would be very difficult.
>>>
>>> If I had to merge them, where should I put the common code?
>>
>>    I was thinking to have just one glibc package, with a choice to select
>> eglibc or glibc.
>
> Well, I still would like the libc selection to be uClibc/glibc/eglibc
> in the choice in toolchain/toolchain-buildroot/Config.in.

  Good point.

> But I guess I
> can probably make BR2_TOOLCHAIN_BUILDROOT_LIBC be equal to "glibc" in
> both the glibc and eglibc case, which would be sufficient to make the
> toolchain building logic use the "glibc" and "glibc-configure" targets
> for both the eglibc and glibc selections.

  You could also choose to keep eglibc.mk and make glibc the derivative. 
Or would that be strange?

>
> Want me to rework the patch in this direction?

  Would be nice, but as you say, merging later wouldn't be so difficult. 
Except of course that by that time they may have diverged more.


> Note that later on, if we support several versions of glibc and eglibc,
> then package/glibc/Config.in would look like:
>
> if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>
> 	... versions of eglibc ...
>
> endif
>
> if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>
> 	... versions of glibc ...
>
> endif

  Nothing wrong with that, right?



  Regards,
  Arnout

>>>>     Shouldn't this lib be installed as well for a gdb without gdbserver?
>>>> I.e., shouldn't the condition be ifeq ($(BR2_PACKAGE_GDB),y)?
>>>
>>> That's a good question, I don't know. At the moment, the ct-ng backend,
>>> the external backend and the eglibc .mk file all copy libthread_db.so
>>> when gdbserver is enabled.
>>
>>    To be tested but it'd surprise me if gdb didn't need it.
>
> I agree, it would have to be tested.
>
> Thanks for your feedback,
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
