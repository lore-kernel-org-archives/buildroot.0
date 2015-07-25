From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 00:21:52 +0200
Subject: [Buildroot] [PATCH] zxing_cpp: New package
In-Reply-To: <1437689326-23261-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437689326-23261-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150725222152.GK1847@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-07-24 00:08 +0200, Maxime Hadjinlian spake thusly:
> ZXing was hosted on Google Code, which is a closing forges.
> The current link was already redirecting to the github repo.
> 
> But upstream is no longer supporting the cpp bindings, it's now a Java
> library/application.
> 
> A fork has been created from the latests cpp source of the original
> upstream.
> So this is a new package from an old one and a legacy option has been
> added.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[--SNIP--]
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> new file mode 100644
> index 0000000..36ba0fe
> --- /dev/null
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zxing-cpp
> +#
> +################################################################################
> +
> +ZXING_CPP_VERSION = e7594421d240d8a79633a83c7ad3d26b670e038f
> +ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
> +ZXING_CPP_LICENSE = Apache-2.0
> +ZXING_CPP_LICENSE_FILES = COPYING
> +ZXING_CPP_INSTALL_STAGING = YES
> +ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +ifneq ($(BR2_ENABLE_LOCALE),y)
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +ZXING_CPP_DEPENDENCIES += libiconv
> +endif
> +endif
> +
> +define ZXING_CPP_INSTALL_STAGING_CMDS
> +	for i in $$(find $(@D)/buildroot-build/core/src -iname *.h); do \
> +		$(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/local/include; \
> +	done
> +endef
> +
> +define ZXING_CPP_INSTALL_TARGET_CMDS
> +	for i in $$(find $(@D)/buildroot-build/ -iname *.so -o -iname *.a); do \
> +		$(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/lib; \
> +	done
> +	$(INSTALL) -m 755 $(@D)/buildroot-build/zxing $(TARGET_DIR)/usr/sbin
> +endef

Why can't we use the standard 'install' rule for either staging or
target?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> diff --git a/package/zxing/0001-makefile.patch b/package/zxing/0001-makefile.patch
> deleted file mode 100644
> index 66896bf..0000000
> --- a/package/zxing/0001-makefile.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -[PATCH] add Makefile
> -
> -The scons based build system doesn't handle cross compilation, special
> -compiler flags or (un)installation, so add a simple makefile instead
> -which does.
> -
> -Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ----
> - cpp/core/src/Makefile |   14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -Index: zxing-2.0/cpp/core/src/Makefile
> -===================================================================
> ---- /dev/null
> -+++ zxing-2.0/cpp/core/src/Makefile
> -@@ -0,0 +1,14 @@
> -+override CXXFLAGS += -I.
> -+SRCS := $(shell find -name '*.cpp')
> -+
> -+libzxing.a: $(SRCS:.cpp=.o)
> -+	$(AR) $(ARFLAGS) $@ $^
> -+
> -+install: libzxing.a
> -+	install -D -m 0644 $^ $(DESTDIR)/usr/lib/$^
> -+	find -name '*.h' -exec install -m 0644 -D "{}" \
> -+		"$(DESTDIR)/usr/include/{}" ";"
> -+
> -+uninstall:
> -+	rm -f $(DESTDIR)/usr/lib/libzxing.a
> -+	rm -rf $(DESTDIR)/usr/include/zxing
> diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
> deleted file mode 100644
> index 94e8b1f..0000000
> --- a/package/zxing/zxing.mk
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -################################################################################
> -#
> -# zxing
> -#
> -################################################################################
> -
> -ZXING_VERSION = 2.3.0
> -ZXING_SITE = http://zxing.googlecode.com/files
> -ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
> -ZXING_LICENSE = Apache-2.0
> -ZXING_LICENSE_FILES = COPYING
> -ZXING_INSTALL_STAGING = YES
> -
> -ifneq ($(BR2_ENABLE_LOCALE),y)
> -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> -ZXING_DEPENDENCIES += libiconv
> -else
> -# There is no locale support in the toolchain and libiconv
> -# is not available so disable iconv support in zxing
> -ZING_MAKE_OPTS = CXXFLAGS+="-DNO_ICONV"
> -endif
> -endif
> -
> -define ZXING_EXTRACT_CMDS
> -	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
> -endef
> -
> -define ZXING_BUILD_CMDS
> -	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPTS)
> -endef
> -
> -define ZXING_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
> -endef
> -
> -define ZXING_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
