From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 19:43:12 +0100
Subject: [Buildroot] [PATCH 2/3] package/s6-linux-init: Allow to install
 as init system
In-Reply-To: <20190216212835.25503-3-vadim4j@gmail.com>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-3-vadim4j@gmail.com>
Message-ID: <20190327194312.163ffdee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Sat, 16 Feb 2019 23:28:34 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> +ifeq ($(BR2_INIT_S6),y)
> +
> +# Don't let Busybox to install it's own tools like poweroff, reboot, halt, etc
> +S6_LINUX_INIT_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)

The comment is not good: i doesn't prevent Busybox from installing
these programs, but it ensures Busybox is built before, and therefore
we have the ability to "win" over Busybox as we can overwrite those
programs.

However, this is not how we handle this situation. In fact, we handle
it in exactly the opposite way. In package/busybox/busybox.mk, we add
to BUSYBOX_DEPENDENCIES all packages that install programs that
"conflict" with Busybox applets. This way, we are sure they are built
before Busybox. And the installation process of Busybox has been
carefully modified to not overwrite an existing program by a Busybox
applet if this program already exists.

So, you should use the same model for s6-linux-init.

> +
> +S6_LINUX_INIT_MAKER_OPTS = -b /usr/bin -c /etc/s6
> +
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> +S6_LINUX_INIT_MAKER_OPTS += -d 0
> +else
> +S6_LINUX_INIT_MAKER_OPTS += $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS),,-d 1)

So you need -d1 in which cases ? Where udev is used ?

What about:

ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
S6_LINUX_INIT_MAKER_OPTS += -d 0
else ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)$(BR2_PACKAGE_HAS_UDEV),y)
S6_LINUX_INIT_MAKER_OPTS += -d 1
endif

or something like that ?

> +endif
> +
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> +S6_LINUX_INIT_MAKER_OPTS += -G "/sbin/getty -L \
> +			  $(SYSTEM_GETTY_OPTIONS) \
> +			  $(SYSTEM_GETTY_PORT) \
> +			  $(SYSTEM_GETTY_BAUDRATE) \
> +			  $(SYSTEM_GETTY_TERM)"

I'd say keep this on one single line.

> +endif
> +
> +define S6_LINUX_INIT_INSTALL_INIT
> +	ln -sf ../etc/s6/init $(TARGET_DIR)/sbin/init
> +
> +	ln -sf /usr/bin/s6-reboot $(TARGET_DIR)/sbin/reboot
> +	ln -sf /usr/bin/s6-poweroff $(TARGET_DIR)/sbin/poweroff
> +	ln -sf /usr/bin/s6-halt $(TARGET_DIR)/sbin/halt
> +
> +	echo "#! /usr/bin/execlineb -P" > $(@D)/rc.init

What is this empty script doing ? Perhaps we should have it as a file
in package/s6-linux-init/ instead of generating it.

> +	$(INSTALL) -m 0755 $(@D)/rc.init $(TARGET_DIR)/etc/rc.init
> +	echo "#! /usr/bin/execlineb -P" > $(@D)/rc.shutdown
> +	$(INSTALL) -m 0755 $(@D)/rc.shutdown $(TARGET_DIR)/etc/rc.shutdown

Same question about what this empty script is doing.

> +	rm -rf $(TARGET_DIR)/etc/s6

Any reason to have this rm -rf ?

> +	$(HOST_DIR)/bin/s6-linux-init-maker $(S6_LINUX_INIT_MAKER_OPTS) $(TARGET_DIR)/etc/s6
> +endef
> +S6_LINUX_INIT_POST_INSTALL_TARGET_HOOKS += S6_LINUX_INIT_INSTALL_INIT
> +
> +endif # BR2_INIT_S6

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
