From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Sep 2015 00:31:34 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87zj0oumrg.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
Message-ID: <55F89C46.3010904@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter, Thomas,

Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>   >> Yes, but I still question the need for all of this work in the first
>   >> place.
>
>   > On my side, I don't. Some people are still forced to use 2.6.x kernels
>   > older than 2.6.32, and if Luca (who is a knowledgeable and
>   > skilled developer) has such a need, I'm sure it means there is a silent
>   > group of people stuck with prehistoric kernels that would benefit from
>   > this.
>
> Sure, I get that. I just question the sensibility of combining a 6+ year
> old kernel with modern user space.

I agree with you on the principle, but in the practice I have devices
running very fine on 2.6.30 and some user space applications using
C++11. Yes, I used a fairly recent toolchain (gcc 4.8 IIRC), which is
of course a bad idea, I know... But in the practice it works. I had to
spend a little time to check some packages that try to use kernel
features not available in the running kernel. IIRC I only had issues
with dhcpcd which tends to use recently-introduced syscalls. Other
packaged run without problems.

>
>
>   > In addition, the changes that Luca is proposing are very
>   > self-contained, and often shared with the other /dev management
>   > solutions. So I don't see a lot of additional complexity in what Luca
>   > is proposing.
>
> I do, it is yet another slightly different variant of the /dev
> handling to confuse new users and complicate the build logic.
>
> I agree that it isn't a _LOT_ of complexity, but it isn't non trivial
> either.

FWIW, it's even less complex in the v2 patchset that's half-brewed here.

>   > I'm not sure how complicated it is to backport devtmpfs. However I
>   > would suspect that it isn't that easy.
>
> Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
> kernel. To me it looks quite self contained, so backporting it to
> something close to 2.6.32 doesn't look too bad.

I think I had a look a couple of years ago when I did the first project
on the same SoC. I think I had a look and found it non trival, but the
product to create had no hotplugging capabilities and no firmware
loading needs, so I just went for a static /dev.

Now I have a real goal, so I might try harder to look into backporting
devtmpfs.

>   > So far, Luca has provided some patches that are perfectly documented,
>   > along with test cases and test scripts to validate the booting with
>   > all possible /dev management situations. To me, the perfectness of
>   > Luca's contribution is a good enough argument to merge this feature
>   > :-)
>
> I agree, the patches themselves are very nice work!

Thanks both! :)

-- 
Luca
