From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 3 Jan 2014 13:55:04 +0200
Subject: [Buildroot] Compile static versions of gcc libraries
In-Reply-To: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140103115504.GQ6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Thu, Oct 10, 2013 at 11:40:42AM +0200, J?r?me Pouiller wrote:
> Since default configure options for host packages include
> --disable-static, gcc was not configured to build static version of its
> libraries (libgcc.a, libstdc++.a, ...).
> 
> This patch replace --disable-static by --enable-static in configure
> command. Notice some options was removed sinces they was ignored by gcc
> configure script.
> 
> Once it was compiled, this commit takes care to copy static libraries to
> $STAGING
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Thanks. This patched fixes:
http://autobuild.buildroot.net/results/7cc/7ccbf088cac523f5cccc36d4b5edc3a45c670044/
http://autobuild.buildroot.net/results/678/678f5340f4e43fde12ff8d453ef38f76b6c89722/

Tested-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
> package/gcc/gcc-final/gcc-final.mk |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index b396382..49de481 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -26,6 +26,21 @@ HOST_GCC_FINAL_SUBDIR = build
>  
>  HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
>  
> +define  HOST_GCC_FINAL_CONFIGURE_CMDS
> +        (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
> +                $(HOST_CONFIGURE_OPTS) \
> +                CFLAGS="$(HOST_CFLAGS)" \
> +                LDFLAGS="$(HOST_LDFLAGS)" \
> +                $(HOST_GCC_FINAL_CONF_ENV) \
> +                ./configure \
> +                --prefix="$(HOST_DIR)/usr" \
> +                --sysconfdir="$(HOST_DIR)/etc" \
> +                --enable-shared --enable-static \
> +                $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
> +        )
> +endef
> +
> +
>  # Languages supported by the cross-compiler
>  GCC_FINAL_CROSS_LANGUAGES-y = c
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
> @@ -133,6 +148,8 @@ define HOST_GCC_FINAL_INSTALL_USR_LIBS
>  	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
>  		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
>  			$(STAGING_DIR)/usr/lib/ ; \
> +		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
> +			$(STAGING_DIR)/usr/lib/ ; \
>  		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
>  			$(TARGET_DIR)/usr/lib/ ; \
>  	done

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
