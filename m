From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Nov 2016 22:33:28 +0100
Subject: [Buildroot] [PATCH] Makefile: fix ignored trace at
 target-finalize
In-Reply-To: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
References: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161122213328.GB3529@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga"el, All,

On 2016-11-22 15:53 -0500, Ga?l PORTAY spake thusly:
> Make may throw an error (but ignored) trace when cleaning up the
> rootfs.
> 
> The target-finalize rule intends to remove the folder
> `$(TARGET_DIR)/usr/share' but this directory may still contain items
> (such as the `udhcpc' helper script) and causes the rmdir to fail.
> 
> The stderr output is redirected to /dev/null but it returns and error
> which is escaped by the leading `-'; but make reports an ignored-error.
> 
> See the log below:
> $ make
> (...)
> rm -rf (...)/target/usr/share/gtk-doc
> rmdir (...)/target/usr/share
> rmdir: failed to remove '(...)/target/usr/share': Directory not empty
> make[1]: [Makefile:650: target-finalize] Error 1 (ignored)
> find /(...)/target -type f \( -perm /111 -o -name '*.so*' \) -not \( -name 'libpthread*.so*' -o -name 'ld-*.so*' -o -name '*.ko' \) -print0 | xargs -0 (...)/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip --remove-section=.comment --remove-section=.note 2>/dev/null || true
> 
> This patch apply the same rule at the instruction immediately after:
> * redirecting stderr to /dev/null (already done) and
> * executing true if the `rmdir' instruction fails.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 37e4bd4..7f162e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -656,7 +656,7 @@ endif
>  	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
>  	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
>  	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
> -	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
> +	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
>  	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
>  
>  # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
> -- 
> 2.10.2
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
