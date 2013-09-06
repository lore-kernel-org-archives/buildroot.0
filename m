From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 6 Sep 2013 10:21:55 +0800
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
In-Reply-To: <20130905234414.45a8106a@skate>
References: <1378262598.32360.5.camel@phoenix> <20130905234414.45a8106a@skate>
Message-ID: <CAFRkauDiWLMrTHn6coC-D+Dpfmdr0MGKNznHy758bvzRf0n8rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Axel Lin,
>
> On Wed, 04 Sep 2013 10:43:18 +0800, Axel Lin wrote:
>> Current setting only allows blackfin to select uclinux as TARGET_OS.
>> However, some noMMU ARM platforms that using FLAT binary format also need to
>> select uclinux as TARGET_OS. Fix the dependency.
>
> Are you sure uclinux as TARGET_OS is the right selection for ARM? The
> release notes of gcc 4.7, at http://gcc.gnu.org/gcc-4.7/changes.html,
> indicate:
>
> ""
> The obsolete ports with alternatives are:
>
>     arm*-*-rtems (use arm*-*-rtemseabi)
>     arm*-*-linux-gnu (use arm*-*-linux-gnueabi)
>     arm*-*-elf (use arm*-*-eabi)
>     arm*-*-uclinux* (use arm*-*-uclinux*eabi)
> ""
>
> So it looks like the arm-<something>-uclinux* tuple should not be used,
> if I understand this correctly. Do you have more details about why
> arm-<something>-uclinux* should be used?

Somehow, I thought noMMU ARM platforms that using FLAT binary format needs to
select uclinux as TARGET_OS.
But since you mentioned the release notes of gcc 4.7, I'm not 100% sure.

I check my build, the result is I have arm-buildroot-uclinux-uclibcgnueabi-gcc.
And the build log shows it checks target system type as:
checking target system type... arm-buildroot-uclinux-uclibcgnueabi

Does buildroot automatically convert arm*-*-uclinux* to arm*-*-uclinux*eabi?

I also check host-gcc-final-4.5.4/gcc/config.gcc and libgcc/config.host.
Looks like it also expects arm*-*-uclinux* for ARM ucLinux and arm*-*-linux* for
ARM GNU/Linux with ELF.

Thanks for the review,
Axel
