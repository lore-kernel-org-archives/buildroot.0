From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:12:32 +0100
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <1422fd7b4aadc4c1efbec44cf687740c@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
 <20170125142716.55e7d7b3@free-electrons.com>
 <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
 <20170130102316.2a02ed3a@free-electrons.com>
 <1422fd7b4aadc4c1efbec44cf687740c@openmailbox.org>
Message-ID: <20170201211232.2f4effde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 01 Feb 2017 18:01:31 +0100, C?dric Marie wrote:

> You're right, it is a private package, that's why I had to test on other 
> packages I'm not particularly using, to demonstrate.
> 
> The benefit is rather small for my package too.
> 
> Make:
> real	1m1.517s
> user	2m23.996s
> sys	0m36.197s
> 
> Ninja:
> real	0m56.312s
> user	2m19.078s
> sys	0m29.119s

Indeed the benefit is quite small here.

> NB: It includes the whole "time make foo-rebuild" command, because time 
> output is "strange" when inserted in pkg-cmake.mk (... time 
> $$($$(PKG)_MAKE) ...), don't know why...
> Looks like:
> 130.50user 19.88system 0:42.32elapsed 355%CPU (0avgtext+0avgdata 
> 24680maxresident)k
> 0inputs+50416outputs (0major+7602195minor)pagefaults 0swaps

In the first case you're using the shell built-in "time" program, in
the later you're using the separate /usr/bin/time program. Try:

	/usr/bin/time make foo-rebuild

> To be honest, when I started to add ninja possibility, I expected much 
> bigger savings :)
> Yet I have the option, so even if the benefit is small, I keep using it.
> 
> But in the end, I don't know whether it's worth pushing upstream or 
> not...

I'm indeed not sure it's really worth the effort for such a small
saving.

> Besides Buildroot, I also switched another package from CMake/Make to 
> Meson (based on Ninja), and the benefit was much more interesting - 
> although I have not kept any measure to give here.
> I expected the improvement to be caused by Ninja, not Meson. But it 
> seems that Meson makes the difference, rather than Make vs Ninja.

We had some contribution some months ago to add support for Meson in
Buildroot. The problem was that the contribution was only composed of
host packages, not used by any target package in Buildroot itself.
Which means it was only adding dead code, that wasn't used at all by
Buildroot unless you have some in-house package that uses Meson.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
