From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Aug 2015 01:10:39 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <ae20692cc561152ac16a33820206a599@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be> <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
 <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
 <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
 <0494936f4284565201a58a70d0a3c08d@openmailbox.org>
 <ae20692cc561152ac16a33820206a599@openmailbox.org>
Message-ID: <55D9016F.5080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi C?dric,

On 08/20/2015 03:04 PM, C?dric Marie wrote:
> Hi!
> 
> I'm getting back to working on this old subject (it was discussed in June).
> I have proposed a first patch to fix the CMake specific problem.
> See:
> http://git.buildroot.net/buildroot/commit/?id=307029867b0384446cd74b232b45a7b4f40cf0d1
> 
> VERBOSE is not exported anymore, unless V=1 in the command line.
> 
> It was suggested that I should provide a second patch, to address the problem
> globally.
> I have a local patch for that, but I need some feedback before providing it.
> 
> The idea is to remove exported variables that come from the kernel and are
> useless in our context (KBUILD_VERBOSE and quiet), to remove VERBOSE, and to
> manage the verbosity in a specific way in each pkg-infra (VERBOSE=1 is
> understood by CMake, but might not be understood by another build system).

 Yeah, it's not a good idea for us to export anything since we don't control our
child build systems. That export was most likely copied from the kernel's
Makefile years ago, without thinking about the implications.

> When V=1, we should export Q = (empty) and a new variable BR2_VERBOSE = 1.
> When V=0, we should export Q = @ and BR2_VERBOSE = (empty).

 I don't think we should export anything at all, we should really do it per
build system (which is problematic for generic-package of course).

> 
> Q behaviour is not modified.
> 
> BR2_VERBOSE is taken into account in pkg-infra.
> * In pkg-cmake.mk:
> When BR2_VERBOSE=1, I add VERBOSE=1 in <PKG>_BUILD_CMDS
> * In pkg-autotools.mk:
> I don't know what to do. VERBOSE=1 has no effect, V=0/1 has no effect,
> --enable-silent-rules has no effect.

 For autotools it depends a lot on the version. Relatively recent automake (at
least 1.15) has the V=0/1 option, but it defaults to 1 I think. And of course,
the many packages that use autoconf but no automake do not support the V option.

> 
> NB: The only verbosity setting that has an effect on autotools is "make -s", but
> it is different from "make V=0/1", and it is already taken into account by
> Buildroot (QUIET variable in root Makefile).
> 
> Globally, there is no change:
> * V=1 involves VERBOSE=1 for CMake.
> * V=1 already has no effect for autotools.
> 
> In fact I'm not sure about autotools. I suppose it depends on the version of
> autotools that is used by the package.
> Do you know an autotools package that currently takes Buildroot's V=1 into account?

 libpthsem for example.

> 
> And what about the other pkg-infra?
> Does one of them take VERBOSE into account?

 The kernel is an obvious one... And also derived ones, like busybox, uclibc,
uboot. But of course, it means it would have to be done for each individual
generic package...

 So maybe exporting V is not such a bad idea after all. VERBOSE and Q I wouldn't
export, however.


 Regards,
 Arnout

> 
> If we have too much doubts, we can also simply remove KBUILD_VERBOSE and quiet,
> and keep on exporting VERBOSE when not empty. I think it would just have been
> more clean to apply pkg-infra specific rules.
> 
> Let me know what you think about it...
> Thank you.
> 
> Regards.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
