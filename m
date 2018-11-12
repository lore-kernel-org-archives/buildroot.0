From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2018 23:09:13 +0100
Subject: [Buildroot] [PATCH 2/6 v2] fs/tar: add support for xattrs (thus
 capabilties)
In-Reply-To: <0b788d4ef7c7f0d02c1a15b31a69d08de3401abe.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <0b788d4ef7c7f0d02c1a15b31a69d08de3401abe.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <f15d05f6-0b97-3c9a-d485-71e181ad7a6e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 18:33, Yann E. MORIN wrote:
> By default, tar will not include any extended attribute (xattr) when
> creating archives, and thus will not store capabilties either (as they
> are stored in the xattr 'security.capability').

 So... currently capabilities are not included at all in the tarball, since
--xattrs is not passed at the moment?

 But after this patch, they are still not included? Or does --xattrs-include
imply --xattrs?

> 
> Using option --xattrs is enough to create a tarball with all the xattrs
> attached to a file. However, extracting all xattrs from a tarball
> requires that --xattrs-include='*' be used. This is not symetric (but on
> purpose, as per the documentation), and so is confusing to some.
> 
> So, we use --xattrs-include='*' to create the archive, so as to be
> explicit that we want all xattrs to be stored.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  fs/tar/tar.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> index 68149e9eb7..4c6327ace8 100644
> --- a/fs/tar/tar.mk
> +++ b/fs/tar/tar.mk
> @@ -10,7 +10,7 @@ ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
>  
>  define ROOTFS_TAR_CMD
>  	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
> -		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
> +		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)

 I think --xattrs-include should come before TAR_OPTS, so it can still be
overridden. Ah, darn, never mind, it can't be overridden, several
--xattrs-include options are cumulative and their order doesn't matter.

 Regards,
 Arnout

>  endef
>  
>  $(eval $(rootfs))
> 
