From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Mar 2021 23:15:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.14.2
In-Reply-To: <20210327171336.95774-2-bernd.kuhls@t-online.de>
References: <20210327171336.95774-1-bernd.kuhls@t-online.de>
 <20210327171336.95774-2-bernd.kuhls@t-online.de>
Message-ID: <20210327221507.GA24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-03-27 18:13 +0100, Bernd Kuhls spake thusly:
> Added patch to fix build error.
> Removed patch which was applied upstream.
> 
> Added two options to samba4-cache.txt to fix cross build.

Please explain why you used those specific values for thos e two
options, see below...

> host-perl is now mandatory, also host-perl-parse-yapp is needed.
> 
> Added option to fix build without dbus, this change needed a rework of
> the shared-modules configure option, due to this upstream commit:
> https://gitlab.com/samba-team/devel/samba/-/commit/b6805d5e0bcf1716f87e84bcbb2fd8f93c38a8a3
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
> index e3a3720fc8..bd7c3654b4 100644
> --- a/package/samba4/samba4-cache.txt
> +++ b/package/samba4/samba4-cache.txt
> @@ -40,3 +40,5 @@ Checking value of SIGRTMIN: "34"
>  Checking errno of iconv for illegal multibyte sequence: "0"
>  checking for clnt_create(): OK
>  Checking for a 64-bit host to support lmdb: NO
> +Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
> +Checking value of GNUTLS_MAC_AES_CMAC_128: 203

So, those two options are abotu cryptography stuff, and so this is
pretty much tricky... We really need those values to be explained, at
least in the commit log, and if possible, with a comment in the cache
file.

> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 61d8190127..ef4ffce47c 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
[--SNIP--]
> @@ -125,6 +130,7 @@ define SAMBA4_CONFIGURE_CMDS
>  			--disable-glusterfs \
>  			--with-cluster-support \
>  			--bundled-libraries='!asn1_compile,!compile_et' \
> +			 --with-shared-modules=$(SAMBA4_SHARED_MODULES) \

Extraneous space just before the option.

Also see below for another issue with this line...

>  			$(SAMBA4_CONF_OPTS) \
>  	)
>  endef
> @@ -148,8 +154,9 @@ SAMBA4_CONF_OPTS += --without-ad-dc --without-json
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
> -SAMBA4_CONF_OPTS += --with-ads --with-ldap --with-shared-modules=idmap_ad
> +SAMBA4_CONF_OPTS += --with-ads --with-ldap
>  SAMBA4_DEPENDENCIES += openldap
> +SAMBA4_SHARED_MODULES += idmap_ad
>  else
>  SAMBA4_CONF_OPTS += --without-ads --without-ldap

Usually, we want to be symetric, so we should have:

    SAMBA4_SHARED_MODULES += !idmap_ad

Finally, the way SAMBA4_SHARED_MODULES is used, --with-shared-modules
will get a space-separated list of items, but it is not quoted when
expanded, above (quoted here again:

    --with-shared-modules=$(SAMBA4_SHARED_MODULES)

So if both vfs_snapper and idmap_ad are enabled, I doubt that will
behave as expected... Furthermore, --with-shared-modules is expected to
be comma-separated:

    https://gitlab.com/samba-team/devel/samba/-/blob/master/source3/wscript#L32

    Comma-separated list of names of modules to build shared. [...]

So you probably want something like:

    --with-shared-modules=$(subst $(space),$(comma),$(strip $(SAMBA4_SHARED_MODULES)))

Regards,
Yann E. MORIN.

>  endif
> -- 
> 2.29.2
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
