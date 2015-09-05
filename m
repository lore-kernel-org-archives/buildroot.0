From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Sep 2015 11:21:20 +0200
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and
 /lib to be symlinks into /usr
In-Reply-To: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
References: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55EAB410.1070300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-09-15 22:17, Yann E. MORIN wrote:
[snip]
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 1aa74b3..a005f45 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -22,16 +22,18 @@ EUDEV_CONF_ENV += LIBS=-lrt
>  EUDEV_CONF_OPTS =		\
>  	--disable-manpages	\
>  	--sbindir=/sbin		\
> -	--with-rootlibdir=/lib	\
>  	--libexecdir=/lib	\
>  	--with-firmware-path=/lib/firmware	\
>  	--disable-introspection			\
> -	--enable-split-usr			\
>  	--enable-libkmod
>  
>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
>  EUDEV_PROVIDES = udev
>  
> +ifeq ($(BR2_ROOTFS_MERGED_USR),)
> +EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
> +endif

 It would be nice if someone could do a runtime test with eudev, both the merged
and the split case.

> +
>  ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
>  EUDEV_CONF_OPTS += --enable-rule_generator
>  endif
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
[snip]
>  define SKELETON_INSTALL_TARGET_CMDS
>  	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(SKELETON_PATH)/ $(TARGET_DIR)/
> -	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> -		$(TARGET_DIR_WARNING_FILE)
> +	$(SKELETON_USR_SYMLINKS_OR_DIRS)
>  	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> -	mkdir -p $(TARGET_DIR)/usr

 Huh, where did the mkdir go? Did you remove it because /usr is already in the
skeleton?

>  	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> +	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> +		$(TARGET_DIR_WARNING_FILE)

 And why did you move this one around?


 Regards,
 Arnout

>  endef
>  
>  SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
