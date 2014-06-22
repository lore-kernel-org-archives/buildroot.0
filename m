From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 16:05:01 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <97d74ccbe054d9a16465.1403444740@localhost>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
Message-ID: <20140622140501.GC3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> When uclibc-menuconfig is executed from a clean repo, and a custom
> configuration file was set, then these custom settings are ignored and
> uclibc starts from the default configuration.
> 
> This patch adds an explicit copy of the custom config file to the menuconfig
> target to fix 'make clean uclibc-menuconfig'.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/uclibc.mk |  7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff -r 5ea6db6a0838 -r 97d74ccbe054 package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Fri Jun 20 23:38:46 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
> @@ -413,8 +413,11 @@
>  	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
>  	HOSTCC="$(HOSTCC)"
>  
> +define UCLIBC_COPY_DOT_CONFIG
> +	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
> +endef
> +
>  define UCLIBC_SETUP_DOT_CONFIG
> -	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
>  	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
>  	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
>  	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
> @@ -454,6 +457,7 @@
>  endef
>  
>  define UCLIBC_CONFIGURE_CMDS
> +	$(UCLIBC_COPY_DOT_CONFIG)
>  	$(UCLIBC_SETUP_DOT_CONFIG)
>  	$(MAKE1) -C $(UCLIBC_DIR) \
>  		$(UCLIBC_MAKE_FLAGS) \
> @@ -543,6 +547,7 @@
>  endef
>  
>  uclibc-menuconfig: uclibc-patch
> +	$(UCLIBC_COPY_DOT_CONFIG)
>  	$(MAKE1) -C $(UCLIBC_DIR) \
>  		$(UCLIBC_MAKE_FLAGS) \
>  		PREFIX=$(STAGING_DIR) \
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
