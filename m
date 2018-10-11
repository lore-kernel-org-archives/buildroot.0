From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 21:49:32 +0200
Subject: [Buildroot] [PATCH 1/1] board/pc: improve image generation
In-Reply-To: <20180920143318.21284-1-greg@quimbo.fr>
References: <20180920143318.21284-1-greg@quimbo.fr>
Message-ID: <20181011214932.350ef220@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gr?goire,

Thanks a lot for this patch, sorry for the slow answer.

On Thu, 20 Sep 2018 16:33:19 +0200, Gr?goire Delattre wrote:
> From: Gr?goire Delattre <gregoire.delattre@gmail.com>
> 
> Copy the grub configuration files before creating the filesystem
> image.

I think the commit title is a bit vague, "improve" doesn't mean much
and in fact, your patch fixes a real bug in this defconfig!

So perhaps:

	board/pc: ensure grub.cfg is copied to target filesystem

and then in the commit log, explain that the grub.cfg file was copied
to TARGET_DIR in a post-image hook, i.e after the filesystem image has
been generated, and that in practice it worked because the
board/pc/grub-bios.cfg file is the same as boot/grub2/grub.cfg, which
*is* copied to TARGET_DIR as part of the grub2 build process.

Some more comments below.

> +# Detect boot strategy, EFI or BIOS
> +if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
> +  cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
> +else
> +  cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"

I think you could copy the boot.img to ${BINARIES_DIR} here as well. A
post-build script is called after all packages have been built, so
${HOST_DIR}/lib/grub/i386-pc/boot.img already exists. This would avoid
the need for the pre-genimage.sh.

Could you rework those minor details and send an updated patch?

Thanks a lot for spotting this mistake!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
