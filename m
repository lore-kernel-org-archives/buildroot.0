From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 14:23:16 +0100
Subject: [Buildroot] [PATCH] package/gnupg: fix TAR path in gpg-zip
 script
In-Reply-To: <20191226221437.1301418-1-thomas.petazzoni@bootlin.com>
References: <20191226221437.1301418-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230132316.GQ26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-26 23:14 +0100, Thomas Petazzoni spake thusly:
> gnupg installs a shell script called gpg-zip, which contains a
> reference to the 'tar' program. Unfortunately, the location of the tar
> program is determined at build time, and is therefore incorrect on the
> target. This causes runtime issues, but also potentially leaks some
> host paths into the target, causing BR2_REPRODUCIBLE=y failures.
> 
> gnupg has a --with-tar option, but it doesn't work properly as the
> implementation of the GNUPG_CHECK_USTAR m4 macro in m4/tar-ustar.m4 is
> incomplete:
> 
>  - If --with-tar is passed, AC_PATH_PROG is not called, so the TAR
>    variable is not defined and AC_SUBST([TAR]) is not called, so the
>    @TAR@ replacement in tools/gpg-zip.in is replaced by the empty
>    string.
> 
>  - If --with-tar is passed, the check that this tar version support
>    the ustar format is not executed, so the HAVE_USTAR automake
>    conditional is never defined. There is unfortunately no way to
>    determine if the target tar supports ustar or not, but since even
>    the Busybox variant apparently does, we can probably assume all tar
>    versions that Buildroot can build support the ustar format.
> 
> Fixing this logic is a bit cumbersome, gnupg 1.4.x is not really
> maintained anymore and fixing the logic would require an AUTORECONF =
> YES.
> 
> So we just opt with a very simple solution: replace TAR=something by
> TAR=/bin/tar, through a post-install target hook. We only do this if
> gpg-zip is installed, since its installation is optional. Note that
> the logic is still not ideal, because the installation (or not) of
> gpg-zip depends on whether the system/host tar has ustar format or
> not.

But isn't that always the case, in practice? If the host has 
1.27 <= tar <= 1.29, then we use it, and that has support for ustar.
Otherwise, we build tar 1.29, and that also has ustar.

But OK, that's good enough as-is. Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes the gpg-zip reproducibility issue reported in:
> 
>   http://autobuild.buildroot.net/results/d1c/d1c5ad34ba928edfbb5901eb936c7e4457cc9083//diffoscope-results.txt
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gnupg/gnupg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
> index bedcf6c985..617def884e 100644
> --- a/package/gnupg/gnupg.mk
> +++ b/package/gnupg/gnupg.mk
> @@ -79,5 +79,11 @@ endef
>  GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGSPLIT
>  endif
>  
> +define GNUPG_FIXUP_GPG_ZIP
> +	test -f $(TARGET_DIR)/usr/bin/gpg-zip && \
> +		$(SED) 's%^TAR=.*%TAR=/bin/tar%' $(TARGET_DIR)/usr/bin/gpg-zip
> +endef
> +GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_FIXUP_GPG_ZIP
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.24.1
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
