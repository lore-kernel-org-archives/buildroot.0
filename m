From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2019 00:13:11 +0100
Subject: [Buildroot] [PATCH v2] skeleton-init-common: improve /etc/hosts
 generation
In-Reply-To: <20181019135824.981-1-casantos@datacom.com.br>
References: <20181019135824.981-1-casantos@datacom.com.br>
Message-ID: <41da8c03-8637-cfab-d146-fd4ad3814254@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2018 15:58, Carlos Santos wrote:
> If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
> add it as an alias, e.g.
> 
>     127.0.1.1	hostname.example.com hostname
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1->v2: remove stray "else"
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index e8a0522052..02f86df359 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -41,10 +41,15 @@ SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_M
>  SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
>  
>  ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
> +SKELETON_INIT_COMMON_HOSTS_LINE = $(SKELETON_INIT_COMMON_HOSTNAME)
> +SKELETON_INIT_COMMON_SHORT_HOSTNAME = $(firstword $(subst ., ,$(SKELETON_INIT_COMMON_HOSTNAME)))
> +ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),$(SKELETON_INIT_COMMON_SHORT_HOSTNAME))
> +SKELETON_INIT_COMMON_HOSTS_LINE += $(SKELETON_INIT_COMMON_SHORT_HOSTNAME)
> +endif
>  define SKELETON_INIT_COMMON_SET_HOSTNAME
>  	mkdir -p $(TARGET_DIR)/etc
>  	echo "$(SKELETON_INIT_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
> -	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTNAME)' \
> +	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTS_LINE)' \
>  		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
>  endef
>  SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_HOSTNAME
> 
