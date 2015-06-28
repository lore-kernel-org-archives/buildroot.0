From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 22:34:41 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150628223441.306836e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

I haven't looked at the implementation yet, so I'll just comment on the
results.

On Sun, 28 Jun 2015 21:42:34 +0200, Fabio Porcedda wrote:

> To improve performance and reduce space utilization hard links are used.
> 
> To evaluate performance and space utilization I've done some tests.
> 
> HW-MED:
> CPU: Intel i7-4790K (4x2 @4GHz) = 8 threads
> RAM: 16GB
> SSD: 512GB
> 
> HW-HIGH:
> CPU: 2 x Xeon 2620v3 (6x2 @2.40Ghz) = 24 threads
> RAM: 32GB
> SATA: RAID0 2x2TB 3.5" 7200rpm
> 
> 
> defconfig-small, long chain dependency, unfavorable  scenario for parallelization:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_LIBGTK3=y
> 
> defconfig-full:
>   BR2_arm=y
>   BR2_TOOLCHAIN_EXTERNAL=y
> make allyespackageconfig
> Also i removed few packages that do not built on my system.
> make show-targets | wc -w
> 1366
> 
> Test about output using hard links or note using the "defconfig-full"
> on HW-MED:
> 
> |  35GB |  99m | master branch
> |  37GB | 100m | patch set             
> | 153GB | 105m | patch set using hard links only for the toolchain sysroot
> | 225GB | 106m | patch set not using hardlinks at all

So clearly hardlinks are great, as they limit a lot the increase of
disk usage. Going from 35 GB to 37 GB for a full defconfig is quite
reasonable IMO, especially considering the additional safety wrt
optional dependencies that per-package staging gives (even without
considering the top-level parallel build feature).

Also, I guess you are keeping all the temporary per-package staging
directories, right? We could probably save even more disk-space by
getting rid of the per-package staging areas after each package is
built (but that would be this per-package staging area would have to be
re-created every time you do "make <pkg>-rebuild", which isn't nice).

> Test about performances of this patch set vs master branch:
> | 199m | HW-MED | defconfig-full | master branch | no top-level make |
> |  99m | HW-MED | defconfig-full | master branch | top-level make    | 
> | 100m | HW-MED | defconfig-full | patch set     | top-level make    |
> 
> | 350m | HW-HIGH | defconfig-full | master branch | no top-level make |
> |  73m | HW-HIGH | defconfig-full | master branch | top-level make    | 
> |  77m | HW-HIGH | defconfig-full | patch set     | top-level make    |

So your high-end hardware in fact needs more time than the medium-end
hardware to build with top-level parallel, probably because the I/Os
come from HDDs instead of SSD. However, with top-level parallel build,
you high-end hardware performs better.

> | 10m | HW-MED | defconfig-small | master branch | no top-level make |
> |  5m | HW-MED | defconfig-small | master branch | top-level make    | 
> |  5m | HW-MED | defconfig-samll | patch set     | top-level make    |
> 
> | 21m18s | HW-HIGH | defconfig-small | master branch | no top-level make |
> |  7m53s | HW-HIGH | defconfig-small | master branch | top-level make    | 
> |  7m54s | HW-HIGH | defconfig-samll | patch set     | top-level make    |

So all in all, top-level parallel build makes the build from twice
faster to three times faster (or even more for defconfig-full on
HW-HIGH). And the time impact of the per-package staging feature is
minimal.

So to me, this is very encouraging, and clearly shows that it is worth
diving into your implementation and see how we can progressively merge
that.

Can I ask a last test to be done: what happens if you apply your patch
set, but do not use top-level parallel make ? Just to see if there
would be a significant impact to people not enabling top-level parallel
make.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
