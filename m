From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 17:32:27 +0200
Subject: [Buildroot] [PATCH 1/1] coreutils: handle merged usr folder
In-Reply-To: <1445149965-15702-1-git-send-email-james.knight@rockwellcollins.com>
References: <1445149965-15702-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151018153227.GC3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-10-18 02:32 -0400, James Knight spake thusly:
> For targets prepared with a usr-move, coreutils should not be attempting
> to move binaries from `usr/bin` to `bin`.

For the records, pleas see comments already made on the patch doing the
same for sed:
    http://lists.busybox.net/pipermail/buildroot/2015-October/142230.html

> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/coreutils/coreutils.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index bb2ef96..60455ac 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -99,18 +99,24 @@ COREUTILS_CONF_OPTS += --with-openssl=yes
>  COREUTILS_DEPENDENCIES += openssl
>  endif
>  
> -define COREUTILS_POST_INSTALL
> +ifeq ($(BR2_ROOTFS_MERGED_USR),)
> +define COREUTILS_CLEANUP_BIN
>  	# some things go in root rather than usr
>  	for f in $(COREUTILS_BIN_PROGS); do \
>  		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
>  	done
> +endef
> +COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
> +endif
> +
> +define COREUTILS_CLEANUP
>  	# link for archaic shells
>  	ln -fs test $(TARGET_DIR)/usr/bin/[
>  	# gnu thinks chroot is in bin, debian thinks it's in sbin
>  	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
>  endef
>  
> -COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
> +COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
>  
>  # If both coreutils and busybox are selected, the corresponding applets
>  # may need to be reinstated by the clean targets.
> -- 
> 1.9.5.msysgit.1
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
