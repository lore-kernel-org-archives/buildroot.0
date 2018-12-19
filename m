From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Dec 2018 22:34:30 +0100
Subject: [Buildroot] [PATCH v2 2/4] skeleton: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
In-Reply-To: <20181219210455.14754-3-mmayer@broadcom.com>
References: <20181219210455.14754-1-mmayer@broadcom.com>
 <20181219210455.14754-3-mmayer@broadcom.com>
Message-ID: <20181219213430.GP24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-19 13:04 -0800, Markus Mayer spake thusly:
> We substitute the path specified in system/skeleton/etc/profile with
> the path specified in the configuration variable
> $(BR2_SYSTEM_DEFAULT_PATH).
> 
> $(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
> quoted, which is exactly what we want.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 1 +
>  system/skeleton/etc/profile                          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index e8a052205268..866273bbd7ee 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -22,6 +22,7 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
>  	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
>  		$(TARGET_DIR_WARNING_FILE)
> +	$(SED) 's, at PATH@,$(BR2_SYSTEM_DEFAULT_PATH),' $(TARGET_DIR)/etc/profile

I think we should keep the warning file the last command executed.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endef
>  
>  # We don't care much about what goes in staging, as long as it is
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 1255d23ff40d..db29e44920e8 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -1,4 +1,4 @@
> -export PATH=/bin:/sbin:/usr/bin:/usr/sbin
> +export PATH=@PATH@
>  
>  if [ "$PS1" ]; then
>  	if [ "`id -u`" -eq 0 ]; then
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
