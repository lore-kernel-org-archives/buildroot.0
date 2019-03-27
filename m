From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 19:54:09 +0100
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190216212835.25503-4-vadim4j@gmail.com>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-4-vadim4j@gmail.com>
Message-ID: <20190327195409.14931f34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Sat, 16 Feb 2019 23:28:35 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> It allows to install s6-rc services by post-build, rootfs-overlay or some
> package into /etc/s6/rc/service which will be compiled as s6-rc db as
> /etc/s6/rc/compiled-initial. Services are compiled on stage when rootfs overlay
> & post-build already performed.

This last sentence is confusing. What about "Services at compiled after
the rootfs overlay have been copied and post-build scripts have been
executed".

> Added rc.init & rc.shutdown scripts which are needed to run s6-rc
> services.

Isn't this already done in PATCH 2/3 ?

> This is very basic s6-rc system support which even does not have the
> basic stuff like /proc /sys /dev setup, but this might be added in
> future work.
> 
> All above is only possible if BR2_INIT_S6 is selected.

"possible" ? "enabled" perhaps ?


> diff --git a/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
> new file mode 100644
> index 0000000000..baf1706bb3
> --- /dev/null
> +++ b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
> @@ -0,0 +1,76 @@
> +From cb89562fcec582bbb5bc9a3bf5faf33338e6b535 Mon Sep 17 00:00:00 2001
> +From: Vadim Kochan <vadim4j@gmail.com>
> +Date: Wed, 13 Feb 2019 03:36:03 +0200
> +Subject: [PATCH] configure: Allow to specify compiled base dir
> +
> +It allows to specify different s6-rc compiled dir (for example
> +/etc/s6/rc/compiled), without specifying it as command line argument
> +for s6-rc* tools.
> +
> +Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Has this patch been submitted upstream ? What does they say about it ?
Why can't we use the command line argument and avoid the patch ?


> diff --git a/package/s6-rc/rc.init b/package/s6-rc/rc.init
> new file mode 100644
> index 0000000000..6709c6488b
> --- /dev/null
> +++ b/package/s6-rc/rc.init
> @@ -0,0 +1,4 @@
> +#! /usr/bin/execlineb -P
> +
> +if { s6-rc-init /run/service }
> +if { s6-rc -t 600000 -- change default }

So this will replace the dummy rc.init script created in PATCH 2/3. So
why is PATCH 2/3 creating a rc.init file ?

> diff --git a/package/s6-rc/rc.shutdown b/package/s6-rc/rc.shutdown
> new file mode 100644
> index 0000000000..58d49b5cfd
> --- /dev/null
> +++ b/package/s6-rc/rc.shutdown
> @@ -0,0 +1,3 @@
> +#! /usr/bin/execlineb -P
> +
> +s6-rc -da change

Same question.

> diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
> index 222ba139c6..6bba54a28a 100644
> --- a/package/s6-rc/s6-rc.mk
> +++ b/package/s6-rc/s6-rc.mk
> @@ -11,6 +11,13 @@ S6_RC_LICENSE_FILES = COPYING
>  S6_RC_INSTALL_STAGING = YES
>  S6_RC_DEPENDENCIES = s6
>  
> +ifeq ($(BR2_INIT_S6),y)
> +# Needs s6-rc-compile to create initial rc db, also
> +# build after s6-linux-init to rewrite rc.init for run
> +# s6-rc services.
> +S6_RC_DEPENDENCIES += host-s6-rc s6-linux-init

Why do we rewrite rc.init ?

> +endif
> +
>  S6_RC_CONF_OPTS = \
>  	--prefix=/usr \
>  	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
> @@ -20,6 +27,7 @@ S6_RC_CONF_OPTS = \
>  	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
>  	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
>  	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
> +	$(if $(BR2_INIT_S6),--compiledir=/etc/s6/rc/compiled,) \

You can drop the last comma, it is not necessary since you don't have a
"else" part in the condition.

>  	$(SHARED_STATIC_LIBS_OPTS)
>  
>  define S6_RC_CONFIGURE_CMDS
> @@ -44,6 +52,31 @@ define S6_RC_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
>  endef
>  
> +ifeq ($(BR2_INIT_S6),y)
> +
> +define S6_RC_PREPARE_INIT_RC
> +	mkdir -p $(TARGET_DIR)/etc/s6/rc/service/default
> +	echo bundle > $(TARGET_DIR)/etc/s6/rc/service/default/type
> +	touch $(TARGET_DIR)/etc/s6/rc/service/default/contents
> +
> +	mkdir -p $(TARGET_DIR)/etc/s6/rc/compiled-initial
> +	ln -sf compiled-initial $(TARGET_DIR)/etc/s6/rc/compiled

Why do we have this "compiled-initial" thing and a symlink to it ?

> +
> +	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.init $(TARGET_DIR)/etc/rc.init
> +	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.shutdown $(TARGET_DIR)/etc/rc.shutdown
> +endef
> +S6_RC_POST_INSTALL_TARGET_HOOKS += S6_RC_PREPARE_INIT_RC
> +
> +define S6_RC_FINALIZE_INIT_RC
> +	rm -rf $(TARGET_DIR)/etc/s6/rc/compiled-initial
> +	$(HOST_DIR)/bin/s6-rc-compile -v 1 \
> +		$(TARGET_DIR)/etc/s6/rc/compiled-initial \
> +		$(TARGET_DIR)/etc/s6/rc/service
> +endef
> +S6_RC_ROOTFS_PRE_CMD_HOOKS += S6_RC_FINALIZE_INIT_RC

Meh, I really don't like that this gets executed as a "rootfs pre
command" hook, but I understand the reasoning behind doing this after
rootfs overlay / post-build scripts have been handled. Do we need to
add another sort of hook at the end of the target-finalize target ?
Should we move the place where TARGET_FINALIZE_HOOKS are executed ? I'm
not sure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
