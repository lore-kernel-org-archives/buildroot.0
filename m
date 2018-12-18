From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:33:39 +0100
Subject: [Buildroot] [PATCH 2/4] skeleton: use BR2_SYSTEM_DEFAULT_PATH
 as default PATH
In-Reply-To: <20181218005116.17435-3-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-3-mmayer@broadcom.com>
Message-ID: <20181218193339.GD24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-17 16:51 -0800, Markus Mayer spake thusly:
> We substitute the path specified in system/skeleton/etc/profile with
> the path specified in the configuration varialbe
> BR2_SYSTEM_DEFAULT_PATH.

You forgot to state in the commit log that $(BR2_SYSTEM_DEFAULT_PATH) is
a kconfig string, so it is already quoted, and that's what we want it to
be in the file.

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 3 +++
>  system/skeleton/etc/profile                          | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index e8a052205268..358336599389 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -22,6 +22,9 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
>  	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
>  		$(TARGET_DIR_WARNING_FILE)
> +	$(SED) '/.*the PATH below may be replaced.*/d' $(TARGET_DIR)/etc/profile
> +	$(SED) 's|PATH=.*|PATH=$(BR2_SYSTEM_DEFAULT_PATH)|' \
> +		$(TARGET_DIR)/etc/profile
>  endef
>  
>  # We don't care much about what goes in staging, as long as it is
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 1255d23ff40d..5ed47743d8f4 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -1,3 +1,4 @@
> +# At install, the PATH below may be replaced with BR2_SYSTEM_DEFAULT_PATH.
>  export PATH=/bin:/sbin:/usr/bin:/usr/sbin
>  
>  if [ "$PS1" ]; then
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
