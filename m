From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 15:50:31 +0100
Subject: [Buildroot] [PATCH v3 1/9] package/skeleton-init-common: add
 /bin/sh to /etc/shells
In-Reply-To: <1516356909-18620-2-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-2-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203145031.GB2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> Add the default shell /bin/sh to /etc/shells only if BR2_SYSTEM_BIN_SH_NONE
> is not selected.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>o

Regards,
Yann E. MORIN.

> ---
> v3: Fix typo (Thomas)
>     Use TARGET_FINALIZE_HOOKS to avoid issues with the upcoming
>     top-level parallel build (Arnout)
> v2: add double-dollar after /bin/sh (Yann)
>     remove empty /etc/shells from skeleton (Yann, Peter)
>     move the hook right after it's defined (Yann)
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index 8228a81..e8a0522 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -79,6 +79,13 @@ define SKELETON_INIT_COMMON_SET_BIN_SH
>  	rm -f $(TARGET_DIR)/bin/sh
>  endef
>  else
> +# Add /bin/sh to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
> +	grep -qsE '^/bin/sh$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/sh" >> $(TARGET_DIR)/etc/shells
> +endef
> +SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
>  ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
>  define SKELETON_INIT_COMMON_SET_BIN_SH
>  	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
> -- 
> 2.7.4
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
