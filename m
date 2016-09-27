From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Sep 2016 22:50:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] motion: new package
In-Reply-To: <1474808455-21514-1-git-send-email-fabrice.fontaine@orange.com>
References: <1474808455-21514-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <471db46e-838c-10b7-a4c5-7bb026d061ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-16 15:00, Fabrice Fontaine wrote:
> Motion is a program that monitors the video signal from
> cameras. It is able to detect if a significant part of
> the picture has changed; in other words, it can detect motion.
> 
> libv4l has to be selected to be able to use a local camera.
> 
> https://motion-project.github.io
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

 Some more small nits below.

[snip]
> diff --git a/package/motion/motion.mk b/package/motion/motion.mk
> new file mode 100644
> index 0000000..c3461a6
> --- /dev/null
> +++ b/package/motion/motion.mk
> @@ -0,0 +1,82 @@
> +################################################################################
> +#
> +# motion
> +#
> +################################################################################
> +
> +MOTION_VERSION = release-3.4.1
> +MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
> +MOTION_LICENSE = GPLv2
> +MOTION_LICENSE_FILES = COPYING
> +MOTION_DEPENDENCIES = host-pkgconf jpeg
> +MOTION_AUTORECONF = YES

 Add a comment
# From git, and configure.ac is patched

> +
> +# This patch fixes detection of sqlite when cross-compiling
> +MOTION_PATCH = \
> +	https://github.com/Motion-Project/motion/commit/709f626b7ef83a2bb3ef1f77205276207ab27196.patch
> +
> +# This patch adds --with-sdl=[DIR] option to fix detection of sdl-config
> +MOTION_PATCH = \
> +	https://github.com/Motion-Project/motion/commit/72193ccaff83fcb074c9aaa37c5691a8d8a18c7c.patch 
> +
> +# motion does not use any specific function of jpeg-turbo, so just relies on
> +# jpeg selection
> +MOTION_CONF_OPTS += --without-jpeg-turbo
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
> +MOTION_DEPENDENCIES += ffmpeg 

 Spurious end-of-line whitespace here.

 Also add MOTION_CONF_OPTS += --with-ffmpeg

> +else
> +MOTION_CONF_OPTS += --without-ffmpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MYSQL),y)
> +MOTION_DEPENDENCIES += mysql
> +MOTION_CONF_OPTS += --with-mysql-include=$(STAGING_DIR)/usr/include/mysql
> +MOTION_CONF_OPTS += --with-mysql-lib=$(STAGING_DIR)/usr/lib

 Add --with-mysql

> +else
> +MOTION_CONF_OPTS += --without-mysql
> +endif
> +
> +ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> +MOTION_DEPENDENCIES += postgresql
> +MOTION_CONF_OPTS += --with-pgsql-include=$(STAGING_DIR)/usr/include
> +MOTION_CONF_OPTS += --with-pgsql-lib=$(STAGING_DIR)/usr/lib

 Add --with-postgresql

> +else
> +MOTION_CONF_OPTS += --without-postgresql
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL),y)
> +MOTION_DEPENDENCIES += sdl
> +MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
> +else
> +MOTION_CONF_OPTS += --without-sdl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +MOTION_DEPENDENCIES += sqlite

 Add --with-sqlite3

 With these changes, you can add my

 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +else
> +MOTION_CONF_OPTS += --without-sqlite3
> +endif
> +
> +# Do not use default install target as it installs many unneeded files and
> +# directories: docs, examples and init scripts
> +define MOTION_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/motion-dist.conf \
> +		$(TARGET_DIR)/etc/motion.conf
> +	$(INSTALL) -D -m 0755 $(@D)/motion $(TARGET_DIR)/usr/bin/motion
> +endef
> +
> +define MOTION_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/motion/S99motion \
> +		$(TARGET_DIR)/etc/init.d/S99motion
> +endef
> +
> +define MOTION_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/motion/motion.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/motion.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/motion.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/motion.service
> +endef
> +
> +$(eval $(autotools-package))
> diff --git a/package/motion/motion.service b/package/motion/motion.service
> new file mode 100644
> index 0000000..c788cd6
> --- /dev/null
> +++ b/package/motion/motion.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Motion camera monitoring system
> +After=network.target
> +
> +[Service]
> +ExecStart=/usr/bin/motion
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
