From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 5 Jul 2015 10:51:56 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC8yDfpiXyKLFxZHUOA-TT+4xtoHLW32NM03WAb2Yyjq6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 28, 2015 at 9:42 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:

[snip]

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
>
> Test about performances of this patch set vs master branch:
> | 199m | HW-MED | defconfig-full | master branch | no top-level make |
> |  99m | HW-MED | defconfig-full | master branch | top-level make    |
> | 100m | HW-MED | defconfig-full | patch set     | top-level make    |
>
> | 350m | HW-HIGH | defconfig-full | master branch | no top-level make |
> |  73m | HW-HIGH | defconfig-full | master branch | top-level make    |
> |  77m | HW-HIGH | defconfig-full | patch set     | top-level make    |
>
> | 10m | HW-MED | defconfig-small | master branch | no top-level make |
> |  5m | HW-MED | defconfig-small | master branch | top-level make    |
> |  5m | HW-MED | defconfig-samll | patch set     | top-level make    |
>
> | 21m18s | HW-HIGH | defconfig-small | master branch | no top-level make |
> |  7m53s | HW-HIGH | defconfig-small | master branch | top-level make    |
> |  7m54s | HW-HIGH | defconfig-samll | patch set     | top-level make    |

[snip]

I've redone all the tests including the case of the patch set without
using top-level make.

I've repeated the the test at least two times and taken the minimum value.

defconfig-small:
| HW-HIGH | HW-MED | top-level make | patch set |
|----------------|----------------|-----------------------|---------------|
| 21m17s    | 10m13s   | no                  | no           |
| 21m24s    | 10m17s   | no                  | yes         |
|   7m57s    |  5m25s   | yes                 | no           |
|   7m48s    |  5m22s   | yes                 | yes         |

defconfig-full:
| HW-HIGH | HW-MED | top-level make | patch set |
|----------------|----------------|-----------------------|---------------|
| 350m       | 199m       | no                  | no           |
| 355m       | 200m       | no                  | yes         |
|   74m       |  99m        | yes                 | no           |
|   76m       |  99m        | yes                 | yes         |

In these tests the penalty of using pps is 0%-3%.
Also the reduction of build time using top-level make is 50%-78%

I think they are nice numbers :)

Best regards
-- 
Fabio Porcedda
