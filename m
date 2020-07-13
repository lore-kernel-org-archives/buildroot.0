From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jul 2020 22:36:09 +0200
Subject: [Buildroot] Rename aarch64_efi_defconfig to
 qemu_aarch64_virt_efi_defconfig
In-Reply-To: <CAK4VdL3Jn_zNH3XuLfCTbzTVG=JDjDNk1=r1CivOgNQ64=3aAw@mail.gmail.com>
References: <9693c61b-610e-9371-8ecf-a45a9f1f22e4@gmail.com>
 <20200711125919.6e484aef@windsurf.home>
 <39be97c6-9569-e206-ebe5-a49ca65015af@gmail.com>
 <20200711151214.44b2b74a@windsurf.home>
 <8869dfef-7cd1-999a-5b34-bc319dce218b@gmail.com>
 <CAK4VdL3Jn_zNH3XuLfCTbzTVG=JDjDNk1=r1CivOgNQ64=3aAw@mail.gmail.com>
Message-ID: <ed372f44-55ae-cae8-5e19-3aa940e91d3d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico, All,

Le 13/07/2020 ? 15:18, Erico Nunes a ?crit?:
> Hello all,
> 
> On Sat, Jul 11, 2020 at 3:34 PM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Le 11/07/2020 ? 15:12, Thomas Petazzoni a ?crit :
>>> On Sat, 11 Jul 2020 15:08:27 +0200
>>> Romain Naour <romain.naour@gmail.com> wrote:
>>>
>>>> Not really just testing this defconfig under Qemu, but having ACPI tables and
>>>> other features enabled by EFI and grub when booting the system under Qemu.
> 
> as you already mentioned, the original intent of aarch64_efi_defconfig
> is to be used with standards compliant aarch64 systems running
> ACPI/UEFI. It is analogous to the pc_* defconfigs for x86_64.
> There is a short documentation on it at
> https://git.buildroot.net/buildroot/tree/board/aarch64-efi/readme.txt
> where the need for OVMF is mentioned.
> That was a manual example though as it requires users to pull OVMF
> from the distribution. If there are plans to turn it into an automated
> test, then indeed it would be better to have a Buildroot provided one
> and this readme can also be updated.

ok

> 
>>>>
>>>> The current qemu_aarch64_virt_defconfig boot with just the kernel, so ACPI
>>>> tables are missing and the plig and play support is disabled.
>>>>
>>>> dmesg:
>>>> ACPI: Interpreter disabled.
>>>> [...]
>>>> pnp: PnP ACPI: disabled
>>>>
>>>> For example, ACPI and hotplug support is required to use QEMU Virtual NVDIMM
>>>>
>>>> -device nvdimm,id=nvdimm1,memdev=mem1
>>>>
>>>> Instead of renaming aarch64_efi_defconfig, we can enable UEFI and grub in the
>>>> qemu_aarch64_virt_defconfig itself.
> 
> Probably needs ACPI support in the kernel config as well, and be
> booted with acpi=on as device tree is probably the default in upstream
> kernels in case both are available.

Indeed, I enabled ACPI support in the kernel used by
qemu_aarch64_virt_defconfig, see:

http://patchwork.ozlabs.org/project/buildroot/list/?series=189147

> 
>>>
>>> Seems like a good idea.
>>
>> Ok
> 
> Just to double check, wouldn't it be the case to have 2 qemu configs,
> one to test the ACPI/UEFI+grub2 profile and another one for the qemu
> direct kernel boot?
> If qemu_aarch64_virt_defconfig gets converted to that (which is a
> little more complex and I believe less used with Buildroot), then only
> that would get the automated testing coverage.

Yes, I thought about adding a new defconfig qemu_aarch64_virt_efi_defconfig but
I find it too similar compared to qemu_aarch64_virt_defconfig.
Indeed it is a little more complex but not so much (small grub configuration and
genimage).

As a side effect, the bootloader grub2 will be runtime tested in the
Buildroot gitlab-ci while testing this defconfig.

> 
>>
>>>
>>>> But it still require the QEMU_EFI.fd firmware, either built by
>>>> Buildroot (complex hand written build system) or fetched from Linaro.
>>>
>>> Of course, it's always better to build things from source, but if it's
>>> really too horrible, we can have a package that fetches pre-compiled
>>> binaries from Linaro.
>>
>> I'm agree, but I would like to avoid to spent too much time on it while it
>> already available from Linaro.
>>
>> I suggest to call the package providing the prebuilt QEMU_EFI.fd "ovmf-bin" and
>> latter add the "ovmf" package to build it from source (like the rust packaging
>> does with "rust", "rustc" and "rust-bin").
> 
> Sounds like a good idea to me to have the -bin package, indeed the
> edk2 build system is not very friendly.

I received a message on tweeter from Dick Olsson who packaged edk2 and posted on
github. I'll take a look.

https://twitter.com/dickolsson/status/1282402157090799616
https://github.com/dickolsson/buildroot/tree/arm-trusted-firmware/boot/edk2

Best regards,
Romain

> 
> Erico
> 
