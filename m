From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Feb 2017 18:08:44 +0200
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to
 install "bdaddr"
In-Reply-To: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
References: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
Message-ID: <20170214160844.ts44yh2l4ghzwvad@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vishal Thanki,

On Tue, Feb 14, 2017 at 04:03:52PM +0100, Vishal Thanki wrote:
> "bdaddr" utility allows to change the Bluetooth device
> address. This patch adds a config option to enable
> installation of bdaddr utility.
> 
> Signed-off-by: Vishal Thanki <vishalthanki@gmail.com>
> ---
>  package/bluez5_utils/Config.in       | 6 ++++++
>  package/bluez5_utils/bluez5_utils.mk | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index a7c0ee4..00f8ec2 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -64,6 +64,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
>  	help
>  	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
>  
> +config BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR
> +	bool "install bdaddr tool"
> +	depends on BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
> +	help
> +	  The "bdaddr" tool is used for changing the Bluetooth device address.

bdaddr is less than 100KB. I don't think it's worth another config option. 
100KB is negligible when you already have glib and dbus. I'd suggested to 
either install bdaddr unconditionally, or have a single option for all tools/ 
executables that are not covered by another config option already.

> +
>  config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
>  	bool "build sixaxis plugin"
>  	depends on BR2_PACKAGE_HAS_UDEV
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 66c3eab..f9e73c2 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -38,6 +38,13 @@ else
>  BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR),y)
> +define BLUEZ5_UTILS_INSTALL_BDADDR
> +	$(INSTALL) -D -m 0755 $(@D)/tools/bdaddr $(TARGET_DIR)/usr/bin/bdaddr
> +endef
> +BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_BDADDR
> +endif
> +
>  # enable sixaxis plugin
>  ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
>  BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
