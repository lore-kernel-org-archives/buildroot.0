From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 9 Aug 2016 18:55:50 +0300
Subject: [Buildroot] [PATCH 1/1] libical: Create option to use builtin
 tzdata
In-Reply-To: <1470751327-64254-1-git-send-email-marc@khouri.ca>
References: <1470751327-64254-1-git-send-email-marc@khouri.ca>
Message-ID: <20160809155550.GF845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marc,

On Tue, Aug 09, 2016 at 10:02:07AM -0400, Marc Khouri wrote:
> libical requires time zone data (either system or internal) in order
> to use time zone related functions. This commit adds an option to
> build libical with its internal time zone data. If no time zone data
> is present, segfaults occur in applications which use time zone functions.
> 
> Option documentation:
> https://github.com/libical/libical/blob/v1.0.1/CMakeLists.txt#L23
> 
> Signed-off-by: Marc Khouri <marc@khouri.ca>
> ---
>  package/libical/Config.in  | 12 ++++++++++++
>  package/libical/libical.mk |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/libical/Config.in b/package/libical/Config.in
> index 48170e9..e183ad0 100644
> --- a/package/libical/Config.in
> +++ b/package/libical/Config.in
> @@ -9,6 +9,18 @@ config BR2_PACKAGE_LIBICAL
>  
>  	  http://libical.github.io/libical
>  
> +if BR2_PACKAGE_LIBICAL
> +
> +config BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA
> +	bool "use built-in timezone data"
> +	help
> +	  Build using libical's (instead of the system's) timezone data.
> +
> +	  libical requires either built-in or system timezone data in order
> +	  to support time zone functions.
> +
> +endif
> +
>  comment "libical needs a toolchain w/ C++, dynamic library, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		BR2_STATIC_LIBS
> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
> index e8cb3f8..a8bcefb 100644
> --- a/package/libical/libical.mk
> +++ b/package/libical/libical.mk
> @@ -14,4 +14,8 @@ LIBICAL_LICENSE_FILES = LICENSE
>  # Gentoo/alpinelinux as well
>  LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
>  
> +ifeq ($(BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA),y)
> +LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
> +endif

Why not detect this automatically? Something like (untested):

ifeq ($(BR2_PACKAGE_TZDATA),)
LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
