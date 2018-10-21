From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 15:40:01 +0100
Subject: [Buildroot] [[PATCH v2 13/14] package/mender: add
 BR2_PACKAGE_MENDER_ARTIFACT_NAME option
In-Reply-To: <20180820130914.22377-14-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-14-mirza.krak@northern.tech>
Message-ID: <fd923bfd-85a2-2bf0-6edd-52a046ad1b30@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/08/2018 14:09, Mirza Krak wrote:
> ARTIFACT_NAME is used to set a unique string of the built artifact/image
> and this will be reported to the Mender managment server as "current
> software running".
> 
> The Mender managment server will skip updating device if the
> ARTIFACT_NAME is the same on the target device as in the Mender artifact
> and hence this name must be unique for every release.

 When a package needs some configuration, we don't usually add configure options
for it, but instead assume the user will create the necessary configuration
files in an overlay.

 In particular in this case, you probably want to generate it with a script that
looks at a git tag or something like that.

 This would be something good to document in the readme.txt that you were going
to write.

 If you want to deliver an out-of-the-box experience, you could create files
with some default values (which would normally get overwritten in the overlay).
But I'm not even sure we really want that.

 So I've marked this patch and the following one as Rejected.

 Regards,
 Arnout

> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/Config.in | 13 +++++++++++++
>  package/mender/mender.mk |  7 +++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 853a472ea1..8a6359c906 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -14,6 +14,19 @@ config BR2_PACKAGE_MENDER
>  
>  	  https://github.com/mendersoftware/mender
>  
> +if BR2_PACKAGE_MENDER
> +
> +config BR2_PACKAGE_MENDER_ARTIFACT_NAME
> +	string "Mender artifact name"
> +	help
> +	  The name of the image or update that will be built. This is
> +	  what the device will report that it is running, and different
> +	  updates must have different names.
> +
> +	  Will be stored in /etc/mender/artifact_info
> +
> +endif
> +
>  comment "mender needs a toolchain w/ threads"
>  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index a4b9c6ee85..0d4df3a763 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -34,6 +34,10 @@ MENDER_LICENSE_FILES = \
>  
>  MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
>  
> +ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME)),)
> +$(error Mender device type not set. Check your BR2_PACKAGE_MENDER_ARTIFACT_NAME setting)
> +endif
> +
>  define MENDER_INSTALL_CONFIG_FILES
>  	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
>  	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
> @@ -55,6 +59,9 @@ define MENDER_INSTALL_CONFIG_FILES
>  	)
>  
>  	ln -sf /data/mender $(TARGET_DIR)/var/lib/mender
> +
> +	echo "artifact_name=$(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME))" > \
> +		$(TARGET_DIR)/etc/mender/artifact_info
>  endef
>  
>  MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
> 
