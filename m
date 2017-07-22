From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 01:38:35 +0200
Subject: [Buildroot] [PATCH 14/20] package/skeleton-common: simplify
 staging install
In-Reply-To: <b775d4628225bfdb820b80124374ab6ec584cf0c.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <b775d4628225bfdb820b80124374ab6ec584cf0c.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <0d50bda3-1cf0-8ce5-21c3-94b7f60d3ec5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> We don't really care what's going in staging, as long as it is properly
> setup for merged/non-merged /usr, especially for the lib/ directory.
> 
> So we can just copy the skeleton as-is.
> 
> This simplify the maintenance, should we ever need to tweak the layout:
> we'd just have to do it once in the skeleton directory to have it
> propagated to both target and staging.

 Yes, very nice, I like it!

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/skeleton-common/skeleton-common.mk | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
> index ee44eaf810..475c07e32d 100644
> --- a/package/skeleton-common/skeleton-common.mk
> +++ b/package/skeleton-common/skeleton-common.mk
> @@ -26,18 +26,14 @@ define SKELETON_COMMON_INSTALL_TARGET_CMDS
>  		$(TARGET_DIR_WARNING_FILE)
>  endef
>  
> -# For the staging dir, we don't really care about /bin and /sbin.
> -# But for consistency with the target dir, and to simplify the code,
> -# we still handle them for the merged or non-merged /usr cases.
> -# Since the toolchain is not yet available, the staging is not yet
> -# populated, so we need to create the directories in /usr
> +# We don't care much about what goes in staging, as long as it is
> +# correctly setup for merged/non-merged /usr. The simplest is to
> +# fill it in with the content of the skeleton.
>  define SKELETON_COMMON_INSTALL_STAGING_CMDS
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
> +	$(call SYSTEM_RSYNC,$(SKELETON_COMMON_PATH),$(STAGING_DIR))
>  	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
>  	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
>  endef
>  
>  SKELETON_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
