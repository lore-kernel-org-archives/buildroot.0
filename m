From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2015 23:30:00 +0200
Subject: [Buildroot] [PATCH 06/12] fs/iso9660: change the location of
 the splash image
In-Reply-To: <1433430330-2166-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605213000.GF3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> In order to simplify the introduction of the support for using ISO9660
> as the real root filesystem, this commit changes the location of the
> grub splash image. This makes it match where the splash image in
> $(TARGET_DIR).

It looks like that last sentence is incorrect (missing verb?) and I had
a bit of a hard time udnerstanding what it meant (but see later).

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Comments below...)

> ---
>  fs/iso9660/iso9660.mk | 2 +-
>  fs/iso9660/menu.lst   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 0c7ef3b..80971d3 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -16,7 +16,7 @@ endef
>  else
>  define ROOTFS_ISO9660_SPLASHSCREEN
>  	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
> -		$(ROOTFS_ISO9660_TARGET_DIR)/splash.xpm.gz
> +		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz

Since iso9660 already depends on grub, grub would have already installed
that file in $(TARGET_DIR)   (and that's where I finally understood that
sentence of yours, above).

Also, fs images are generated after the post-build scripts and rootfs
overlays, which would leave to the user the option to replace the
bootsplash with its own.

So. maybe we should grab the image from $(TARGET_DIR) rather than picking
it from the grub package?

Of course, that should be a separate patch.

Regards,
Yann E. MORIN.

>  endef
>  endif
>  
> diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
> index c0bbff6..fd5c76a 100644
> --- a/fs/iso9660/menu.lst
> +++ b/fs/iso9660/menu.lst
> @@ -5,7 +5,7 @@ timeout		10
>  color 		cyan/blue white/blue
>  
>  # Gets enabled/disabled depending on Grub support for splashimage
> -splashimage	/splash.xpm.gz
> +splashimage	/boot/grub/splash.xpm.gz
>  
>  # Used when a splashimage is enabled
>  foreground 	000000
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
