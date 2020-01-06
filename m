From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:01:50 +0100
Subject: [Buildroot] [PATCH v2] package/mender-grubenv: fix installation
 with genimage.sh script
In-Reply-To: <20190902223442.24880-1-aduskett@gmail.com>
References: <20190902223442.24880-1-aduskett@gmail.com>
Message-ID: <20200106230150.77830bc0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Sep 2019 15:34:41 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> mender-grubenv currently has 3 problems that prevent an x86_64-efi image from
> successfully being made with the genimage.sh script.
> 
> - mender-grubenv does not currently depend on Grub2.
>   While Grub2 is not needed to build the mender-grubenv package, Grub2 needs
>   to be built first for mender-grubenv to overwrite the default Grub2 files
>   reliably.
> 
> - The MENDER_GRUBENV_ENV_DIR variable points to /boot/efi/EFI/BOOT instead of
>   /boot/EFI/BOOT, which is where the Grub2 package installs the default files.
>   This variable now points to the correct location.
> 
> - The Grub2 package installs images to $(BINARIES_DIR)/efi-part, which the
>   mender-grubenv package currently does not do. As such; the default Grub2
>   configuration file is used instead of the one provided by mender-grubenv.
>   Adding a MENDER_GRUBENV_INSTALL_IMAGES_CMDS define in mender-grubenv.mk which
>   copies the installed files from $(TARGET_DIR)/boot/EFI to
>   $(BINARIES_DIR)/efi-part fixes this issue.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/mender-grubenv/mender-grubenv.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied to master with the following changes:

    [Thomas:
     - drop "runtime" on the depends on BR2_TARGET_GRUB2 since we now have
       a build-time dependency on it
     - explicitly copy the files installed by mender-grubenv in
       MENDER_GRUBENV_INSTALL_IMAGES_CMDS instead of blindly copying
       everything that is in $(TARGET_DIR)/boot/EFI]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
