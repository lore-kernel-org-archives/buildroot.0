From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Sep 2017 12:32:09 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20170914090043.1240-1-alexander.i.mukhin@gmail.com>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914090043.1240-1-alexander.i.mukhin@gmail.com>
Message-ID: <20170914093209.r5xwd4outafdxrmv@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Thu, Sep 14, 2017 at 12:00:43PM +0300, Alexander Mukhin wrote:
> Since kernel drivers for Realtek wireless chips use non-standard
> interfaces, upstream hostapd does not support them. One have to apply
> an external patch for hostapd to work with these chips. See:
> https://github.com/pritambaral/hostapd-rtl871xdrv
> 
> A configuration option is added to enable support for Realtek chips,
> and it's turned off by default.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  DEVELOPERS                                         |  3 +++
>  .../0001-add-realtek-driver-to-defconfig.patch     | 29 ++++++++++++++++++++++
>  .../0002-add-rtl871xdrv-to-sample-config.patch     | 28 +++++++++++++++++++++

I don't think these patches are needed. Just use HOSTAPD_CONFIG_SET instead of 
HOSTAPD_CONFIG_ENABLE. Actually, I think we don't need HOSTAPD_CONFIG_ENABLE 
at all, only HOSTAPD_CONFIG_SET. But that's for another patch.

baruch

>  package/hostapd/Config.in                          |  5 ++++
>  package/hostapd/hostapd.hash                       |  1 +
>  package/hostapd/hostapd.mk                         |  5 ++++
>  6 files changed, 71 insertions(+)
>  create mode 100644 package/hostapd/0001-add-realtek-driver-to-defconfig.patch
>  create mode 100644 package/hostapd/0002-add-rtl871xdrv-to-sample-config.patch
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 21eafc9d2..57fc74c25 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -68,6 +68,9 @@ F:	package/putty/
>  N:	Alexander Lukichev <alexander.lukichev@espotel.com>
>  F:	package/openpgm/
>  
> +N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +F:	package/hostapd/
> +
>  N:	Alexander Varnin <fenixk19@mail.ru>
>  F:	package/liblog4c-localtime/
>  
> diff --git a/package/hostapd/0001-add-realtek-driver-to-defconfig.patch b/package/hostapd/0001-add-realtek-driver-to-defconfig.patch
> new file mode 100644
> index 000000000..3cc5f624f
> --- /dev/null
> +++ b/package/hostapd/0001-add-realtek-driver-to-defconfig.patch
> @@ -0,0 +1,29 @@
> +From 8ae1094c52e462071cd98c994f463af9bdb6ac08 Mon Sep 17 00:00:00 2001
> +From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +Date: Wed, 13 Sep 2017 11:28:50 +0300
> +Subject: [PATCH 1/2] add realtek driver to defconfig
> +
> +Add configuration variable for rtl871xdrv driver.
> +
> +Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +---
> + hostapd/defconfig | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/hostapd/defconfig b/hostapd/defconfig
> +index 4659dd1..7e4667b 100644
> +--- a/hostapd/defconfig
> ++++ b/hostapd/defconfig
> +@@ -41,6 +41,9 @@ CONFIG_DRIVER_NL80211=y
> + #LIBS_p += -L/usr/local/lib
> + #LIBS_c += -L/usr/local/lib
> + 
> ++# Driver interface for Realtek chips (rtl871xdrv)
> ++#CONFIG_DRIVER_RTW=y
> ++
> + # Driver interface for no driver (e.g., RADIUS server only)
> + #CONFIG_DRIVER_NONE=y
> + 
> +-- 
> +2.11.0
> +
> diff --git a/package/hostapd/0002-add-rtl871xdrv-to-sample-config.patch b/package/hostapd/0002-add-rtl871xdrv-to-sample-config.patch
> new file mode 100644
> index 000000000..c4907fdf0
> --- /dev/null
> +++ b/package/hostapd/0002-add-rtl871xdrv-to-sample-config.patch
> @@ -0,0 +1,28 @@
> +From 79de732e82439953e1de82208cf48ae9ae55a816 Mon Sep 17 00:00:00 2001
> +From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +Date: Wed, 13 Sep 2017 11:29:49 +0300
> +Subject: [PATCH 2/2] add rtl871xdrv to sample config
> +
> +Add rtl871xdrv to the list of possible drivers.
> +
> +Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +---
> + hostapd/hostapd.conf | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
> +index fa9a855..ef4d7ee 100644
> +--- a/hostapd/hostapd.conf
> ++++ b/hostapd/hostapd.conf
> +@@ -20,7 +20,7 @@ interface=wlan0
> + # interface is also created.
> + #bridge=br0
> + 
> +-# Driver interface type (hostap/wired/none/nl80211/bsd);
> ++# Driver interface type (hostap/wired/none/nl80211/bsd/rtl871xdrv);
> + # default: hostap). nl80211 is used with all Linux mac80211 drivers.
> + # Use driver=none if building hostapd as a standalone RADIUS server that does
> + # not control any wireless/wired driver.
> +-- 
> +2.11.0
> +
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 62fbb66d6..18b9665ec 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -14,6 +14,11 @@ config BR2_PACKAGE_HOSTAPD
>  
>  if BR2_PACKAGE_HOSTAPD
>  
> +config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
> +	bool "Enable rtl871x driver"
> +	help
> +	  Enable support for Realtek wireless chips.
> +
>  config BR2_PACKAGE_HOSTAPD_ACS
>  	bool "Enable ACS"
>  	default y
> diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
> index fb891476b..83bfd0e7e 100644
> --- a/package/hostapd/hostapd.hash
> +++ b/package/hostapd/hostapd.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
> +sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index dc28d1323..27240bbbb 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -44,6 +44,11 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
>  HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
> +HOSTAPD_PATCH = https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
> +HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_RTW
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
>  HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
