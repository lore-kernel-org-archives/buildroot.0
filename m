From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 9 Aug 2018 09:32:27 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <9a76db59-2d32-4227-bc93-be06b3fc9866@cesnet.cz>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <425833b3-d86f-4275-bc3c-a80c6385b030@cesnet.cz>
 <9a76db59-2d32-4227-bc93-be06b3fc9866@cesnet.cz>
Message-ID: <CANQCQpZVS7qk7JbRxJeGyj_YXibKtkkh60_7gVfFRNS2p0GrZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,
On Wed, Aug 8, 2018 at 3:36 AM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>
> I just got a similar failure from an in-tree package, the spi-tools:
>
> >>> spi-tools 0.8.1 Building
> PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin"
>  /usr/bin/make   -C
> /home/jkt/work/prog/_build/br-cfb/build/spi-tools-0.8.1/
> Making all in src
> /usr/bin/make  all-am
> /home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc  -O0
> -Wl,-z,now -Wl,-z,relro
> -specs=/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/toolchain/gcc-specs-pie-ld
> -o spi-config spi-config.o
> /home/jkt/work/prog/_build/br-cfb/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld:
> spi-config.o: relocation R_ARM_MOVW_ABS_NC against `stderr' can not be used
> when making a shared object; recompile with -fPIC
> spi-config.o: error adding symbols: Bad value
> collect2: error: ld returned 1 exit status

This one has to do with the configure.ac of that package not observing
cflags/cxxflags being passed to configure.  So the *.o that are trying
to be linked weren't build as position independent.  Probably a
similar case for your libredblack package.

I've posted an upstream issue at this point and a basic fix.  As
buildroot could probably use a bump, rather then carrying the patch,
I'll ask upstream if they could do a tag after this fix is merged.
https://github.com/cpb-/spi-tools/issues/12

Matt
