From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 22:53:51 +0100
Subject: [Buildroot] [PATCHv2 7/7] package/sysrepo: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210212135451.22786-8-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-8-patrickdepinguin@gmail.com>
Message-ID: <89a0c2b0-0769-4836-ec34-f205679d38df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 14:54, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> sysrepo explicitly set CMAKE_BUILD_TYPE=Release, ignoring any possible
> value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
> 
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> longer be necessary. Users that do not wish to have additional runtime
> debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: Jan Kundr?t:
> - explicitly set REPO_PATH, which is set to a host path in case of
>   CMAKE_BUILD_TYPE=Debug (see e.g.
>   https://github.com/sysrepo/sysrepo/blob/v1.4.104/CMakeLists.txt#L138-L144)
> 
>  package/sysrepo/sysrepo.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index e4d553cdbd..768cde8d35 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -13,8 +13,8 @@ SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
>  HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
>  
>  SYSREPO_CONF_OPTS = \
> -	-DCMAKE_BUILD_TYPE=Release \
> -	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF)
> +	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
> +	-DREPO_PATH=/etc/sysrepo

 Another effect of CMAKE_BUILD_TYPE=Debug for this package is that it enables
the tests, so we should probably also add

	-DENABLE_TESTS=OFF \
	-DENABLE_VALGRIND_TESTS=OFF


>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> @@ -26,7 +26,6 @@ define SYSREPO_INSTALL_INIT_SYSV
>  endef
>  
>  HOST_SYSREPO_CONF_OPTS = \
> -	-DCMAKE_BUILD_TYPE=Release \

 Note that this change could be made independent of the rest of the series,
because for host builds we always use the default build type for that package.

 Regards,
 Arnout

>  	-DBUILD_EXAMPLES=OFF \
>  	-DREPO_PATH=$(TARGET_DIR)/etc/sysrepo
>  
> 
