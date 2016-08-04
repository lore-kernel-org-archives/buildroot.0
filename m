From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Aug 2016 19:09:45 +0200
Subject: [Buildroot] [git commit] kmsxx: new package
In-Reply-To: <20160728212806.C6B018225E@busybox.osuosl.org>
References: <20160728212806.C6B018225E@busybox.osuosl.org>
Message-ID: <20160804170945.GA5875@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Maxime, All,

On 2016-07-28 23:28 +0200, Thomas Petazzoni spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=93811a2b8a5efa43754e26a4a44f463cdbd9f1b4
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> KMS++ is a suite of library and test tools to interact with KMS drivers in
> the linux kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> [Thomas:
>  - rename prompt to kms++, suggested by Yann E. Morin
>  - fixup the thread dependency comment
>  - remove the mention of the python wrapper in the Config.in help
>    text, since they are not installed
>  - fix the Config.in comment to mention the C++ and gcc >= 4.8
>    dependencies
>  - use = instead of += when appropriate
>  - use a loop to install the test programs
>  - use a loop to install the libraries
>  - add installation to staging as well, both the libraries and header
>    files
>  - add missing dependency on host-pkgconf
>  - add hash file.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> new file mode 100644
> index 0000000..d49ec8f
> --- /dev/null
> +++ b/package/kmsxx/kmsxx.mk
> @@ -0,0 +1,48 @@
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
> +KMSXX_INSTALL_STAGING = YES
> +KMSXX_DEPENDENCIES = libdrm host-pkgconf
> +KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
> +
> +ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
> +KMSXX_TESTS = \
> +	fbtestpat kmsblank kmscapture \
> +	kmsprint kmsview testpat wbcap \
> +	wbm2m
> +
> +define KMSXX_INSTALL_TARGET_TESTS
> +	$(foreach t,$(KMSXX_TESTS),\
> +		$(INSTALL) -D -m 0755 $(@D)/bin/$(t) \
> +			$(TARGET_DIR)/usr/bin/$(t)
> +	)
> +endef
> +endif
> +
> +KMSXX_LIBS = kms++ kms++util
> +
> +define KMSXX_INSTALL_TARGET_CMDS
> +	$(foreach l,$(KMSXX_LIBS),\
> +		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
> +			$(TARGET_DIR)/usr/lib/lib$(l).so
> +	)
> +	$(KMSXX_INSTALL_TARGET_TESTS)
> +endef
> +
> +define KMSXX_INSTALL_STAGING_CMDS
> +	$(foreach l,$(KMSXX_LIBS),\
> +		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
> +			$(STAGING_DIR)/usr/lib/lib$(l).so ; \
> +		mkdir -p $(STAGING_DIR)/usr/include/$(l) ; \
> +		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/

This foreach fails to fail when the first command fails to install the
library:

    http://autobuild.buildroot.org/results/82c/82cfb7451f933b222abe30b5d35d23e409a4af79/build-end.log

Regards,
Yann E. MORIN.

> +	)
> +endef
> +
> +$(eval $(cmake-package))
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
