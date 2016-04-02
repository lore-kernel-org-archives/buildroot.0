From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:58:38 +0200
Subject: [Buildroot] [V2 2/3] libtomcrypt: new package
In-Reply-To: <1459524973-26730-2-git-send-email-francois.perrad@gadz.org>
References: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
 <1459524973-26730-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160402165838.7687760a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 17:36:12 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-install-without-USER-and-GROUP.patch      | 61 ++++++++++++++++++++++

Instead of this patch, can you try passing:

	USER=$(id -u) GROUP=$(id -g)

in the make options ?

> new file mode 100644
> index 0000000..073d6e7
> --- /dev/null
> +++ b/package/libtomcrypt/libtomcrypt.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# libtomcrypt
> +#
> +################################################################################
> +
> +LIBTOMCRYPT_VERSION = 1.17
> +LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
> +LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
> +LIBTOMCRYPT_LICENSE = WTFPL
> +LIBTOMCRYPT_LICENSE_FILES = LICENSE
> +LIBTOMCRYPT_INSTALL_STAGING = YES
> +LIBTOMCRYPT_DEPENDENCIES = libtommath
> +
> +define LIBTOMCRYPT_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC"
> +endef
> +
> +define LIBTOMCRYPT_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 install
> +endef

Same comment as libtommath regarding staging/target installation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
