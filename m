Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691F6CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4CA42BD8;
	Mon,  8 Jun 2026 22:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGqyHvhFdwny; Mon,  8 Jun 2026 22:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C983B42BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780958989;
	bh=PQM7Dzd15MiqLuyRtBZHHRPbwqcxDVWgAtP9r/1DpHw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/pZ+AT7sv95ENJboqAHbJv1PKHLGJ6A5HbNLVpe0BaICWFg5aQhTF2rmwkZJKf3b
	 2YK9YX40RCs7Wa88kXmDXchkyhWlO8VRwbfq/6Fm75OS9/jm362wlXVNN8uhVw8nWa
	 i4MLDzOG+2G8x0ZhxxGhwGZLgC6TJbyA7FF76PINrdhdDDZq/khAateoS3UtHDcLRO
	 WV7QR8HYoqmMHat0PYzWnZ2+VMWrzohkKLzeAt3Yt8IGFEV/CtC8b8s7Y54CdPzvOJ
	 BC0qVks/WlcragqusggBXpgq4c51D941sWg40QVrnS7NiRjjiyO8VvgN37zKnox4aI
	 nWQTjU21FvIMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C983B42BEC;
	Mon,  8 Jun 2026 22:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 974472C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8892D42BEE
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6q8b6phLYE3 for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0054742BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0054742BD8
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0054742BD8
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:49:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-68d232e119dso7772533a12.0
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780958985; cv=none;
 d=google.com; s=arc-20240605;
 b=MPguQtvQt9J5yccVVq49sePmUrUO290cvyoq065bzg0sSPJm7IpaMzehyNH5qfgMBf
 tzE+Jg8vGUs/DjhVt2rD5EdtxP+pCq8ze0kfOoNOYtacTDs5Le3VI48qJsxE2CaG0JLk
 5d/bDv7vBaQ5JpPTcxmODv3x7wLO8AsoSeQURDNpMInWUnG3f9wqmKmYspUV2lFi2+Ww
 Phl/zHbWf3fio1f5kHT0ZJVXDVhmHpzGa64enkt7N/wUt6p0/VAbtuG/B0iP/zzS7CEY
 QU9Ro5evo6IpUhFZsApQftnHC3hkpeW1ixh+BbqZyae5uDwPCk23ZwyfEO45xlmUgUJ1
 BfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=D0jdu/mxp06eW+m6taQZDxTaIHXqkokJeLeJdfoXIqI=;
 fh=Coqigty4ugyvXp/Dt1cx1JesGFcbgsgDYuObHrLCArQ=;
 b=XDbs6I/XCbRCkUI9owrYqbcdNAxKv7VJB8ZU6DDwTf+AQasbHfwB0NGvu102okvTUL
 NRHCQg5G72iv33++pJq+FMUDi6TgiRp45bcGGMfVEr4qEP9EKYeWeAaHISy2HoRofmT5
 ZE+qIOyTDCtrW4vpGvTC/cKLOiLcW1XkL8JIJLSANMzfABlOhlxWlTclyd2/CTB/u+zN
 97CgSaemfXv/yNWEzkia/AFrwKm6/BkRlXXfWFIN9i+0XOZ3yyC9QOlpsApU9Zj3s2m3
 oyFWtew5H7/oGUNUYJvywi9agmKnuAvP8HamCsVkO9h5/nSoCryTuMIGoib0RQGg421k
 VzMw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780958985; x=1781563785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0jdu/mxp06eW+m6taQZDxTaIHXqkokJeLeJdfoXIqI=;
 b=YVcO43Tl+c8qMCBAM/zgw65fdXmWfQd0wb5nLUNXujosbiJfaIHskmsx/XJQ17lrqa
 5jf/gZPxotr1TtainEhiRF1sif2MTRYJk8fEPyUhXs53K66lBVgGVSKKbXU2gGXzPfDh
 gJ5u7trmUogMFlfcoYQDLt/8/g/ZktP6vhuKWZJe9JAv8hjw71ySCcGuFCJtLFLzDbY7
 govxYQn+Ihob4xMNGVzPBX3xrm1qCqS4QThd//5PSClK7PVXy1j36Eyr/yP3bjbY6hJt
 DO1NU2TKks7+uUzdHXCwclGtq4IwH2qUPVtkIfUlaTB70UBB0wsNeLIaus+waZpMUjHd
 Xoiw==
