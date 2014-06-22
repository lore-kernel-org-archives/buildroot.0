From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 16:07:58 +0200
Subject: [Buildroot] [PATCH 2 of 5 RFC] uclibc: update-config: preserve
 freshly configured settings
In-Reply-To: <62a7dd35bfbf4687864f.1403444741@localhost>
References: <patchbomb.1403444739@localhost>
 <62a7dd35bfbf4687864f.1403444741@localhost>
Message-ID: <20140622140758.GD3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> In the sequence:
> 
> make uclibc-menuconfig
> make uclibc-update-config
> 
> the freshly configured settings from the menuconfig are lost during the
> update-config step. This is because update-config depends on the configure
> step, which starts by copying the config file to the build directory.
> 
> Instead, stop depending on the configure step from update-config, and
> explicitly call the needed commands before actually copying the config file.
> 
> This has the added bonus that 'uclibc-update-config' no longer needs the
> toolchain to be available, which makes:
>     make clean uclibc-menuconfig uclibc-update-config
> much faster and user-friendly.
> 
> Fixes bug #7154 https://bugs.busybox.net/show_bug.cgi?id=7154
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/uclibc.mk |  9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff -r 97d74ccbe054 -r 62a7dd35bfbf package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Mon Jun 16 20:18:23 2014 +0200
> @@ -554,11 +554,16 @@
>  		DEVEL_PREFIX=/usr/ \
>  		RUNTIME_PREFIX=$(STAGING_DIR)/ \
>  		menuconfig
> -	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
> +	rm -f $(UCLIBC_DIR)/.stamp_{config_file_fixed,configured,built}
> +	rm -f $(UCLIBC_DIR)/.stamp_{target_installed,staging_installed}
>  
>  $(eval $(generic-package))
>  
> -uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
> +$(UCLIBC_DIR)/.stamp_config_file_fixed:
> +	$(UCLIBC_SETUP_DOT_CONFIG)
> +	touch $@
> +
> +uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_file_fixed
>  	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>  
>  # Before uClibc is built, we must have the second stage cross-compiler
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
