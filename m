From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 28 Jan 2015 01:06:47 +0100
Subject: [Buildroot] [PATCH 2/4] boot/syslinux: bump version to 6.03
In-Reply-To: <20150126232217.04b2fec1@free-electrons.com>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>	<1421710198-20898-2-git-send-email-romain.naour@openwide.fr>
 <20150126232217.04b2fec1@free-electrons.com>
Message-ID: <54C82817.5060804@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/01/2015 23:22, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Tue, 20 Jan 2015 00:29:56 +0100, Romain Naour wrote:
>> Remove gnu-efi dependency since it's directly included in
>> syslinux sources since 6.03 release. Also remove the patch
>> for find-gnu-efi.sh script which was removed.
> 
> The script has been renamed to
> output/build/syslinux-6.03/efi/check-gnu-efi.sh. And its contents seems
> to hint that syslinux can use an external gnu-efi installation, which
> would be the preferred solution in Buildroot. Can you investigate this?
> Of course, if there is no upstream supported way of using an external
> gnu-efi installation, then leave things as is in your current patch.

I checked if an external gnu-efi can be used but it's hard coded in
build-gnu-efi.sh.

The gnu-efi build start in mk/efi.mk line 51 by calling:
$(topdir)/efi/check-gnu-efi.sh $(EFI_SUBARCH) $(objdir)

Where:
topdir = output/build/syslinux-6.03
EFI_SUBARCH = ia32
objdir = output/build/syslinux-6.03/efi32 (build output directory)

The script check-gnu-efi.sh test if gnu-efi needs to be build.
If yes, it call build-gnu-efi.sh

The path to gnu-efi is hard coded by EFIDIR:
EFIDIR="$(readlink -f "$objdir/../gnu-efi/gnu-efi-3.0")"

I tried to comment this line and define EFIDIR=$(GNU_EFI_DIR) in
SYSLINUX_BUILD_CMDS.
But there are some build issues to be investigated.

But clearly, external gnu-efi is not supported anymore...

> Also, if the gnu-efi dependency really needs to be removed, you also
> need to remove the "select" in syslinux Config.in file.

Indeed, I forgot to remove the "select", thanks.

> 
> Thanks!
> 
> Thomas
> 
