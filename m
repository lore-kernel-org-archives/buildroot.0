From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 21:41:04 +0200
Subject: [Buildroot] [PATCH v3] u-boot: allow to pass a custom
 configuration file
In-Reply-To: <1399904527-8159-1-git-send-email-eric.jarrige@armadeus.org>
References: <1399904527-8159-1-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <20140512214104.06380d52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Jarrige,

On Mon, 12 May 2014 16:22:07 +0200, Eric Jarrige wrote:
> Add an option BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE that makes it possible
> to override the configuration options in the board header file. This
> avoids the need for manipulating the board header file with sed hacks
> like is currently done for the BR2_TARGET_UBOOT_NETWORK settings.
> 
> Note that this option does not make it possible to add a new board to
> U-Boot. That still has to be done by patching the source.
> 
> Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
> ---
> 
> Changes v2 -> v3:
>  - refactoring based on uClibc/BusyBox model (suggested by Thomas and Arnoult)
>  - add missing help text (suggested by Arnoult)
>  - copy custom configuration file to legal info (suggested by Yann)
> Changes v1 -> v2:
>  - Fix typo
> 
>  boot/uboot/Config.in |    8 ++++++++
>  boot/uboot/uboot.mk  |   18 ++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 1c77f6a..299d50f 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -79,6 +79,14 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  
>  	  Most users may leave this empty
>  
> +config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	help
> +	  Path to the modified configuration header file. It will be
> +	  copied to include/configs/<boardname>.h in the U-Boot sources.
> +	  Note that this doesn't allow you to create a custom board,
> +	  only to modify some of configuration variables.

I must say I'm still unconvinced by this patch. In U-Boot, the
configuration is completely mixed with the definition of the board, and
defining a board does not only require adding a file in
include/configs/, but also adding an entry in boards.cfg.

Therefore, I really believe that people willing to customize their
U-Boot board or configuration should instead carry a patch against
U-Boot instead of using this non-standard solution.

Moreover, it looks like U-Boot is progressively moving towards a
kbuild/kconfig approach (kbuild step is done, I guess kconfig is the
next step), which should on the long run make U-Boot closer to the
Linux kernel or Barebox in terms of configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
