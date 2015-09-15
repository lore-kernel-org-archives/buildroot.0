From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2015 10:09:39 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <20150915093030.622d2366@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 15 Sep 2015 09:30:30 +0200")
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
Message-ID: <87zj0oumrg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Yes, but I still question the need for all of this work in the first
 >> place.

 > On my side, I don't. Some people are still forced to use 2.6.x kernels
 > older than 2.6.32, and if Luca (who is a knowledgeable and
 > skilled developer) has such a need, I'm sure it means there is a silent
 > group of people stuck with prehistoric kernels that would benefit from
 > this.

Sure, I get that. I just question the sensibility of combining a 6+ year
old kernel with modern user space.


 > In addition, the changes that Luca is proposing are very
 > self-contained, and often shared with the other /dev management
 > solutions. So I don't see a lot of additional complexity in what Luca
 > is proposing.

I do, it is yet another slightly different variant of the /dev
handling to confuse new users and complicate the build logic.

I agree that it isn't a _LOT_ of complexity, but it isn't non trivial
either.


 >> Is there any reason for NOT using devtmpfs if it is available?

 > Well the point is precisely that it isn't.

What I meant is actually if this option is only useful for the (few?)
Buildroot users with <2.6.32 kernels that want mdev support, or also for
others?


 > Luca is using a vendor-specific kernel in which the entire SoC support
 > is not in mainline. So moving to a newer kernel is simply not an option
 > (or an option with a several man-years effort, which for many companies
 > is the same as "not an option").

I get that.

 > I'm not sure how complicated it is to backport devtmpfs. However I
 > would suspect that it isn't that easy.

Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
kernel. To me it looks quite self contained, so backporting it to
something close to 2.6.32 doesn't look too bad.


 >> We certainly don't test such old kernel headers in the autobuilders.

 > Indeed, we don't. But we could ask Luca, as part of this patch series,
 > to help us add such a toolchain in our autobuilders.
 
I'm not sure I'm really interested in seeing a bunch of patches adding
'depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6_<old>' / comments to
packages.


 > So far, Luca has provided some patches that are perfectly documented,
 > along with test cases and test scripts to validate the booting with
 > all possible /dev management situations. To me, the perfectness of
 > Luca's contribution is a good enough argument to merge this feature
 > :-)

I agree, the patches themselves are very nice work!

But I still need to be convinced that adding this other mdev variant is
the best tradeoff between:

- Adding the patches

- Ask people to backport devtmpfs to their kernel

- Ask people to handle it in a post-build script

- Ask people to add a initramfs mounting a tmpfs on /dev + mknod before
  executing init

- Asking people to stick with user space of the same "maturity" ;) as
  their kernel

If there's other people interested in this feature, then it would be
nice to hear from you.

-- 
Venlig hilsen,
Peter Korsgaard 
