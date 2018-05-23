From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 May 2018 00:08:56 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <0391e860-5605-1942-28b0-5fa87f51c018@gmail.com>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <0391e860-5605-1942-28b0-5fa87f51c018@gmail.com>
Message-ID: <a3f603da-9f1f-12ee-01cf-d9ef0509ad26@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-05-18 18:42, Romain Naour wrote:
> Thomas,
> 
> Le 21/05/2018 ? 17:45, Romain Naour a ?crit?:
>> Hi Thomas,
>>
>> Le 20/05/2018 ? 12:45, Thomas Petazzoni a ?crit?:
>>> Hello Romain,
>>>
>>> Thanks for working on this!
>>>
>>> On Sat,  5 May 2018 12:58:44 +0200, Romain Naour wrote:
>>>> Remove 0860-cilk-fix-build-without-wchar.patch since cilk has
>>>> been removed from gcc.
>>>>
>>>> Rebase 0900-remove-selftests.patch on gcc 8.1.0
>>>>
>>>> Remove upstream patches 0001-m68k-coldfire-pr68467.patch and
>>>> 0892-microblaze-Revert.patch.
>>>>
>>>> Use bz2 release tarball only for gcc 4.9 since all other version
>>>> now use xz tarball.
>>>>
>>>> Runtime tested on x86_64 with binutils 2.30, gcc 8.1.0,
>>>> kernel headers 4.14 and glibc 2.27.
>>>>
>>>> Buildtime tested with glibc with all supported architectures.
>>>>
>>>> Buildtime tested on x86_64 with musl and uClibc-ng
>>>>
>>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>>> ---
>>>>  package/gcc/8.1.0/0001-uclibc-conf.patch           |  29 ++++
>>>>  package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch  |  45 +++++++
> 
> Btw, why we still need these two patches?
> It seems that they are in the gcc package since gcc 4.2.4 (i.e ten years)
> 
> For 0001-uclibc-conf.patch, why we need to add a new case for
> i686-pc-linux-uclibc? what's about other target and libc (musl)?
> I believe this can be removed.

 Especially since it's patching contrib/regression, which is not used at all
during the build...

 I'd say, remove the patch, build for i686-uclibc, and see if things still work
(preferably with a qemu-user runtime test).


> 0002-arm-softfloat-libgcc.patch was added in 2007 [1] for gcc 4.1.2.
> I believe arm soft-float should work out of the box now.

 The patch refers to https://sourceware.org/ml/crossgcc/2008-05/msg00009.html
which says "Unfortuantely, arm-gcc defaults to generating code for armv5t."
Since we always explicitly pass the target CPU for ARM, the default CPU
shouldn't matter. So, again, a runtime qemu-user test for arm920t would confirm
that the patch isn't needed.


 If both patches are indeed unneeded, I'd only remove them for GCC 8, not the
earlier ones. They're not really hurting the earlier versions at the moment.

 By the way, I think patch 0003 can also be removed. We only need it because we
exclude the testsuite in the extraction, to save 252MB of disk space (reducing
the build directory size from 850 to 600MB). I don't think it's worthwhile
carrying a patch just for that. Also, since GCC 7, the libjava directory no
longer exists. So I'd just eliminate that HOST_GCC_EXCLUDES. Thomas, you added
this feature back in 00e9b1e4f7, what do you think?

 Regards,
 Arnout

> 
> Best regards,
> Romain
> 
> [1]
> https://git.buildroot.net/buildroot/commit/?id=b2683e4d2c59cb3e8a5fe0e2500ac6625e8f60bf
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
