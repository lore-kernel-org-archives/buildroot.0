From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 May 2019 22:40:49 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/nfs-utils: fix unnecessary
 files removal
In-Reply-To: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
References: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <0761f786-b4ff-ce13-34f5-d404bbf0d443@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 11:02, Angelo Compagnucci wrote:
> Removing of unnecessary files is actually broken by the fact that the rm
> command is executed inside build directory and not the target directory.
> 
> This patch fixes the problem changing to target directory before
> removing files.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v3->v4: separate fix patch as requested by Arnout
> 
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 9fa7ae2..4bb62de 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -57,7 +57,7 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
>  endif
>  
>  define NFS_UTILS_INSTALL_FIXUP
> -	rm -f $(NFS_UTILS_TARGETS_)
> +	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)

 Personally, I'd have used $(addprefix) instead of cd, but that's just my own
thing, so: applied to master, thanks.

 Regards,
 Arnout


>  	touch $(TARGET_DIR)/etc/exports
>  	$(INSTALL) -D -m 644 \
>  		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
> 
