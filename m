From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:09:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libzip: fix build with musl-fts
In-Reply-To: <20191011172615.2242-1-fontaine.fabrice@gmail.com>
References: <20191011172615.2242-1-fontaine.fabrice@gmail.com>
Message-ID: <03c2ce97-f795-ee85-9e4a-34663d363226@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/2019 19:26, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/89f5fc111bb8bcecbe05ab79d62ac809094b6ce1

 Ha, we didn't think of that when adding musl-fts... Packages that check for
fts.h may now fail to build because they find fts.h but don't link with -lfts...

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libzip/Config.in | 1 +
>  package/libzip/libzip.mk | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/package/libzip/Config.in b/package/libzip/Config.in
> index f69dd0d4d5..c6ddabe6b5 100644
> --- a/package/libzip/Config.in
> +++ b/package/libzip/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBZIP
>  	bool "libzip"
>  	depends on !BR2_STATIC_LIBS # dlsym()
> +	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  C library for reading, creating, and modifying zip archives.
> diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
> index 280ca6d8c7..a312dd90df 100644
> --- a/package/libzip/libzip.mk
> +++ b/package/libzip/libzip.mk
> @@ -33,5 +33,10 @@ else
>  LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +LIBZIP_DEPENDENCIES += musl-fts
> +LIBZIP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
> +endif
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> 
