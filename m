From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 23:00:02 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <20150628204622.GE3950@free.fr>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr>
Message-ID: <20150628230002.608893c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Jun 2015 22:46:22 +0200, Yann E. MORIN wrote:

> > |  35GB |  99m | master branch
> > |  37GB | 100m | patch set             
> > | 153GB | 105m | patch set using hard links only for the toolchain sysroot
> > | 225GB | 106m | patch set not using hardlinks at all
> > 
> > Test about performances of this patch set vs master branch:
> > | 199m | HW-MED | defconfig-full | master branch | no top-level make |
> > |  99m | HW-MED | defconfig-full | master branch | top-level make    | 
> > | 100m | HW-MED | defconfig-full | patch set     | top-level make    |
> > 
> > | 350m | HW-HIGH | defconfig-full | master branch | no top-level make |
> > |  73m | HW-HIGH | defconfig-full | master branch | top-level make    | 
> > |  77m | HW-HIGH | defconfig-full | patch set     | top-level make    |
> > 
> > | 10m | HW-MED | defconfig-small | master branch | no top-level make |
> > |  5m | HW-MED | defconfig-small | master branch | top-level make    | 
> > |  5m | HW-MED | defconfig-samll | patch set     | top-level make    |
> > 
> > | 21m18s | HW-HIGH | defconfig-small | master branch | no top-level make |
> > |  7m53s | HW-HIGH | defconfig-small | master branch | top-level make    | 
> > |  7m54s | HW-HIGH | defconfig-samll | patch set     | top-level make    |
> 
> OK, so those benchmarks show that:
> 
>   - HDD are terribly slow when compared to SSDs

Yes, and the top-level parallel make gives the highest benefit on HDDs:
from 350m to 77m and from 21m to 8m on the HW-HIGH configuration.

>   - the build-time overhead is low, 5% in the worst case (73min -> 77min)

Yes.

>   - the size overhead is huge, a factor 4.4 with hardlinks, 6.5 without
>     hardlinks

No, as you replied, the size overhead is very reasonable. You misread
Fabio's table here.

>   - we're missing the benchmarks for this patchset without top-level
>     parallel make (especially for the size overhead). Unless it no
>     longer makes sense?

Correct, I asked the same thing.

> So, I'm really a bit skeptical. About five time the size for only about
> twice the speedup, is it worth it? Sure some people will easily favour
> speed over anything else, still the size overhead is really huge.

Do you reconsider this comment now that you know the reality about the
size impact ? :-)

> Otherwise, I have a 2x4 core Xeon @3.4GHz with three SSDs in RAID0 which
> might be better as a HW_HIGH system. I can spin a test-build with this
> patchset on this machine to see what we get...

Would definitely be useful. Maybe Fabio can provide you his
defconfig-full test case (he gave the defconfig-small case).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
