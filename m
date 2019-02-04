From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Feb 2019 15:55:38 -0700
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix stdint include location
In-Reply-To: <20190204223005.10f8689e@windsurf>
References: <1548460985-22568-1-git-send-email-james.hilliard1@gmail.com>
 <20190204223005.10f8689e@windsurf>
Message-ID: <CADvTj4rtEJRehF47WHUU9fhi+o7YtZjj3ED6P=fn1wvC4ovD3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 2:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Sat, 26 Jan 2019 08:03:05 +0800
> james.hilliard1 at gmail.com wrote:
>
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > Some applications such as systemd-boot include efilink.h without a libc.
> > Move the stdint.h include to lib.h so that efilink.h can be used directly
> > without requiring a libc.
>
> This is a bit weird: gcc does provide <stdint.h>. It contains something
> like this:
>
> #ifndef _GCC_WRAP_STDINT_H
> #if __STDC_HOSTED__
> # if defined __cplusplus && __cplusplus >= 201103L
> #  undef __STDC_LIMIT_MACROS
> #  define __STDC_LIMIT_MACROS
> #  undef __STDC_CONSTANT_MACROS
> #  define __STDC_CONSTANT_MACROS
> # endif
> # include_next <stdint.h>
> #else
> # include "stdint-gcc.h"
> #endif
> #define _GCC_WRAP_STDINT_H
> #endif
>
> So, when there's a C library, it does a "include_next <stdint.h>" to
> use the stdint.h from the C library, but otherwise it falls back to
> stdint-gcc.h, which does provide a type definition for intptr_t.
>
> Since elflink.h itself uses intptr_t, it seems to make sense for it to
> include <stdint.h>. What exact error are you getting ?
>>> systemd 240 Building
PATH="/home/dragon/atmfirmware/bitaccess/output/host/bin:/home/dragon/atmfirmware/bitaccess/output/host/sbin:/home/dragon/bin:/home/dragon/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
LC_ALL=en_US.UTF-8 PYTHONNOUSERSITE=y
/home/dragon/atmfirmware/bitaccess/output/host/bin/ninja  -j5  -C
/home/dragon/atmfirmware/bitaccess/output/build/systemd-240//build
ninja: Entering directory
`/home/dragon/atmfirmware/bitaccess/output/build/systemd-240//build'
[519/832] Generating disk.c.o with a custom command.
FAILED: src/boot/efi/disk.c.o
/home/dragon/atmfirmware/bitaccess/output/host/bin/x86_64-buildroot-linux-gnu-gcc
-c ../src/boot/efi/disk.c -o src/boot/efi/disk.c.o -Wall -Wextra
-std=gnu90 -nostdinc -ggdb -O0 -fpic -fshort-wchar -ffreestanding
-fno-strict-aliasing -fno-stack-protector -Wsign-compare
-Wno-missing-field-initializers -isystem
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi
-isystem /home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/x86_64
-include src/boot/efi/efi_config.h -mno-red-zone -mno-sse -mno-mmx
-DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI
In file included from
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/efilib.h:25:0,
                 from ../src/boot/efi/disk.c:4:
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/efilink.h:5:10:
fatal error: stdint.h: No such file or directory
 #include <stdint.h>
          ^~~~~~~~~~
compilation terminated.
[521/832] Generating graphics.c.o with a custom command.
FAILED: src/boot/efi/graphics.c.o
/home/dragon/atmfirmware/bitaccess/output/host/bin/x86_64-buildroot-linux-gnu-gcc
-c ../src/boot/efi/graphics.c -o src/boot/efi/graphics.c.o -Wall
-Wextra -std=gnu90 -nostdinc -ggdb -O0 -fpic -fshort-wchar
-ffreestanding -fno-strict-aliasing -fno-stack-protector
-Wsign-compare -Wno-missing-field-initializers -isystem
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi
-isystem /home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/x86_64
-include src/boot/efi/efi_config.h -mno-red-zone -mno-sse -mno-mmx
-DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI
In file included from
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/efilib.h:25:0,
                 from ../src/boot/efi/graphics.c:8:
/home/dragon/atmfirmware/bitaccess/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/efilink.h:5:10:
fatal error: stdint.h: No such file or directory
 #include <stdint.h>
          ^~~~~~~~~~
compilation terminated.
>
> It doesn't really help that this fix is sent standalone, without the
> rest of the systemd-boot series, as it doesn't allow us to try to
> reproduce the build issue.
I'll send v2 with systemd-boot.
>
> >  .../0001-efilink-fix-build-with-gcc-4.8.patch      | 35 ++++++++++------------
> >  1 file changed, 16 insertions(+), 19 deletions(-)
> >
> > diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> > index 57c78c9..7dc8d8d 100644
> > --- a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> > +++ b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> > @@ -1,5 +1,5 @@
> > -From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +From 92d0653f09aa44b24b9306fa9384f13d2c9f1a24 Mon Sep 17 00:00:00 2001
> > +From: James Hilliard <james.hilliard1@gmail.com>
> >  Date: Fri, 18 Jan 2019 22:05:37 +0100
>
> It's not really nice to "hijack" the authorship of the patch here, even
> if admittedly it's just a one-liner.
Ok, I wasn't sure what best practices there was, will change back in v2.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
