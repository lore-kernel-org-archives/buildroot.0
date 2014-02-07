From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Feb 2014 16:17:16 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <52F4E131.4060205@andin.de>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <52F4E131.4060205@andin.de>
Message-ID: <CAHkwnC_dfvrbuHThOwtRPYcjP8SO_5WA=f1hLeNenGJ9tFsHEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2014 at 2:35 PM, Andreas Naumann <dev@andin.de> wrote:
> Thanks for all your input!
>
> I understand the issues with the implicit/optional dependencies which may
> vary because of unpredictable execution order during the config step. Since
> determinism is more important to me than speed I wont remove the
> .NOTPARALLEL directive for now.
> However...
>
> Am 07.02.2014 11:31, schrieb Samuel Martin:
>>
>> Andreas, Maxime, Frank, all,
>>
>>
>> On Fri, Feb 7, 2014 at 10:00 AM, Frank Ihle <frank.ihle@hs-offenburg.de
>> <mailto:frank.ihle@hs-offenburg.de>> wrote:
>>  >
>>  > Hi Andreas,
>>  >
>>  > This is not a solution more my experience:
>>  >
>>  > I'm using a 4 Core 3.2 GHz on a Fedora 20 system and for a
>> at91sam9x5ek_defconfig it takes about 7 min from 0 (without an
>> downloaded DLs) to a bootable Image.
>>  >
>>  > During build I'm using GKrellM System Monitor and and shows me that
>> all cores are in use. ATM I'm ok with these results, since i started
>> with a compile time about 45 min.
>>  >
>>  > Regards,
>>  >
>>  > Frank
>>  >
>>  > >>> Andreas Naumann <dev at andin.de <mailto:dev@andin.de>> 07.02.14
>>
>> 9.52 Uhr >>>
>>  >
>>  > Hi guys,
>>  >
>>  > First of all kudos again for this very good tool! I'm using it almsot
>>  > daily and am stoked about the functionality but simple usage at the
>> same
>>  > time.
>>  > Now one issue with build systems is always build time. It seems the
>>  > speed is not impacted much by just spending more horsepower (cpu
>> cores).
>>  > When looking at the load I see very frequently that just one core is
>>  > busy with one package, especially during the configure step. Some
>>  > packages themselves are build with just one core, I guess we cant do
>>  > very much about that.
>>  > However, why are independent packages not build in parallel? Are the
>>  > dependencies too complex to make this work? Thanks for any insight!
>>
>> Well, this is a tricky thing. I see 3 points on this topic:
>> - building a package in parallel:
>>    We already do this, unless the package itself (more precisely its
>> build-system) does not support it.
>>    In such cases, it is explicitly stated in the *.mk file by setting
>> <PKG>_MAKE = $(MAKE1).
>> - the package configuration step:
>>    Unfortunately the package configuration is highly serialized and
>> depends on the build-system used
>>    by the package.
>> - building packages in parallel:
>>    This point tends to hit some Buildroot's principles:
>>    - simplicity;
>>    - and build reproducibility (don't know if this word really exists in
>> English...).
>>    Being able to reproduce build (mainly build failures) implies that
>> the sysroot should not change during
>>    the configuration/build steps of a package, so the sysroot should be
>> copied for each package built in
>>    parallel (iow, if 4 packages are built in parallel, there will be 4
>> sysroots at the same time, each of them
>>    with a content that may be slightly different one from the others).
>> This may introduce some complexity
>>    in Buildroot and it may also make build time worse due to the copies
>> of the sysroot for each package.
>
>
> ... we have a hack around that sort of does separate sysroots. That is,
> before going to global staging we create a per packet staging (in order to
> create ipkgs).
> Would it be possible to switch off parallelization just for the configure
> and staging steps?

IMHO Switching off the parallelization for the configuration phase
does not make any sense.
The problem for the configuration phase is the building order and that
is changed even if you switch off the parallelization only for the
configuration phase.

>> The patch series pointed by Maxime introduces support for building
>> packages in parallel, but does not
>> implement the sysroot copy thing.
>> During the Buildroot Developer Days in last November, it has been
>> decided that we won't enable building
>> packages in parallel (see:
>> http://elinux.org/Buildroot:DeveloperDaysELCE2013#Parallel_top-level_make
>> ).
>>
>>
>> @others developers: feel free to correct me, if I speak with my ass ;)
>>
>> BTW, this could certainly be added in the FAQ.

Best regards
Fabio Porcedda