X-Gm-Message-State: AOJu0YxZWcqOwGvQx3XBxKbL/JbqT/R0ILCqlKAGsfi2/YzZIZWWoy9Q
 nQjdBwXw1lVscezpo4E4+qx/qfuiXioaCRoreilkx4/kGFL4poyehkBwBCLZV3MyAnsHOLbYKuD
 iH1cJwfqtFskcxA8dzbpBRb62/DTaaT4=
X-Gm-Gg: Acq92OEA/aaU2R/FETmZhu148YETA+JO+AyQ3imsma0XKOJbQNN1A5fJD3jw2pfTL1M
 DXkjcBE5atJC08IxaljtBtII0+17fUChf23eLdRxpucxf7l9EcNGy8en60VFAlxaw3xMom9rxEf
 pK9vabBY2Z+NnSzRZlMn95vQ2Kw3cVYiDcn2VKw4gFTRu3KgcYV6qM7JitCti94y/HTq3ree4H5
 +Ysv7uiP8QrlWPhMFof6ENbN2PQ6c9Nh7Xo/pPkPWWl1o99mmTS2YfuYpUTkTlQ67I5tqnKfRYl
 26Pw9E2L2rwb45f7Bv+Z1FKtTKxmBtS2xarj7DG6VwHRzKqin1i0QSRNYNxrSC1DxoDIONWPR5p
 VUPzqJfi51wjEWCm+JYrKv60xWEgwpFJnxHRrh/OQFA5Jkoyufbh4Dj9qLsrJZFnb7KGVWqNdQi
 f8CQvBxTa8euhfNw==
X-Received: by 2002:a05:6402:5193:b0:66e:abe5:ab22 with SMTP id
 4fb4d7f45d1cf-68fa4c0039fmr8093979a12.5.1780958984733; Mon, 08 Jun 2026
 15:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
 <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-2-47fc8262591b@gmail.com>
 <a994e803-d6fc-4149-9f0c-282435a32950@rnout.be>
In-Reply-To: <a994e803-d6fc-4149-9f0c-282435a32950@rnout.be>
From: Christopher Obbard <obbardc@gmail.com>
Date: Mon, 8 Jun 2026 23:49:33 +0100
X-Gm-Features: AVVi8CfWpImNL-d-MKCV0ZdS86GF6aoLuPALXtsqXcxmU6-2eIS0uZovQgph5lc
Message-ID: <CAP03XepS6L71fummsB8hA+fm=Rru6hS7vvZf=EjcBQPani-q1w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 efibootguard-dev@googlegroups.com, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780958985; x=1781563785; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D0jdu/mxp06eW+m6taQZDxTaIHXqkokJeLeJdfoXIqI=;
 b=ZL/kyXqhHvG+ErMcp179ryBE8tdq5A6CuVGkGRQnEw1pHrB9AxbL5VSkkZrsxUkx8S
 HKT8p8FWAHZtiPa7gvqDkCS6/Ws5JombOfu4seQAYYYT8rhVYI7ic6KmOQKXebVBkfK7
 zRrsKJ84KkWJ6dG5M/QGWM2iS0yEr8ufl13eJbJdsVAjRNfrFgZ8EvwfGEYAqTcNVasX
 /CKK7+16DoDPzyVgZvJmxEQqmY7fFlAmH3BDohSJBFYBf2laaUilp/cdh/5SSShrvygq
 Nzeizdi4GBGolq2YUjnkxjLCZPE6TtM0U008KKWN/LUp9co6prUzTfVoH9nBRKSfxeQ2
 y27A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZL/kyXqh
