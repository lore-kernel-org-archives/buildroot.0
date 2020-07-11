From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Jul 2020 15:08:27 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
In-Reply-To: <20200711125919.6e484aef@windsurf.home>
References: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
 <20200711125919.6e484aef@windsurf.home>
Message-ID: <39be97c6-9569-e206-ebe5-a49ca65015af@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/07/2020 ? 12:59, Thomas Petazzoni a ?crit?:
> On Sat, 11 Jul 2020 01:02:01 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> I would like to rename the aarch64_efi_defconfig to
>> qemu_aarch64_virt_efi_defconfig  in order to do a runtime test in the Buildroot
>> gitlab-ci.
> 
> The thing is that the idea of the aarch64_efi_defconfig is that it is a
> generic AArch64 image that should work on all EFI compliant AArch64
> systems, not just Qemu.
> 
> Renaming it with a "qemu_" prefix kind of losses that implicit
> "documentation" that it is a generic AArch64 configuration.
> 
> If your goal is to have this defconfig tested under Qemu, then I would
> rather suggest that we improve the logic that decides which defconfig
> can be tested under Qemu, and not just rely on a qemu_ prefix, but
> maybe some kind of explicit list ?

Not really just testing this defconfig under Qemu, but having ACPI tables and
other features enabled by EFI and grub when booting the system under Qemu.

The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
tables are missing and the plig and play support is disabled.

dmesg:
ACPI: Interpreter disabled.
[...]
pnp: PnP ACPI: disabled

For example, ACPI and hotplug support is required to use QEMU Virtual NVDIMM

-device nvdimm,id=nvdimm1,memdev=mem1

Instead of renaming aarch64_efi_defconfig, we can enable UEFI and grub in the
qemu_aarch64_virt_defconfig itself. But it still require the QEMU_EFI.fd
firmware, either built by Buildroot (complex hand written build system) or
fetched from Linaro.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
