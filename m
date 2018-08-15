From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Aug 2018 08:10:56 +0300
Subject: [Buildroot] [PATCH 4/8] package/mender: add
 BR2_PACKAGE_MENDER_ARTIFACT_NAME option
In-Reply-To: <20180814231337.19114-5-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-5-mirza.krak@northern.tech>
Message-ID: <87va8cnrj3.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mirza,

Mirza Krak writes:
> ARTIFACT_NAME is used to set a unique string of the built artifact/image
> and this will be reported to the Mender managment server as "current
> software running".
>
> The Mender managment server will skip updating device if the
> ARTIFACT_NAME is the same on the target device as in the Mender artifact
> and hence this name must be unique for every release.
>
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/Config.in | 13 +++++++++++++
>  package/mender/mender.mk |  7 +++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 8c2838c64a..036b7cf798 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -13,6 +13,19 @@ config BR2_PACKAGE_MENDER
>  
>  	  https://github.com/mendersoftware/mender
>  
> +if BR2_PACKAGE_MENDER
> +
> +config BR2_PACKAGE_MENDER_ARTIFACT_NAME
> +	string "Mender artifact name"

You should have a default value here. Otherwise ...

> +	help
> +	  The name of the image or update that will be built. This is what the
> +	  device will report that it is running, and different updates must have
> +	  different names.
> +
> +	  Will be stored in /etc/mender/artifact_info
> +
> +endif
> +
>  comment "mender needs a toolchain w/ threads"
>  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index b2df70256a..08bdd4bd78 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -9,6 +9,10 @@ MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>  MENDER_LICENSE = Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT & OLDAP-2.8
>  MENDER_LICENSE_FILES = LICENSE LIC_FILES_CHKSUM.sha256
>  
> +ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME)),)
> +$(error Mender device type not set. Check your BR2_PACKAGE_MENDER_ARTIFACT_NAME setting)

... this error will trigger by default. This will hit the autobuilders
badly.

Same goes for the next patch.

baruch

> +endif
> +
>  define MENDER_INSTALL_CONFIG_FILES
>  	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
>  	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
> @@ -28,6 +32,9 @@ define MENDER_INSTALL_CONFIG_FILES
>  		$(TARGET_DIR)/usr/share/mender/inventory
>  
>  	ln -sf /data/mender $(TARGET_DIR)/var/lib/mender
> +
> +	echo "artifact_name=$(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME))" > \
> +		$(TARGET_DIR)/etc/mender/artifact_info
>  endef
>  
>  MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