Subject: Re: [Buildroot] [PATCH v3 2/2] board/pc-efibootguard: add example
 EFI Boot Guard recipe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Tue, 26 May 2026 at 21:09, Arnout Vandecappelle <arnout@rnout.be> wrote:
> On 24/05/2026 19:23, Christopher Obbard wrote:
> > Add an example recipe (based on configs/pc_x86_64_efi_defconfig) to
> > generate an x86-64 image which boots the system using the EFI Boot Guard
> > bootloader. The recipe is an example of how to create an image using
> > EFI Boot Guard, including how to create the disk image & how to configure
> > the bootloader.
> >
> > The created example image contains two boot slots; one of which contains
> > the environment built by Buildroot and the other is an empty, dummy slot
> > (e.g. cannot be booted from).
> >
> > EFI Boot Guard provides a tool for generating UKI images, which can then
> > be signed for Secure Boot. For simplicity, this is not enabled in the
> > example recipe.
>
>   I think it would be useful to include this as well. Of course that requires
> knowing how to enroll your own key but I guess that can be left as an exercise
> for the reader :-)

Makes sense! I will add instructions to generate a certificate and
sign the images in the next version.


> > Also add instructions (and a script) to boot the example image in QEMU.
> >
> > Signed-off-by: Christopher Obbard <obbardc@gmail.com>
> > ---
> >   DEVELOPERS                               |  2 +
> >   board/pc-efibootguard/README.md          | 89 ++++++++++++++++++++++++++++++++
> >   board/pc-efibootguard/genimage.cfg       | 59 +++++++++++++++++++++
> >   board/pc-efibootguard/linux.fragment     | 15 ++++++
> >   board/pc-efibootguard/post-build.sh      | 33 ++++++++++++
> >   board/pc-efibootguard/post-image.sh      |  7 +++
> >   board/pc-efibootguard/run-image-qemu.sh  |  9 ++++
> >   configs/pc_x86_64_efibootguard_defconfig | 51 ++++++++++++++++++
> >   8 files changed, 265 insertions(+)
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 246b1aa44e..ddc71d9639 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -704,7 +704,9 @@ F:        package/perl-time-parsedate/
> >   F:  package/perl-x10/
> >
> >   N:  Christopher Obbard <obbardc@gmail.com>
> > +F:   board/pc-efibootguard/
> >   F:  boot/efibootguard/
> > +F:   configs/pc_x86_64_efibootguard_defconfig
> >
> >   N:  Colin Foster <colin.foster@in-advantage.com>
> >   F:  package/python-tftpy/
> > diff --git a/board/pc-efibootguard/README.md b/board/pc-efibootguard/README.md
> > new file mode 100644
> > index 0000000000..1bbeff4c48
> > --- /dev/null
> > +++ b/board/pc-efibootguard/README.md
>
>   All other readme's are called readme.txt. We have no markdown files at all at
> the moment, except for SECURITY.md which is mandated to be markdown.

Thanks; I've modified the readme file now to match the others in the tree.


