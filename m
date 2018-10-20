From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2018 13:09:57 +0100
Subject: [Buildroot] [PATCH] skeleton-init-common: improve /etc/hosts
 generation
In-Reply-To: <20181019133802.19627-1-casantos@datacom.com.br>
References: <20181019133802.19627-1-casantos@datacom.com.br>
Message-ID: <b07b2dbf-f9a0-4dfa-31eb-c294e3c55a9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2018 14:38, Carlos Santos wrote:
> If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
> add it as an alias, e.g.
> 
>     127.0.1.1	hostname.example.com hostname
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index e8a0522052..93a410914a 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -41,10 +41,16 @@ SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_M
>  SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
>  
>  ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
> +SKELETON_INIT_COMMON_HOSTS_LINE = $(SKELETON_INIT_COMMON_HOSTNAME)
> +SKELETON_INIT_COMMON_SHORT_HOSTNAME = $(firstword $(subst ., ,$(SKELETON_INIT_COMMON_HOSTNAME)))
> +ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),$(SKELETON_INIT_COMMON_SHORT_HOSTNAME))
> +SKELETON_INIT_COMMON_HOSTS_LINE += $(SKELETON_INIT_COMMON_SHORT_HOSTNAME)
> +else
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
