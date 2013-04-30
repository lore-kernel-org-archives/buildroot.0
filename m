From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2013 18:59:00 +0200
Subject: [Buildroot] [PATCH v2 3/3] rootfs-overlay: use a make foreach
 instead of a shell for
In-Reply-To: <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <517FF854.9090903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/13 18:50, Luca Ceresoli wrote:
> Makes the code uniform with the post-build and post-image implementation
> (which is slightly simpler and, presumably, more efficient).
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I thought about the possibility to refactor these three use cases into 
a single make function, but it would actually just complicate things.

  Regards,
  Arnout

> ---
>   Makefile |    7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f475d1b..a3b98f3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -501,13 +501,12 @@ endif
>   		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
>   	) >  $(TARGET_DIR)/etc/os-release
>
> -	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
> -		$(call MESSAGE,"Copying overlay $${dir}"); \
> +	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
> +		$(call MESSAGE,"Copying overlay $(d)"); \
>   		rsync -a \
>   			--exclude .empty --exclude .svn --exclude .git \
>   			--exclude .hg --exclude '*~' \
> -			$${dir}/ $(TARGET_DIR); \
> -	done
> +			$(d)/ $(TARGET_DIR)$(sep))
>
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>   		$(call MESSAGE,"Executing  post-build script $(s)"); \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
