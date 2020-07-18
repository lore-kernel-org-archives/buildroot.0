From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 09:43:07 +0200
Subject: [Buildroot] [PATCH v5] package/systemd: register NSS plugins in
 nsswitch.conf
In-Reply-To: <20200710221221.4444-1-nolange79@gmail.com>
References: <20200710221221.4444-1-nolange79@gmail.com>
Message-ID: <20200718074307.GK18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-11 00:12 +0200, Norbert Lange spake thusly:
> This supports 4 plugins, each will be added at the right
> spot if enabled, based on the template coming with systemd.
> 
> The sed replacements are carefully written to be idempotent,
> and to be robust enough to be combined with the other
> available packages (nss_mdns4) in any installation order.
> 
> nss-systemd is used for the DynamicUser features,
> which is a defacto necessity for systemd.
> It handles transient users/groups without
> touching the /etc/{passwd,group} files on disk.
> To support the 'SupplementaryGroups' feature,
> groups should be merged.
> 
> nss-myhostname allows resolving the hostname,
> again without touching files in /etc.
> 
> nss-mymachines adds name resolution from containers
> supported by machined.
> users from the containers might end up in system groups,
> so groups should be merged.
> 
> nss-resolve is part of resolved, and required for
> consistent dns lookups.
> 
> we anchor nss_resolve to appear after files, if mymachines is also
> used, remove that first (and add it back later). Other packages
> (mdns4) move around the dns entry, so replacing that is not a
> good option.
> 
> if mdns4 is installed aswell, then resolved will take precedence
> for host lookups.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Applied to master, thanks.

I've hoewver tweaked the commit log (rewrapped), and extended the part
about 'resolve' to explain why we use !UNAVAIL=return.

Thanks!

Regards,
Yann E. MORIN.

> ---
> v3:
> *   basically a rewrite
> *   tested together with nss_mdns4 replacements
> v4:
> *   use target install hook
> v5:
> *   also merge groups if nss-mymachines is disabled
> ---
>  package/systemd/systemd.mk | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8e01a0db5b..1a8eb86e53 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -494,6 +494,23 @@ define SYSTEMD_USERS
>  	$(SYSTEMD_TIMESYNCD_USER)
>  endef
>  
> +define SYSTEMD_INSTALL_NSSCONFIG_HOOK
> +	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
> +		-e '/^group:/ {/systemd/! s/$$/ [SUCCESS=merge] systemd/}' \
> +		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
> +			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
> +			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
> +		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
> +			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
> +		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
> +			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
> +			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
> +			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
> +		$(TARGET_DIR)/etc/nsswitch.conf
> +endef
> +
> +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
> +
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd provides multiple units to autospawn getty as neede
>  # * getty at .service to start a getty on normal TTY
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
