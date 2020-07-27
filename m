From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 27 Jul 2020 16:57:47 +0200
Subject: [Buildroot] [PATCH v2 0/6] Introduce EDK2 firmware builds
In-Reply-To: <20200726100541.7710-1-hi@senzilla.io>
References: <20200726100541.7710-1-hi@senzilla.io>
Message-ID: <CAK4VdL3+oYewY2t4BOT3mHOPsr+JotOgR3q4p8jhQW4X-CZkaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(sorry to reply to this cover letter, looks like some of the e-mails
from this series did not reach me...)


On Sun, Jul 26, 2020 at 12:06 PM D. Olsson <hi@senzilla.io> wrote:
>
> Hi all,
>
> Here is a more simplified and somewhat cleaner revision of the series
> introducing the ability to build EDK2 UEFI firmware in Buildroot.
>
> This series is introducing the EDK2 bootloader package which can build
> firmware for five different platforms, targeting both x86-64 and AArch64.
>
>  * QEMU x86-64 pc machine
>  * QEMU aarch64 virt machine, booting directly from flash
>  * QEMU aarch64 virt machine, booting via kernel protocol
>  * QEMU aarch64 sbsa-ref machine
>  * ARM FVP vexpress machine
>
> The EDK2 build system is very particular and includes different
> dependencies and a lot of custom scripting, which has lead to these design
> decisions when building these Buildroot packages:
>
>  * EDK2 needs to rely on Git submodules because its dependencies are not
>    easy to build separately
>  * Each platform is a specific configuration option (instead of a string)
>    because they require slightly different packages etc.
>
> To keep it simple, this series no longer introduce the concept of "SBBR"
> Although, the firmware build with ATF + EDK2 + ACPI is mostly compliant
> with SBBR.
>
> Dick Olsson (6):
>   package/edk2-platforms: new package
>   boot/edk2: new package

I tried to build edk2 with the defconfig changes on the aarch64_efi
and pc efi defconfigs, but it failed to build some host tool with:

gcc  -c  -I .. -I ../Include/Common -I ../Include/ -I
../Include/IndustryStandard -I ../Common/ -I .. -I . -I
../Include/X64/ -MD -fshort-wchar -fno-strict-aliasing -fwrapv
-fno-delete-null-pointer-checks -Wall -Werror
-Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict
-Wno-unused-result -nostdlib -g -O2  GenFv.c -o GenFv.o
gcc  -c  -I .. -I ../Include/Common -I ../Include/ -I
../Include/IndustryStandard -I ../Common/ -I .. -I . -I
../Include/X64/ -MD -fshort-wchar -fno-strict-aliasing -fwrapv
-fno-delete-null-pointer-checks -Wall -Werror
-Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict
-Wno-unused-result -nostdlib -g -O2  GenFvInternalLib.c -o
GenFvInternalLib.o
GenFvInternalLib.c:19:10: fatal error: uuid/uuid.h: No such file or directory
   19 | #include <uuid/uuid.h>

or

gcc -o ../bin/GenFw   GenFw.o ElfConvert.o Elf32Convert.o
Elf64Convert.o -L../libs -lCommon -luuid
/usr/bin/ld: cannot find -luuid


Looks like libuuid comes from util-linux and host-util-linux was even
built in Buildroot with libuuid enabled.
So apparently the edk2 host build is missing the flags from Buildroot
to build host tools?

Then I noticed that edk2 doesn't have a host package while some host
tools are built. Maybe it's not absolutely required if it adds too
much complexity, but is this intentional?
