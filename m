From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 6 Sep 2013 15:14:34 +0800
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
In-Reply-To: <20130906082632.5cc5c87b@skate>
References: <1378262598.32360.5.camel@phoenix> <20130905234414.45a8106a@skate>
 <CAFRkauDiWLMrTHn6coC-D+Dpfmdr0MGKNznHy758bvzRf0n8rg@mail.gmail.com>
 <20130906082632.5cc5c87b@skate>
Message-ID: <CAFRkauDpZ72haGM99rv0Fxk7Fs2eY=x5YQRi7L3GAG=CQb7juw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Axel Lin,
>
> On Fri, 6 Sep 2013 10:21:55 +0800, Axel Lin wrote:
>
>> > So it looks like the arm-<something>-uclinux* tuple should not be used,
>> > if I understand this correctly. Do you have more details about why
>> > arm-<something>-uclinux* should be used?
>>
>> Somehow, I thought noMMU ARM platforms that using FLAT binary format needs to
>> select uclinux as TARGET_OS.
>> But since you mentioned the release notes of gcc 4.7, I'm not 100% sure.
>
> I am not sure either.
>
>> I check my build, the result is I have arm-buildroot-uclinux-uclibcgnueabi-gcc.
>> And the build log shows it checks target system type as:
>> checking target system type... arm-buildroot-uclinux-uclibcgnueabi
>>
>> Does buildroot automatically convert arm*-*-uclinux* to arm*-*-uclinux*eabi?
>>
>> I also check host-gcc-final-4.5.4/gcc/config.gcc and libgcc/config.host.
>> Looks like it also expects arm*-*-uclinux* for ARM ucLinux and arm*-*-linux* for
>> ARM GNU/Linux with ELF.
>
> Can you check in more recent gcc versions such as 4.7 or 4.8 ? Looking
> at the most recent versions is important to see what is the current
> tuple accepted for this situation.

Hi Thomas,
In host-gcc-final-4.8.1/gcc/config.gcc:

# Unsupported targets list.  Do not put an entry in this list unless
# it would otherwise be caught by a more permissive pattern.  The list
# should be in alphabetical order.
case ${target} in
 # Avoid special cases that are not obsolete
   arm*-*-*eabi*                        \
 )
        ;;
   arm*-wince-pe*                       \
 | arm*-*-ecos-elf                      \
 | arm*-*-elf                           \
 | arm*-*-freebsd*                      \
 | arm*-*-linux*                        \
 | arm*-*-uclinux*                      \
 | i[34567]86-go32-*                    \
 | i[34567]86-*-go32*                   \
 | m68k-*-uclinuxoldabi*                \
 | mips64orion*-*-rtems*                \
 | pdp11-*-bsd                          \
 | sparc-hal-solaris2*                  \
 | thumb-*-*                            \
 | *-*-freebsd[12] | *-*-freebsd[12].*  \
 | *-*-freebsd*aout*                    \
 | *-*-linux*aout*                      \
 | *-*-linux*coff*                      \
 | *-*-linux*libc1*                     \
 | *-*-linux*oldld*                     \
 | *-*-rtemsaout*                       \
 | *-*-rtemscoff*                       \
 | *-*-solaris2                         \
 | *-*-solaris2.[0-8]                   \
 | *-*-solaris2.[0-8].*                 \
 | *-*-sysv*                            \
 | vax-*-vms*                           \
 )
        echo "*** Configuration ${target} not supported" 1>&2
        exit 1
        ;;
esac

The first case shows
case ${target} in
 # Avoid special cases that are not obsolete
   arm*-*-*eabi*                        \
 )
        ;;

Although I have no idea which part of buildroot system converts
arm*-*-uclinux* to arm*-*-uclinux*eabi.
The build result shows arm-buildroot-uclinux-uclibcgnueabi which matches
the first case.
So I think it's ok to set TARGET_OS=uclinux.

Regards,
Axel
