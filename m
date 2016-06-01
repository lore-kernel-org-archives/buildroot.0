From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:17:59 +0200
Subject: [Buildroot] [PATCH 2/8 RFC] package/golang-gb: create gb
 package to build and fetch go packages
In-Reply-To: <1454369465-4804-3-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
 <1454369465-4804-3-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <20160601221759.0578c1a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Feb 2016 00:30:59 +0100, Ludovic Guegan wrote:
> Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
> ---
>  package/Config.in.host           |  1 +
>  package/golang-gb/Config.in.host |  8 ++++++++
>  package/golang-gb/golang-gb.mk   | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/golang-gb/Config.in.host
>  create mode 100644 package/golang-gb/golang-gb.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 0625bd0..2d99d37 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -13,6 +13,7 @@ menu "Host utilities"
>  	source "package/genimage/Config.in.host"
>  	source "package/genpart/Config.in.host"
>  	source "package/golang/Config.in.host"
> +	source "package/golang-gb/Config.in.host"
>  	source "package/gptfdisk/Config.in.host"
>  	source "package/imx-usb-loader/Config.in.host"
>  	source "package/jq/Config.in.host"
> diff --git a/package/golang-gb/Config.in.host b/package/golang-gb/Config.in.host
> new file mode 100644
> index 0000000..b84a83f
> --- /dev/null
> +++ b/package/golang-gb/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_GOLANG_GB
> +	bool "golang-gb"
> +	depends on BR2_PACKAGE_HOST_GOLANG
> +	help
> +          gb is an alternative build tool for the Go programming language.
> +
> +	  https://getgb.io

I'm completely ignorant about Go. Why do we need this alternative build
tool? The flannel package contributed by Geoff, and the three packages
contributed by Christian don't need this alternative build tool.

What are the benefits of using this as opposed to what Geoff/Christian
are doing in their Go packages?

> +define HOST_GOLANG_GB_EXTRACT_CMDS
> +	mkdir -p $(@D)/src/github.com/constabulary
> +	tar xvaf $(DL_DIR)/golang-gb-$(GOLANG_GB_VERSION).tar.gz -C $(@D)
> +	mv $(@D)/gb-$(GOLANG_GB_VERSION) $(@D)/src/github.com/constabulary/gb

It is not clear why you are doing this here.

> +endef
> +
> +define HOST_GOLANG_GB_BUILD_CMDS
> +	env -i $(GOLANG_GB_ENV) $(GO_HOST_BINARY) install -v github.com/constabulary/gb/cmd/gb
> +	env -i $(GOLANG_GB_ENV) $(GO_HOST_BINARY) install -v github.com/constabulary/gb/cmd/gb-vendor

Why env -i ?

> +endef
> +
> +define HOST_GOLANG_GB_INSTALL_CMDS
> +	$(INSTALL) -m 755 $(@D)/bin/gb $(HOST_DIR)/usr/bin
> +	$(INSTALL) -m 755 $(@D)/bin/gb-vendor $(HOST_DIR)/usr/bin

We normally want:

	$(INSTALL) -D -m 0755 $(@D)/bin/gb $(HOST_DIR)/usr/bin/gb

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
