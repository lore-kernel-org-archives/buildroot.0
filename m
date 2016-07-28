From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 21:49:27 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
In-Reply-To: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
References: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
Message-ID: <20160728194927.GD5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2016-07-28 21:38 +0200, Maxime Ripard spake thusly:
> KMS++ is a suite of library and test tools to interact with KMS drivers in
> the linux kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> ---
[--SNIP--]
> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
> new file mode 100644
> index 000000000000..db3c74b45310
> --- /dev/null
> +++ b/package/kmsxx/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_KMSXX
> +	bool "kmsxx"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs

The comment "# libpthread-stubs" seems to imply that the dependency on
C++ is ihnerited from libpthread-stubs, but it is neither selected not
depended on; it is also not in the build dependency. Is it an oversight?

However, given the name of the package, I guess it needs C++ for itself.
So, whether libpthread-stubs is needed or not, you should drop the
comment altogether: C++ *is* needed by kms++.

> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  libkms++ is a C++11 library for kernel mode setting.
> +
> +	  Also included are simple test tools for KMS and python wrapper for
> +	  libkms++.

Drop the comment about the Python bindings, since we don't support them
(you dropped them sinc e v2 of the patch).

> +	  https://github.com/tomba/kmsxx
> +
> +if BR2_PACKAGE_KMSXX
> +
> +config BR2_PACKAGE_KMSXX_INSTALL_TESTS
> +	bool "Install test programs"
> +	help
> +	  This option allows to install the kmsxx test programs.
> +
> +endif

Usually, when there is a single option to a package, we do not use an
if-block, but just make that option depend on the package. But I'm fine
with an if-block (I prefer it; it's just not what we usually do).

> +comment "kmsxx needs a toolchain w/ threads"
> +        depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> new file mode 100644
> index 000000000000..6eaa85452dfb
> --- /dev/null
> +++ b/package/kmsxx/kmsxx.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# kmsxx
> +#
> +################################################################################
> +
> +KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
> +KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
> +KMSXX_LICENSE = MPLv2.0
> +KMSXX_LICENSE_FILES = LICENSE
> +
> +KMSXX_DEPENDENCIES += libdrm
> +KMSXX_CONF_OPTS += -DKMSXX_ENABLE_PYTHON=OFF
> +
> +ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
> +define KMSXX_INSTALL_TARGET_TESTS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/fbtestpat \
> +		$(TARGET_DIR)/usr/bin/fbtestpat
> +	$(INSTALL) -D -m 0755 $(@D)/bin/kmsblank \
> +		$(TARGET_DIR)/usr/bin/kmsblank
> +	$(INSTALL) -D -m 0755 $(@D)/bin/kmscapture \
> +		$(TARGET_DIR)/usr/bin/kmscapture
> +	$(INSTALL) -D -m 0755 $(@D)/bin/kmsprint \
> +		$(TARGET_DIR)/usr/bin/kmsprint
> +	$(INSTALL) -D -m 0755 $(@D)/bin/kmsview \
> +		$(TARGET_DIR)/usr/bin/kmsview
> +	$(INSTALL) -D -m 0755 $(@D)/bin/testpat \
> +		$(TARGET_DIR)/usr/bin/testpat
> +	$(INSTALL) -D -m 0755 $(@D)/bin/wbcap \
> +		$(TARGET_DIR)/usr/bin/wbcap
> +	$(INSTALL) -D -m 0755 $(@D)/bin/wbm2m \
> +		$(TARGET_DIR)/usr/bin/wbm2m

    KMSXX_TESTS = fbtestpat kmsblank kmscapture ...
    define KMSXX_INSTALL_TARGET_TESTS
        $(foreach t,$(KMSXX_TESTS),\
            $(INSTALL) -D -m 0755 $(@D)/bin/$(t) $(TARGET_DIR/usr/bin/$(t))
         )
    endef

> +endef
> +endif
> +
> +define KMSXX_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++.so \
> +		$(TARGET_DIR)/usr/lib/libkms++.so
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++util.so \
> +		$(TARGET_DIR)/usr/lib/libkms++util.so
> +

No empty line above.

> +	$(KMSXX_INSTALL_TARGET_TESTS)
> +endef

Since it installs libraries, maybe it should be installed in staging as
well?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> -- 
> 2.9.2
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
