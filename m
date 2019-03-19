From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Mar 2019 06:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpcap: fix
 bluez5_utils-headers dependency
In-Reply-To: <20190318224042.4568-1-fontaine.fabrice@gmail.com>
References: <20190318224042.4568-1-fontaine.fabrice@gmail.com>
Message-ID: <20190319044423.46h2z3cgmr6zdxjh@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Mon, Mar 18, 2019 at 11:40:42PM +0100, Fabrice Fontaine wrote:
> Commit c46afc37dc877f1e94ffde0d77585290711b27ec changed bluez5-utils
> dependency by bluez5_utils-headers without replacing the test on
> BR2_PACKAGE_BLUEZ5_UTILS by BR2_PACKAGE_BLUEZ5_UTILS_HEADERS
> 
> Fix this mistake and also add a select on
> BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS is set
> so the user does not have to do it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c6828df1f3782564451ddd4187ff026679bf37d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/libpcap/Config.in  | 1 +
>  package/libpcap/libpcap.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
> index 643acbef6e..74429f209a 100644
> --- a/package/libpcap/Config.in
> +++ b/package/libpcap/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBPCAP
>  	bool "libpcap"
> +	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  A system-independent library for user-level network packet
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index 2f46426d37..ebceca5273 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -26,7 +26,7 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
>  endef
>  LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
>  
> -ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
>  LIBPCAP_DEPENDENCIES += bluez5_utils-headers
>  else
>  LIBPCAP_CONF_OPTS += --disable-bluetooth
> -- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
