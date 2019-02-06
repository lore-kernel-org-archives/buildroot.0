From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:43:52 +0100
Subject: [Buildroot] [PATCH v2] configs/pc: add a configuration to build
 a UEFI+GPT image
In-Reply-To: <20180929031609.8939-1-casantos@datacom.com.br>
References: <20180929031609.8939-1-casantos@datacom.com.br>
Message-ID: <20190206174352.7165ec29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Sep 2018 00:16:09 -0300
Carlos Santos <casantos@datacom.com.br> wrote:

> This is an example of how to craft a disk image with GPT partitioning
> instead of MBR. This is achieved by means of a post-image script which
> uses mkdosfs+mcopy+sfdisk, since genimage is unable to deal with GPT.
> 
> The script was kept as simple as possible to make it easy to understand
> and adapt for other purposes.
> 
> The root filesystem location is passed to the kernel by a partition
> UUID, so it is possible to boot on QEMU, directly from the disk image,
> or dump the image to a physical device.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1->v2:
> Fix commit message ("ane", spurious "the").
> ---
>  board/pc/post-image-efi-gpt.sh      | 62 ++++++++++++++++++++++++++++
>  board/pc/readme.txt                 |  6 ++-
>  configs/pc_x86_64_efi_gpt_defconfig | 64 +++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+), 1 deletion(-)
>  create mode 100755 board/pc/post-image-efi-gpt.sh
>  create mode 100644 configs/pc_x86_64_efi_gpt_defconfig

After discussing with Arnout, we decided that there was not much point
in having an EFI configuration on one side and an EFI+GPT configuration
on the other side. Indeed, all EFI systems support GPT partition
tables. So I just took your configuration, and used it to replace the
existing pc_x86_64_efi_defconfig. I did the related adjustements as
well (hopefully correctly), such as dropping from
board/pc/post-build.sh the bits that are no longer needed.

Feel free to give it a test!

Long term of course, having support for GPT in genimage would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
