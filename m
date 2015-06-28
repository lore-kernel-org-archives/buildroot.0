From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 22:46:22 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150628204622.GE3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-06-28 21:42 +0200, Fabio Porcedda spake thusly:
> this patch set aims to improve build reproducibility by using a
> per-package staging directory.
> Also this feature aims to enable the top-level parallel make.

I haven't yet had time to look in the different patches, but I have a
preliminary comment about your benchmarks:

[--SNIP--]
> HW-MED:
> CPU: Intel i7-4790K (4x2 @4GHz) = 8 threads
> RAM: 16GB
> SSD: 512GB
> 
> HW-HIGH:
> CPU: 2 x Xeon 2620v3 (6x2 @2.40Ghz) = 24 threads
> RAM: 32GB
> SATA: RAID0 2x2TB 3.5" 7200rpm
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

OK, so those benchmarks show that:

  - HDD are terribly slow when compared to SSDs

  - the build-time sppedup of parallel builds is huge, up to 4.5 on
    HW-HIGH, but mostly around 2 when HDDs do not play in the equation
    (i.e. on SSDs, or with all cached in RAM (small config)).

  - the build-time overhead is low, 5% in the worst case (73min -> 77min)

  - the size overhead is huge, a factor 4.4 with hardlinks, 6.5 without
    hardlinks

  - we're missing the benchmarks for this patchset without top-level
    parallel make (especially for the size overhead). Unless it no
    longer makes sense?

So, I'm really a bit skeptical. About five time the size for only about
twice the speedup, is it worth it? Sure some people will easily favour
speed over anything else, still the size overhead is really huge.

But I still think the idea is worth investigating.

Otherwise, I have a 2x4 core Xeon @3.4GHz with three SSDs in RAID0 which
might be better as a HW_HIGH system. I can spin a test-build with this
patchset on this machine to see what we get...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
