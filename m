From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Oct 2017 06:50:11 +0300
Subject: [Buildroot] [PATCH 2/2] package/kodi: use package
 host-openjdk-bootstrap to provide JDK
In-Reply-To: <20171001205319.11803-2-bernd.kuhls@t-online.de>
References: <20171001205319.11803-1-bernd.kuhls@t-online.de>
 <20171001205319.11803-2-bernd.kuhls@t-online.de>
Message-ID: <20171002035011.icssutqx4njasdl3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Oct 01, 2017 at 10:53:19PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 10 +++++++++-
>  package/kodi/kodi.mk   |  7 +++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index fc7eafa41a..79c53380f9 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -46,7 +46,7 @@ menuconfig BR2_PACKAGE_KODI
>  	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON
>  	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
> -	select BR2_NEEDS_HOST_JAVA
> +	select BR2_NEEDS_HOST_JAVA if !(BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_FFMPEG
> @@ -65,6 +65,7 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_LIBSAMPLERATE
>  	select BR2_PACKAGE_LZO
>  	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_KODI_OPENJDK if (BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")

What is the advantage of the BR2_PACKAGE_KODI_OPENJDK -> 
BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP indirection? Why not select 
BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP directly here, ...

>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_PCRE_UCP
> @@ -191,6 +192,13 @@ config BR2_PACKAGE_KODI_NONFREE
>  	  Enable components with non-free licenses. This option
>  	  currently only controls support for RAR archives.
>  
> +config BR2_PACKAGE_KODI_OPENJDK
> +	bool
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # openjdk-botstrap
> +	select BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP
> +	help
> +	  Use the buildroot-provided host-openjdk-bootstrap package.
> +

... get rid of BR2_PACKAGE_KODI_OPENJDK here, ...

>  config BR2_PACKAGE_KODI_PULSEAUDIO
>  	bool "pulseaudio"
>  	# Pulseaudio support in kodi needs glib support in Pulseaudio,
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 28fe256b65..bd9d1ae6dd 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -156,6 +156,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  KODI_CXX_FLAGS += -latomic
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KODI_OPENJDK),y)

... and use BR2_PACKAGE_HOST_OPENJDK_BOOTSTRAP here?

> +KODI_CONF_ENV = \
> +	JAVA_HOME=$(HOST_OPENJDK_BOOTSTRAP_DIR) \
> +	PATH=$(HOST_OPENJDK_BOOTSTRAP_DIR)/bin:$(BR_PATH)
> +KODI_DEPENDENCIES += host-openjdk-bootstrap
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
>  KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
>  KODI_DEPENDENCIES += mysql

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
