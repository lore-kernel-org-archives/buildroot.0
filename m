From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 1 Nov 2019 06:55:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: enable systemd services
In-Reply-To: <20191101024422.102466-1-james.hilliard1@gmail.com>
References: <20191101024422.102466-1-james.hilliard1@gmail.com>
Message-ID: <20191101055531.GA6022@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

> These are normally enabled by systemctl preset-all.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Thanks!
BTW it'd be nice to buildroot has some helper to create symlink
(IPUTILS_INSTALL_SERVICE_NINFOD, IPUTILS_INSTALL_SERVICE_RDISC),
you're using it in several patches.

> ---
>  package/iputils/iputils.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 4a06581790..822c8d8a1b 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -47,11 +47,21 @@ else
>  IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
>  # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
>  IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
> +IPUTILS_NO_NINFOD = y
>  endif

>  # ninfod requires <pthread.h>
>  ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
> +IPUTILS_NO_NINFOD = y
> +endif
> +
> +ifneq ($(IPUTILS_NO_NINFOD),y)
> +define IPUTILS_INSTALL_SERVICE_NINFOD
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../lib/systemd/system/ninfod.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
> +endef
>  endif

Maybe simplify IPUTILS_CONF_OPTS (diff to your patch)?

+++ package/iputils/iputils.mk
@@ -46,17 +46,17 @@ IPUTILS_DEPENDENCIES += linux-headers
 else
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 IPUTILS_NO_NINFOD = y
 endif
 
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 IPUTILS_NO_NINFOD = y
 endif
 
 ifneq ($(IPUTILS_NO_NINFOD),y)
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+
 define IPUTILS_INSTALL_SERVICE_NINFOD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../lib/systemd/system/ninfod.service \

Kind regards,
Petr
