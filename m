From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 22:05:21 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
In-Reply-To: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
References: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
Message-ID: <20160728200521.GF5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

Well, I forgot a few nts in the previous mail... Here they are. ;-)

On 2016-07-28 21:38 +0200, Maxime Ripard spake thusly:
> KMS++ is a suite of library and test tools to interact with KMS drivers in
> the linux kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> ---
> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
> new file mode 100644
> index 000000000000..db3c74b45310
> --- /dev/null
> +++ b/package/kmsxx/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_KMSXX
> +	bool "kmsxx"

We can call it by its real name in the prompt: kms++ .

You should also provide a .hash file: Github provides reproducible
archives.

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

No need for "+=" here, just a plain "=".

> +define KMSXX_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++.so \
> +		$(TARGET_DIR)/usr/lib/libkms++.so
> +	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++util.so \
> +		$(TARGET_DIR)/usr/lib/libkms++util.so

Aren't the libraries versioned? If they are, don't we need to provide
the versioning symlinks? (Not that it matters, we're not supposed to
have multiple versions of the same libs in Buildroot; it's just for
consistency and customs.)

Regards,
Yann E. MORIN.

> +	$(KMSXX_INSTALL_TARGET_TESTS)
> +endef
> +
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
