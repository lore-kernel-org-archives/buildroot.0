From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Jul 2015 06:14:32 +0300
Subject: [Buildroot] [PATCH v2 1/1] e2fsprogs: remove busybox tune2fs
 when installing full version
In-Reply-To: <1436392260-55786-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436392260-55786-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20150709031432.GG12326@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Wed, Jul 08, 2015 at 04:51:00PM -0500, Ryan Barnett wrote:
> Currently, busybox installs a version of tune2fs in /sbin/ while
> e2fsprogs installs at /usr/sbin/. This causes issues if a user is
> expecting the to use the full version from a prompt via 'tune2fs'
> since busybox's tune2fs will be found first from the default path
> search.
> 
> Fix this by removing the busybox version of tune2fs when a user has
> selected the option to install tune2fs from e2fsprogs.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
> Changes v1 -> v2:
>   - add condition depenencies on busybox (suggested by Baruch)
> ---
>  package/e2fsprogs/e2fsprogs.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index e0c4ee2..e6a5027 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -36,7 +36,8 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  E2FSPROGS_CONF_ENV += LIBS=-lintl
>  endif
>  
> -E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
> +E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux \
> +	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  
>  E2FSPROGS_MAKE_OPTS = \
>  	LDCONFIG=true
> @@ -102,7 +103,11 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
>  E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
>  endif
>  
> +# Remove busybox tune2fs and e2label since that will take precedence full version
>  define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
> +	$(if $(BR2_PACKAGE_BUSYBOX), \
> +		rm -f $(TARGET_DIR)/sbin/tune2fs; \
> +		rm -f $(TARGET_DIR)/sbin/e2label;)
>  	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
>  endef

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
