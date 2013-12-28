From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 22:09:20 +0100
Subject: [Buildroot] [PATCH 8/9] fs/iso9660: add Grub splashscreen
	support
In-Reply-To: <1388242600-2580-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131228210920.GL3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 15:56 +0100, Thomas Petazzoni spake thusly:
> When Grub is built with splashscreen support, copy the splashscreen
> image to the ISO9660 filesystem. Otherwise, disable the splashscreen
> in the grub menu.lst file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  fs/iso9660/iso9660.mk | 5 +++++
>  fs/iso9660/menu.lst   | 5 ++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 56e87bb..0260d41 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -16,6 +16,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
>  	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
>  	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
>  	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +ifeq ($(BR2_TARGET_GRUB_SPLASH),)
> +	$(SED) '/splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +else
> +	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
> +endif
>  	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
> index ed7836a..b1ba3c9 100644
> --- a/fs/iso9660/menu.lst
> +++ b/fs/iso9660/menu.lst
> @@ -1,6 +1,9 @@
>  default		0
>  timeout		10
> -color cyan/blue white/blue
> +color 		cyan/blue white/blue
> +splashimage	/splash.xpm.gz
> +foreground 	000000
> +background 	cccccc

'foreground' and 'background' do not seem to be valid grub-legacy or
grub-2 options, at least according to their respective documentations:
  - grub-legacy (aka grub-0.9x):
    http://www.gnu.org/software/grub/manual/legacy/grub.html#color
  - grub-2:
    http://www.gnu.org/software/grub/manual/grub.html#Theme-File-Manual

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
