From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:01:25 +0200
Subject: [Buildroot] [PATCH 01/47] package/libsquish: New package
In-Reply-To: <1437597069-6448-2-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725170125.GO3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> Kodi 15.0 contains an updated version of libsquish:
> https://github.com/xbmc/xbmc/tree/master/tools/depends/native/libsquish-native
> 
> The OpenElec project provides a separate tarball including the Kodi-
> specific patches:
> http://sources.openelec.tv/devel/libsquish-1.10-openelec.tar.gz
> 
> This patch contains the relevant diff between upstream libsquish 1.13
> and the OpenElec tarball.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
> new file mode 100644
> index 0000000..f6b93c8
> --- /dev/null
> +++ b/package/libsquish/libsquish.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# libsquish
> +#
> +################################################################################
> +
> +LIBSQUISH_VERSION = 1.13
> +LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tgz
> +LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
> +LIBSQUISH_INSTALL_STAGING = YES
> +LIBSQUISH_STRIP_COMPONENTS = 0
> +LIBSQUISH_LICENSE = MIT
> +LIBSQUISH_LICENSE_FILES = README

There is a LICENSE file, too.

> +define LIBSQUISH_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define LIBSQUISH_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
> +		PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
> +	$(INSTALL) -m 644 $(@D)/squish.pc $(STAGING_DIR)/usr/lib/pkgconfig
> +	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so
> +endef
> +
> +define LIBSQUISH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/include/
> +	mkdir -p $(TARGET_DIR)/usr/lib/pkgconfig/
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
> +		PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
> +	ln -sf libsquish.so.0.0 $(TARGET_DIR)/usr/lib/libsquish.so

The .so symlink is not needed in the target, since it is only needed by
ld at runtime.

However, the library's SONAME is libsquish.so.0 so even with this
symlink it would not be possible to fund the library at runtime.

Either rename the library, or symlink it as libsquish.so.0

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
