From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 28 Dec 2014 08:07:46 +0200
Subject: [Buildroot] [PATCH 05/10] package/lockdev: handle static/shared
 only build
In-Reply-To: <1419717508-11627-6-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-6-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141228060746.GK2481@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Dec 27, 2014 at 10:58:23PM +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/lockdev/lockdev.mk | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
> index 59561ba..e789a79 100644
> --- a/package/lockdev/lockdev.mk
> +++ b/package/lockdev/lockdev.mk
> @@ -13,30 +13,39 @@ LOCKDEV_LICENSE_FILES = LICENSE
>  LOCKDEV_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -define LOCKDEV_BUILD_CMDS
> -	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
> +LOCKDEV_BUILD_ARGS = static
> +LOCKDEV_INSTALL_ARGS = install_dev
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LOCKDEV_BUILD_ARGS = static shared
> +LOCKDEV_INSTALL_ARGS = install_dev install_run
> +else # BR2_SHARED_LIBS
> +LOCKDEV_BUILD_ARGS = shared
> +LOCKDEV_INSTALL_ARGS = install_run
> +endif
> +
> +ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
> +define LOCKDEV_CREATE_LINKS_STAGING
> +	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
> +	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1

I suggest to split LOCKDEV_VERSION and use LOCKDEV_MAJOR for the symlink 
suffix. This should be somewhat more future proof. Though since this 'ln' 
predates your patch maybe a separate patch is better.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
