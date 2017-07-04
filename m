From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 17:44:06 +0200
Subject: [Buildroot] [PATCH 042/100] libglib2: use the new gettext logic
In-Reply-To: <20170704144920.12318-43-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-43-thomas.petazzoni@free-electrons.com>
Message-ID: <db2fe4d5-cefc-fc9e-6910-ffd3f3b7047c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:48, Thomas Petazzoni wrote:
> This commit switches to use the new gettext logic, which involves:
> 
>  - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
>    on gettext/host-gettext
> 
>  - dropping BR2_PACKAGE_GETTEXT selection
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libglib2/Config.in   | 1 -
>  package/libglib2/libglib2.mk | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
> index 62e29ef..ea946ba 100644
> --- a/package/libglib2/Config.in
> +++ b/package/libglib2/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBGLIB2
>  	depends on BR2_USE_WCHAR # gettext

 As mentioned IRL: to be checked if this dependency on WCHAR is still needed.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_LIBFFI
>  	select BR2_PACKAGE_PCRE
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 577dcec..eeceeee 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -101,8 +101,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
>  	--with-pcre=system
>  
>  LIBGLIB2_DEPENDENCIES = \
> -	host-pkgconf host-libglib2 host-gettext \
> -	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
> +	host-pkgconf host-libglib2 \
> +	libffi pcre util-linux zlib $(TARGET_NLS_DEPENDENCIES)
>  
>  HOST_LIBGLIB2_DEPENDENCIES = \
>  	host-gettext \

 If the target libglib2 doesn't depend on gettext, why does the host one need it?

 Both of them independent of this patch, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
