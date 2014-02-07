From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Feb 2014 15:48:35 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
Message-ID: <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2014 at 11:31 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Andreas, Maxime, Frank, all,
>
>
>
> On Fri, Feb 7, 2014 at 10:00 AM, Frank Ihle <frank.ihle@hs-offenburg.de>
> wrote:
>>
>> Hi Andreas,
>>
>> This is not a solution more my experience:
>>
>> I'm using a 4 Core 3.2 GHz on a Fedora 20 system and for a
>> at91sam9x5ek_defconfig it takes about 7 min from 0 (without an downloaded
>> DLs) to a bootable Image.
>>
>> During build I'm using GKrellM System Monitor and and shows me that all
>> cores are in use. ATM I'm ok with these results, since i started with a
>> compile time about 45 min.
>>
>> Regards,
>>
>> Frank
>>
>> >>> Andreas Naumann <dev@andin.de> 07.02.14 9.52 Uhr >>>
>>
>> Hi guys,
>>
>> First of all kudos again for this very good tool! I'm using it almsot
>> daily and am stoked about the functionality but simple usage at the same
>> time.
>> Now one issue with build systems is always build time. It seems the
>> speed is not impacted much by just spending more horsepower (cpu cores).
>> When looking at the load I see very frequently that just one core is
>> busy with one package, especially during the configure step. Some
>> packages themselves are build with just one core, I guess we cant do
>> very much about that.
>> However, why are independent packages not build in parallel? Are the
>> dependencies too complex to make this work? Thanks for any insight!
>
> Well, this is a tricky thing. I see 3 points on this topic:
> - building a package in parallel:
>   We already do this, unless the package itself (more precisely its
> build-system) does not support it.
>   In such cases, it is explicitly stated in the *.mk file by setting
> <PKG>_MAKE = $(MAKE1).
> - the package configuration step:
>   Unfortunately the package configuration is highly serialized and depends
> on the build-system used
>   by the package.
> - building packages in parallel:
>   This point tends to hit some Buildroot's principles:
>   - simplicity;
>   - and build reproducibility (don't know if this word really exists in
> English...).
>   Being able to reproduce build (mainly build failures) implies that the
> sysroot should not change during
>   the configuration/build steps of a package, so the sysroot should be
> copied for each package built in
>   parallel (iow, if 4 packages are built in parallel, there will be 4
> sysroots at the same time, each of them
>   with a content that may be slightly different one from the others). This
> may introduce some complexity
>   in Buildroot and it may also make build time worse due to the copies of
> the sysroot for each package.

The build can be reproduced even when building packages in parallel,
we just need to record the order of the steps and replay that order if
needed.

The sysroot copy is needed only to be sure that even if some package
has an unspecified optional dependency it generates every time the
same binary.

>
> The patch series pointed by Maxime introduces support for building packages
> in parallel, but does not
> implement the sysroot copy thing.
> During the Buildroot Developer Days in last November, it has been decided
> that we won't enable building
> packages in parallel (see:
> http://elinux.org/Buildroot:DeveloperDaysELCE2013#Parallel_top-level_make ).
>
>
> @others developers: feel free to correct me, if I speak with my ass ;)
>
> BTW, this could certainly be added in the FAQ.

I think it's a good idea. Maybe after merging the patch set.

I think that at least when doing development it will be useful to
build packages in parallel.
Maybe it will be best to avoid building packages in parallel just for releases.

Best regards
Fabio Porcedda
