From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Nov 2016 23:42:28 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <20161116123331.44f50097@free-electrons.com>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
 <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
 <99a8adb3-3fa3-7050-e31f-16d2ee67ea12@mind.be>
 <20161109043021.GA10982@tungsten.ozlabs.ibm.com>
 <eijmfdxo6o.ln2@ID-313208.user.individual.net>
 <f3f4937e-e29f-e504-371f-f393346f5ade@mind.be>
 <20161116123331.44f50097@free-electrons.com>
Message-ID: <db7b6008-59ba-a434-9bab-d22b0ab25a97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-16 12:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 13 Nov 2016 21:18:46 +0100, Arnout Vandecappelle wrote:
> 
>>  Nice idea, but it's only possible for internal toolchains. Unless if we merge
>> the ld-wrapper patches (last news of which was: it shouldn't be needed).
>>
>>  I'm slightly inclined to go for patching configure or libtool.m4 instead.
> 
> Can we move forward with this topic? Could somone summarize the problem
> and options we have with advantages/drawbacks?

 That I can.

 Support for powerpc64le is a relatively recent addition to the libtool autoconf
macro. This macro is used in the configure script to detect shared library
support in the toolchain. The wrong version will do 'ld -m elf64ppc', which is
not a supported emulation for powerpc64le (it should be elf64lppc, notice the
extra l).

 The possible solutions:

1. Patch each package individually. This is a lot of work. Debian [1] reported a
few hundred packages that were affected.

2. In autotools-package, patch the configure script. The lines to change can be
anywhere in the configure script so the patch will always have a (rather large)
offset, but a few samples indicate that the context doesn't change so it applies
pretty easily. Care has to be taken however that a configure script that is
already correct is not patched, and also a configure script that doesn't contain
libtool.m4 at all shouldn't be patched.

2b. Like 2), but patch libtool.m4 instead of configure when we're doing an
autoreconf. libtool.m4 is safer to patch - the ppc hunk is certainly there, so
we just have to check if it's already corrected and if not apply the patch. But
of course for packages which we don't autoreconf, we're in the situation of 2.

2c. Like 2b), but always autoreconf (for ppc64le of course). Problem is that
some packages don't autoreconf cleanly, and we probably still have a few
packages where we have patches for configure but not configure.ac. I think this
one is a no go.

2d. Like 2, 2b or 2c, but specify per package that this has to be done. That
eliminates the risks involved: we are sure that the patch has to be applied, and
we know that it can be applied. But it means that all packages have to be fixed
explicitly.

3. Make sure LD accepts -m elf64ppc (and interpret it as -m elflppc). Nobody
else is going to pass this option so it should be safe. This requires an ld
wrapper. It could be the generic ld wrapper [2], or it could be custom wrapper
script that only gets installed for ppc64le. The same issues as for the current
toolchain wrapper have to be taken into account (i.e. when used as an external
toolchain, the wrapper should be wrapped again).

3b. Patch our binutils to accept -m elf64ppc (using patch from [1]), and assume
an external toolchain has this patch applied. Since we don't have an existing
ppc64le external toolchain now, this is not too exotic of an assumption. But it
means maintaining an arch-specific patch which is never great.


 Now that I wrote everything down, it looks like option 3 as suggested by Bernd
is the simplest and cleanest. It keeps things rather localized (which is less
the case for the variants of 2, and also 3b means patches for the different
binutils versions). It could be done either in the INSTALL_WRAPPER loops, or
perhaps as a TOOLCHAIN_POST_INSTALL_TARGET hook.


 Regards,
 Arnout

[1] https://lists.debian.org/debian-powerpc/2014/09/msg00041.html
[2] http://patchwork.ozlabs.org/patch/606688/

> 
> We've got quite a lot of build failures because of that. In the latest
> autobuild report, we've got 7 build failures on powerpc64le (on a total
> of 41 build failures), and I suspect a significant number of them are
> due to this libtool issue.
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
