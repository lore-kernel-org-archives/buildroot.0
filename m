From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 18:42:23 +0100
Subject: [Buildroot] [PATCHv3] util-linux: disable installing binaries
 by default
In-Reply-To: <1360158623-19010-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360158623-19010-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <511295FF.30002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 14:50, Gustavo Zacarias wrote:
[snip]
> +config BR2_PACKAGE_UTIL_LINUX_BINARIES
> +	bool "install utilities"
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT

  Why is libmount selected? It wasn't selected before when you built just 
one binary, e.g. mount. Same for the other two, actually. Of course, it's 
possible that configure adds them implicitly anyway, I don't know that.

> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  Install util-linux binaries.

  Maybe it's worth mentioning that selecting this option installs some 
binaries even if nothing is selected below.

[snip]
> @@ -87,6 +87,41 @@ HOST_UTIL_LINUX_CONF_OPT += \
>   	--disable-fallocate --disable-unshare --disable-rename \
>   	--disable-schedutils --disable-wall --disable-partx
>
> +# Avoid the basic utilities if we just want the libraries
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),y)
> +define UTIL_LINUX_INSTALL_BINARIES
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +endif

  Shouldn't there be an else here instead of endif? If you do a top-level 
install, there is no need to explicitly go into the subdirectories as well.


  Regards,
  Arnout

> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
> +define UTIL_LINUX_INSTALL_LIBBLKID
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libblkid \
> +		DESTDIR=$(TARGET_DIR) install
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> +define UTIL_LINUX_INSTALL_LIBMOUNT
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libmount \
> +		DESTDIR=$(TARGET_DIR) install
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> +define UTIL_LINUX_INSTALL_LIBUUID
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libuuid \
> +		DESTDIR=$(TARGET_DIR) install
> +endef
> +endif
> +
> +define UTIL_LINUX_INSTALL_TARGET_CMDS
> +	$(UTIL_LINUX_INSTALL_BINARIES)
> +	$(UTIL_LINUX_INSTALL_LIBBLKID)
> +	$(UTIL_LINUX_INSTALL_LIBMOUNT)
> +	$(UTIL_LINUX_INSTALL_LIBUUID)
> +endef
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
