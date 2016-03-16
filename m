From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Mar 2016 23:26:04 +0100
Subject: [Buildroot] Compilation of Buildroot 2016.2 for Raspberry Pi
 with Musl 1.1.6 fails - no stddef.h header
In-Reply-To: <CAMduVEfcO2XM1SZVGuvaUCKhbNrZwfG7-oYw=B757iZDYU3cAg@mail.gmail.com>
References: <CAMduVEfcO2XM1SZVGuvaUCKhbNrZwfG7-oYw=B757iZDYU3cAg@mail.gmail.com>
Message-ID: <56E9DD7C.2060108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/15/16 09:57, Wojciech Zabolotny wrote:
> To recreate the problem:
>
> $ wget https://buildroot.org/downloads/buildroot-2016.02.tar.bz2
> $ tar -xjf buildroot-2016.02.tar.bz2
> $ cd buildroot-2016.02
> $ make raspberrypi_defconfig
> $ make menuconfig
> In the "Toolchain" section select "Toolchain type" "External toolchain"
> and then in "Toolchain" "Musl 1.1.6 toolchain (experimental)"
> Leave the configuration menu, saving the configuration
> $ make
>
> After some time you'll get:
>
>   CC      drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.o
>   CC      fs/proc/array.o
> drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.c:42:20:
> fatal error: stddef.h: No such file or directory
>   #include <stddef.h>
>                      ^
> compilation terminated.
> scripts/Makefile.build:258: recipe for target
> 'drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.o' failed

  That looks like a problem with the RPi kernel. stddef.h doesn't exist within 
the kernel, it simply shouldn't be used. Well, it's Broadcom code so not really 
surprising that it's wrong...

  You could try to patch it out, send a pull request, and the update our defconfig.

>
> If I'm forced to build the system quickly (as my students are, due to
> short lab sessions), the only way is to switch off the EABIhf (by
> selection of the EABI in the "Target options", Target ABI) and use the
> "Toolchain (Sourcery CodeBench ARM 2014.05)"
>
> Of course the optimal solution is to use the "Buildroot toolchain"
> with standard EABIhf, but it takes very long to rebuild after "make
> clean"...

  How about using one of the autobuilder toolchains? E.g. [1].

  Regards,
  Arnout

[1] http://autobuild.buildroot.net/toolchains/configs/br-arm-cortex-a9-glibc.config



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
