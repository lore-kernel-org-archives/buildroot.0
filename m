From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 18:47:25 +0200
Subject: [Buildroot] [PATCH 2/2] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <20190714162335.12684-2-itsatharva@gmail.com>
References: <20190714162335.12684-1-itsatharva@gmail.com>
 <20190714162335.12684-2-itsatharva@gmail.com>
Message-ID: <20190714164725.GB29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-07-14 21:53 +0530, Atharva Lele spake thusly:
> Pass the recommended argument in the CPIO manual to make cpio archives
> reproducible.
> 
> Reference: https://www.gnu.org/software/cpio/manual/cpio.html#Copy_002dpass-mode
> 
> Pre-patch diffoscope output: https://gitlab.com/snippets/1874745
> Post-patch: https://gitlab.com/snippets/1874746
> 
> We can see that post-patch, the archive related differences are removed.
> The differences are arising from utils/bin/getconf. This will have to
> be investigated further. However, that is unrelated to cpio.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added comment
>   - Build host-cpio if we are reproducible, reason is --reproducible
>     option does not exist prior to cpio 2.12. (suggested by Yann, Arnout)
> ---
>  fs/cpio/cpio.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 1f0cafe62f..521418f950 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -29,8 +29,16 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>  
>  ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
>  
> +# --repoducible option was not introduced until cpio v2.12. Some distros
> +# like Ubuntu 16.04 or Debian oldstable which package v2.11. Hence build
> +# host-cpio.
> +ifeq ($(BR2_REPRODUCIBLE), y)
> +ROOTFS_CPIO_DEPENDENCIES += host-cpio
> +CPIO_OPTS = --reproducible

Having a pure assignment in a condition is risky for the future. If we
were to later add new unconditional options, we would add them before
this part (as is customary to do: uncoditional stuff goes before
conditional stuff). In this case, the assignment here would override the
uncoditional options, which is not nice.

Instead, I think we prefer an append-assignment in conditional blocks,
even if the variable is not already defined.

Arnout, Thomas, can you confirm/infirm my opinion? ;-)

Otherwise:

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +endif
> +
>  define ROOTFS_CPIO_CMD
> -	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
> +	cd $(TARGET_DIR) && find . | cpio $(CPIO_OPTS) --quiet -o -H newc > $@
>  endef
>  
>  ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
> -- 
> 2.22.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
