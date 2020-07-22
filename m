From: DO <hi@senzilla.io>
Date: Wed, 22 Jul 2020 19:36:34 +0000
Subject: [Buildroot] [PATCH 0/8] Introduce EDK2 firmware builds
In-Reply-To: <20200720231048.35f0aa60@windsurf.home>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200720231048.35f0aa60@windsurf.home>
Message-ID: <OUuhExZMFxSzgT-_1wekmIasm9YkhV6Ez_n7ovNcKT9LWMMaBtNEpyIHUax4NwOkn_Lpnj4Up1ar7gCav3arhFnXiDnstJENkGL8hT8fPLE=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Monday, July 20, 2020 11:10 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I must say my knowledge of SBBR/SBBA is very limited, but I'm confused
> by the addition of all those configurations.
>
> First of all, Buildroot doesn't really have a concept of a "board"
> separated from a defconfig. It seems like you believe you have created
> the support for a board by creating board/aarch64-sbsa/, but really the
> support for a board in Buildroot is mainly a defconfig. So here, you
> have adjusted one board configuration and created 3 new ones.

Thanks for the feedback about the board, it makes sense. I was drawing
inspiration from the generic-looking aarch64-efi board. But I hear you,
about the intended use of boards in Buildroot.

I'm working on a simpler v2 revision of this series that does not
introduce too many new concepts or this kind of "generic" board.

> What is the Qemu SBSA platform compared to the QEMU Virt one ? Why
> would we want qemu_aarch64_virt_sbbr_defconfig and
> qemu_aarch64_sbsa_sbbr_defconfig ?

The QEMU SBSA machine is the reference implementation of a SBSA-
compatible hardware. It's one of the two "ARM Server Ready" standards
that ARM and Linaro are working on. The other standard is SBBR for
bootloader firmware (which basically is ATF + EDK2 + ACPI).

> What makes these platform Qemu specific ? The fact that we do build
> EDK2, which is the firmware, and therefore is obviously
> board/platform-specific ?

Part of what makes these platforms QEMU-specific are things like the
flash device image layout, ACPI tables and other "hardware" features.
And yes, you're right, these are indeed board specific.

> If that's the case how is EDK2 useful on the
> aarch64_efi case, which is a cross-platform defconfig that should work
> on any EFI-capable AArch64 system ?

For aarch64_efi I think it would make sense to build the QEMU
flash version of UEFI. It's separate from anything else in the build, and
would help people try the build using the instruction in
board/aarch64-efi/readme.txt without having to install or download the
UEFI blob from somewhere. If people want to use aarch64_efi with another
platform they don't need to use the UEFI firmware that would be built.
Would that make sense?

I've noted all the other feedback you provided in the series and will
include it in v2.


Cheers

Dick Olsson
