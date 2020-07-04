From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2020 10:00:25 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: register NSS plugins in
 nsswitch.conf
In-Reply-To: <20200703234923.174320-1-nolange79@gmail.com>
References: <20200703234923.174320-1-nolange79@gmail.com>
Message-ID: <20200704080025.GC2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-04 01:49 +0200, Norbert Lange spake thusly:
> This supports 4 plugins, each will be added at the right
> spot if enabled, based on the template coming with systemd.
[--SNIP--]
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v3:
> *   basically a rewrite
> *   tested together with nss_mdns4 replacements
> ---
>  package/systemd/systemd.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8e01a0db5b..2e6c81bd75 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -473,7 +473,27 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
> +# anchor nss_resolve after files, if mymachines is also used, remove that first
> +# and add it back. this is necessary as other packages (mdns) move around
> +# the dns entry.
> +
> +define SYSTEMD_ADD_NSSCONFIG_HOOK
> +	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
> +		-e '/^group:/ {/systemd/! s/$$/ systemd/}' \
> +		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
> +			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
> +			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
> +		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
> +			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
> +		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
> +			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
> +			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines [SUCCESS=merge]/}' \
> +			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
> +		$(TARGET_DIR)/etc/nsswitch.conf
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +	SYSTEMD_ADD_NSSCONFIG_HOOK \

As I already said: ths must be a target-finalize hook, not a
post-install hook.

Regards,
Yann E. MORIN.

>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK
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
