From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:11:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/libgsm: new package
In-Reply-To: <1430060451-4075-2-git-send-email-bernd.kuhls@t-online.de>
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
 <1430060451-4075-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426191104.1dafb792@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 17:00:49 +0200, Bernd Kuhls wrote:

> diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
> new file mode 100644
> index 0000000..e272e7c
> --- /dev/null
> +++ b/package/libgsm/libgsm.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# libgsm
> +#
> +################################################################################
> +
> +LIBGSM_VERSION = 1.0.14
> +LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
> +LIBGSM_SITE = http://www.quut.com/gsm
> +LIBGSM_INSTALL_STAGING = YES

License + license file?

> +define LIBGSM_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)

Do need for cd $(@D) when you do -C $(@D). Ditto for the commands below.

Also, please try to use $(TARGET_CONFIGURE_OPTS) instead of just
CC=$(TARGET_CC).

> +endef
> +
> +# install targets are not safe for parallel jobs
> +define LIBGSM_INSTALL_STAGING_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE1) CC=$(TARGET_CC) -C $(@D) \
> +		INSTALL_ROOT=$(STAGING_DIR)/usr \
> +		GSM_INSTALL_INC=$(STAGING_DIR)/usr/include \
> +		install
> +endef
> +
> +define LIBGSM_INSTALL_TARGET_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE1) CC=$(TARGET_CC) -C $(@D) \
> +		INSTALL_ROOT=$(TARGET_DIR)/usr \
> +		GSM_INSTALL_INC=$(TARGET_DIR)/usr/include \
> +		GSM_INSTALL_MAN=$(TARGET_DIR)/usr/share/man/man3 \
> +		TOAST_INSTALL_MAN=$(TARGET_DIR)/usr/share/man/man1 \

Where are the manpages going in the case of the staging installation?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
