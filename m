From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Nov 2011 21:23:05 +0000
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
 <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
Message-ID: <201111172123.05834.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 November 2011 13:05:47 Thomas De Schampheleire wrote:
> How does a version-bumper currently go about? How is he supposed to
> know whether a patch is still valid or not?

 I've never bumped a version so I can't be sure, but I expect the procedure
is like this:

1. Bump version number
2. Rename all patches to the new version number
3. make pkg-patch and conflicts or fuzz
4. Remove or modify patches as needed
5. Build and test


> Although you are right that there is no such thing as a generic patch,
> I still feel there is a conceptual difference between:
> * modifications intended for all versions of a package, for example
> modifications that we know will never go upstream because they are
> buildroot-specific, and

 Really buildroot-specific patches shouldn't exist.  It means that either
the package or buildroot is broken (usually the former).  It's more likely
that a patch never goes upstream because upstream just doesn't care
about cross-compilation, or because no buildroot developer pushes it.

> * modifications which are intended for a specific version, for example
> a backport of a change that was already fixed in a later version.

 Only in this case I think it makes sense to include a version number in
the patch.  But what is actually important in that case is the version
number from which it was backported, not the version number to which
it applies...

 With that in mind, I would propose a format like this for backport
patches:

<pkg>-<seqno>-from_<nextversion>-description-of-the-patch

> To remove our reliance on 'luck', I agree it may be best to add
> version numbers to either type of patch. If a package has multiple
> versions, the patch may simply be duplicated with separate version
> numbers .

 I think ThomasP meant that it is best to _remove_ the version numbers.
A version bumper will most likely try to take along all patches anyway, so
putting a version number is just increasing the diffstat.  Without version
numbers, the diffstat will show much better which patches could be
removed, which ones were added and which ones needed to be modified.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