> > @@ -0,0 +1,89 @@
> > +# EFI Boot Guard Example Recipe
> > +
> > +This recipe creates a basic x86 disk image using [EFI Boot Guard](https://github.com/siemens/efibootguard/tree/master)
> > +as the bootloader with two root filesystem slots.
> > +
> > +The image is intended to demonstrate a typical A/B boot layout. The first slot is
> > +populated with the root filesystem generated as part of the Buildroot build,
> > +while the second slot is left empty so that it can be used later by an update
> > +tool, which is out-of-scope for this example recipe.
> > +
> > +The recipe also creates the EFI system partition and installs the EFI Boot Guard
> > +bootloader components needed to select and boot one of the available slots. Each
> > +slot has its own EFI Boot Guard environment, containing the kernel image and
> > +configuration.
> > +
> > +This example is deliberately minimal. It is intended as a reference for users who
> > +want to integrate EFI Boot Guard into their own platform-specific images, rather
> > +than as a complete production-ready update setup.
> > +
> > +This recipe was designed to be ran in QEMU and may need additional changes to run
> > +on real hardware.
>
>   But you did test it on real hardware, right? Can't you copy the instructions
> from board/pc/readme.txt on how to boot on real hardware?

Sure; I will do that.


> > +
> > +
> > +## Build the image
> > +
> > +Configure Buildroot with:
> > +
> > +```
> > +$ make pc_x86_64_efibootguard_defconfig
> > +```
> > +
> > +
> > +Build the image with:
> > +
> > +```
> > +$ make
> > +```
> > +
> > +The raw disk image is available under `output/images/disk.img`.
> > +
> > +
> > +## Emulation in QEMU
> > +
> > +Emulate the system in QEMU with:
> > +
> > +```
> > +$ qemu-system-x86_64 \
> > +    -M pc \
> > +    -drive if=pflash,format=raw,readonly=on,file=</path/to/OVMF_CODE.fd> \
> > +    -drive file=output/images/disk.img,if=virtio,format=raw \
> > +    -boot menu=on \
> > +    -net nic,model=virtio \
> > +    -net user
> > +```
> > +
> > +Note that `</path/to/OVMF.fd>` needs to point to a valid x86_64 UEFI
> > +firmware image for qemu. It may be provided by your distribution as a
> > +edk2 or OVMF package, in a path such as `/usr/share/OVMF/OVMF_CODE_4M.fd` in
> > +Debian.
> > +
> > +
> > +## EFI Boot Guard userspace tools
> > +
> > +The example image includes the EFI Boot Guard userspace tools. These can be used
> > +to inspect and update the boot metadata stored in each slot environment.
> > +
> > +`bg_printenv` prints the current EFI Boot Guard boot configuration:
> > +
> > +```
> > +# bg_printenv
> > +```
> > +
> > +`bg_setenv` updates the state and revision of a slot. For example, the following
> > +commands initialise both slots and prefers booting from slot `0`:
> > +
> > +```
> > +# bg_setenv --part 0 --ustate OK --revision 1
> > +# bg_setenv --part 1 --ustate OK --revision 0
> > +```
> > +
> > +In this example, both slots are marked as usable, but slot `0` has the higher
> > +revision. EFI Boot Guard will therefore select it before slot `1`.
> > +
> > +For more information on configuring EFI Boot Guard, see the
> > +[upstream documentation](https://github.com/siemens/efibootguard/blob/master/README.md).
> > +
> > +An update framework (such as RAUC) can use these tools to switch the preferred
> > +boot slot after installing an update and to mark a slot as failed if the updated
> > +system does not boot successfully.
>
>   Since this is a demo defconfig, perhaps it would make sense to include RAUC as
> well?

Unfortunately the RAUC integration for EFI Boot Guard is still waiting
for upstream review: https://github.com/rauc/rauc/pull/1450
I've got another buildroot patch series to integrate RAUC into this
recipe; but I'd rather send that as a follow-up once the upstream PR
is a bit further.
If you're interested the recipe (it's a standalone recipe but I will
rework it to be part of this recipe) is at
https://github.com/obbardc/buildroot/tree/wip/obbardc/rauc-efibootguard
I don't think installing RAUC is useful until the PR is merged, personally.


> > diff --git a/board/pc-efibootguard/genimage.cfg b/board/pc-efibootguard/genimage.cfg
> > new file mode 100644
> > index 0000000000..2437a89b63
> > --- /dev/null
> > +++ b/board/pc-efibootguard/genimage.cfg
> > @@ -0,0 +1,59 @@
> > +image EFI.vfat {
> > +     vfat {
> > +             file EFI/BOOT/BOOTX64.EFI {
> > +                     image = "efibootguard/efibootguardx64.efi"
> > +             }
> > +     }
> > +
> > +     size = 16352K # 16MB - 32KB
> > +}
> > +
> > +image boot-a.vfat {
> > +     vfat {}
>
>   Does it have to be a FAT partition? Seems a bit... unsafe...

Yeah, unfortunately the EFI Boot Guard configuration partitions have
to be FAT. It's probably due to EFI environment not supporting many
filesystems?
If it's any help, the config partitions are not supposed to be mounted
RW during normal boot and only mounted when modified with the
userspace tooling.


> > +
> > +     size = 128M
>
>   That seems quite large for just a kernel. Unlike /boot in a typical distro, it
> will always contain just a single kernel, right?

Yes, I agree. It was leftover from the project this was taken from. I
will reduce the size of /boot.


> > +     srcpath = "output/images/boot-a-part"
> > +}
> > +
> > +# # boot-b is a placeholder
> > +image boot-b.vfat {
> > +     vfat {}
> > +
> > +     size = 128M
> > +     srcpath = "output/images/boot-b-part"
> > +}
> > +
> > +image disk.img {
> > +     hdimage {
> > +             partition-table-type = "gpt"
> > +     }
> > +
> > +     partition EFI {
> > +             image = "EFI.vfat"
> > +             partition-type-uuid = esp
> > +             offset = 32K
> > +             bootable = true
> > +     }
> > +
> > +     partition boot-a {
> > +             partition-type-uuid = fat32
> > +             image = "boot-a.vfat"
> > +     }
> > +
> > +     partition boot-b {
> > +             partition-type-uuid = fat32
> > +             image = "boot-b.vfat"
> > +     }
> > +
> > +     partition system-a {
> > +             partition-type-uuid = root-x86-64
> > +             image = "rootfs.ext4"
> > +             size = 2G
>
>   That seems _extremely_ large... Remember, that size also means that if you dd
> the image you have to write all of it. It's better when you use bmaptool, but we
> don't do that by default.

Yes, I agree. Again, this is a leftover from the project this recipe
was taken from. I will reduce the size.


> > +     }
> > +
> > +     # system-b is a placeholder
> > +     partition system-b {
> > +             partition-type-uuid = root-x86-64
> > +             size = 2G
> > +     }
> > +}
> > diff --git a/board/pc-efibootguard/linux.fragment b/board/pc-efibootguard/linux.fragment
> > new file mode 100644
> > index 0000000000..f9f2c3fd06
> > --- /dev/null
> > +++ b/board/pc-efibootguard/linux.fragment
> > @@ -0,0 +1,15 @@
> > +# efistub
> > +CONFIG_EFI=y
> > +CONFIG_EFI_STUB=y
> > +CONFIG_EFIVAR_FS=y
> > +CONFIG_EFI_PARTITION=y
> > +
> > +# efibootguard tools (bg_printenv / bg_setenv) use fat partition
> > +CONFIG_PARTITION_ADVANCED=y
> > +CONFIG_EFI_PARTITION=y
> > +CONFIG_FAT_FS=y
> > +CONFIG_MSDOS_FS=y
> > +CONFIG_VFAT_FS=y
> > +CONFIG_NLS=y
> > +CONFIG_NLS_CODEPAGE_437=y
> > +CONFIG_NLS_ISO8859_1=y
> > diff --git a/board/pc-efibootguard/post-build.sh b/board/pc-efibootguard/post-build.sh
> > new file mode 100755
> > index 0000000000..4f3e3254d8
> > --- /dev/null
> > +++ b/board/pc-efibootguard/post-build.sh
> > @@ -0,0 +1,33 @@
> > +#!/bin/sh
> > +
> > +set -e
> > +
> > +# Kernel cmdline to append
> > +KERNEL_CMDLINE=""
> > +
> > +# Create efibootguard boot-a slot configuration
> > +mkdir -p "${BINARIES_DIR}"/boot-a-part
> > +printf "boot-a" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-a-part/EFILABEL
> > +"${HOST_DIR}"/bin/bg_setenv \
> > +    --verbose \
> > +    --watchdog=0 \
> > +    --filepath="${BINARIES_DIR}"/boot-a-part/BGENV.DAT \
> > +    --revision=2 \
> > +    --ustate=OK \
> > +    --kernel="C:boot-a:bzImage" \
> > +    --args="root=PARTLABEL=system-a $KERNEL_CMDLINE"
> > +
> > +# Create efibootguard boot-a slot configuration (unbootable)
>
>   boot-b?

Thanks, changed.


> > +mkdir -p "${BINARIES_DIR}"/boot-b-part
> > +printf "boot-b" | iconv -f ascii -t UTF-16LE > "${BINARIES_DIR}"/boot-b-part/EFILABEL
> > +"${HOST_DIR}"/bin/bg_setenv \
> > +    --verbose \
> > +    --watchdog=0 \
> > +    --filepath="${BINARIES_DIR}"/boot-b-part/BGENV.DAT \
> > +    --revision=1 \
> > +    --ustate=FAILED \
> > +    --kernel="C:boot-b:bzImage" \
> > +    --args="root=PARTLABEL=system-b $KERNEL_CMDLINE"
> > +
> > +# Copy kernel into boot-a.
> > +cp "${BINARIES_DIR}"/bzImage "${BINARIES_DIR}"/boot-a-part/
>
>   I think it makes more sense to do all of the above in post-image as well.
> post-build is meant for manipulations of TARGET_DIR.

Do you mean move it into post-image instead of post-build? Your
reasoning makes sense to me.


> > diff --git a/board/pc-efibootguard/post-image.sh b/board/pc-efibootguard/post-image.sh
> > new file mode 100755
> > index 0000000000..eec88f707d
> > --- /dev/null
> > +++ b/board/pc-efibootguard/post-image.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +set -e
> > +
> > +UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
> > +sed "s/UUID_TMP/$UUID/g" board/pc-efibootguard/genimage.cfg > "$BINARIES_DIR/genimage.cfg"
>
>   There is no UUID_TMP in that file...

Thanks; that was leftover from the project this came from. Removed.


> > +support/scripts/genimage.sh -c "$BINARIES_DIR/genimage.cfg"
> > diff --git a/board/pc-efibootguard/run-image-qemu.sh b/board/pc-efibootguard/run-image-qemu.sh
> > new file mode 100755
> > index 0000000000..32be727c3e
> > --- /dev/null
> > +++ b/board/pc-efibootguard/run-image-qemu.sh
> > @@ -0,0 +1,9 @@
> > +#!/bin/sh
> > +
> > +qemu-system-x86_64 \
> > +  -M pc \
> > +  -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE_4M.fd \
> > +  -drive file=output/images/disk.img,if=virtio,format=raw \
> > +  -boot menu=on \
> > +  -net nic,model=virtio \
> > +  -net user
>
>   We don't usually have such a script, it's just part of the readme.txt.

Thanks; removed the script and put it in the readme.txt file.


> > diff --git a/configs/pc_x86_64_efibootguard_defconfig b/configs/pc_x86_64_efibootguard_defconfig
> > new file mode 100644
> > index 0000000000..7220b2d7ce
> > --- /dev/null
> > +++ b/configs/pc_x86_64_efibootguard_defconfig
> > @@ -0,0 +1,51 @@
> > +BR2_x86_64=y
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>
>   We expect new and updated defconfigs to switch to the Bootlin glibc stable
> toolchain (if appropriate) in order to limit build time. This is unfortunately
> still undocumented, except for the report of the meeting where it was decided [1].

Thanks; I will modify that in the next version.


> > +BR2_GLOBAL_PATCH_DIR="board/pc/patches"
> > +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc-efibootguard/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc-efibootguard/post-image.sh"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
>
>   You can use 6.18.33 now.

Thanks; I will modify that in the next version.


Cheers!

Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
