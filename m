From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 14 Mar 2014 20:48:44 +0100
Subject: [Buildroot] [PATCH] slang: bump to 2.2.4
In-Reply-To: <1394814653-16144-1-git-send-email-yegorslists@googlemail.com>
References: <1394814653-16144-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <53235D1C.3050300@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yegor,

> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Convert package from generic to autotools.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>   package/slang/Config.in |    2 +-
>   package/slang/slang.mk  |   31 ++++---------------------------
>   2 files changed, 5 insertions(+), 28 deletions(-)
>
> diff --git a/package/slang/Config.in b/package/slang/Config.in
> index 60facbb..9d8f047 100644
> --- a/package/slang/Config.in
> +++ b/package/slang/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_SLANG
>   	help
>   	  Multi-platform console display library.
>   
> -	  http://www.s-lang.org/
> +	  http://www.jedsoft.org/slang/index.html
> diff --git a/package/slang/slang.mk b/package/slang/slang.mk
> index 8cc93dd..2364e71 100644
> --- a/package/slang/slang.mk
> +++ b/package/slang/slang.mk
> @@ -4,32 +4,9 @@
>   #
>   ################################################################################
>   
> -SLANG_VERSION = 1.4.5
> -SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
> -SLANG_SITE = http://www.uclibc.org/
> +SLANG_VERSION = 2.2.4
> +SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v2.2/

My suggestion is:

SLANG_VERSION_MAJOR = 2.2
SLANG_VERSION = $(SLANG_VERSION_MAJOR).4
SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)/

Regards,
Jerzy

>   SLANG_INSTALL_STAGING = YES
> +SLANG_MAKE = $(MAKE1)
>   
> -# We need to add -fPIC since we're busting original CFLAGS
> -# that have it, see bug #3295
> -define SLANG_BUILD_CMDS
> -	$(MAKE1) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC" \
> -	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
> -endef
> -
> -define SLANG_INSTALL_STAGING_CMDS
> -	$(INSTALL) -D -m 0644 $(@D)/libslang.a $(STAGING_DIR)/usr/lib/libslang.a
> -	$(INSTALL) -D -m 0755 $(@D)/libslang.so $(STAGING_DIR)/usr/lib/libslang.so
> -	$(INSTALL) -D -m 0644 $(@D)/slang.h $(STAGING_DIR)/usr/include/slang.h
> -	$(INSTALL) -D -m 0644 $(@D)/slcurses.h $(STAGING_DIR)/usr/include/slcurses.h
> -	(cd $(STAGING_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
> -endef
> -
> -define SLANG_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0644 $(@D)/libslang.a $(TARGET_DIR)/usr/lib/libslang.a
> -	$(INSTALL) -D -m 0755 $(@D)/libslang.so $(TARGET_DIR)/usr/lib/libslang.so
> -	$(INSTALL) -D -m 0644 $(@D)/slang.h $(TARGET_DIR)/usr/include/slang.h
> -	$(INSTALL) -D -m 0644 $(@D)/slcurses.h $(TARGET_DIR)/usr/include/slcurses.h
> -	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(autotools-package))
