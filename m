From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 22:47:24 +0200
Subject: [Buildroot] [PATCHv3 03/15] package/pkg-cmake.mk: determine
 CMAKE_BUILD_TYPE depending on BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210525122750.5022-4-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-4-patrickdepinguin@gmail.com>
Message-ID: <7569e31f-2220-a6e5-219a-a5d854bc72f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The CMAKE_BUILD_TYPE is currently set as 'Debug' in case BR2_ENABLE_DEBUG is
> set, and as 'Release' in other cases. However, while the description of
> BR2_ENABLE_DEBUG is to enable debug symbols (no runtime impact), the 'Debug'
> build type in CMake can actually have runtime impact. For one, because it
> does not set -DNDEBUG like is done for 'Release', but also because packages
> may do custom things based on it.
> 
> The question of which CMAKE_BUILD_TYPE Buildroot should set, be it 'Debug',
> 'Release', 'RelWithDebInfo' or others, has come up several times in the
> past. See some references below:
> 
> - July 2016: switch from Debug to RelWithDebInfo:
>   https://git.buildroot.org/buildroot/commit/?id=4b0120183404913f7f7788ef4f0f6b51498ef363
> 
> - October 2016: switch from RelWithDebInfo back to Debug:
>   https://git.buildroot.org/buildroot/commit/?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
>   and changes to make sure Buildroot's flags are respected:
>   https://git.buildroot.org/buildroot/commit/?id=12494ef48f893684d0800e7f6fe39a2ceaed0451
> 
> - August 2017: bug #10246 - "BR2_ENABLE_DEBUG does not have the expected
>   effect for cmake packages"
>   https://bugs.busybox.net/show_bug.cgi?id=10246
> 
> - August 2017: mail thread following bug #10246:
>   http://lists.busybox.net/pipermail/buildroot/2017-August/200778.html
> 
> In the last mail thread, Samuel Martin confirmed that the 'Release' build
> type could be used in all cases, because Buildroot is actually making sure
> that the optimization flags are those determined by Buildroot, not the
> defaults of cmake, thanks to commit 12494ef48f.
> But Arnout Vandecappelle objected to using always 'Release', stating that
> users may actually want the extra assertions.
> 
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, Buildroot can now cater
> for all cases:
> 
> - use CMAKE_BUILD_TYPE=Release by default. This makes sure that there is no
>   unexpected performance degradation triggered by enabling BR2_ENABLE_DEBUG.
> 
> - users can optionally enable BR2_ENABLE_RUNTIME_DEBUG if they want runtime
>   debug info like assertions, at the risk of introducing performance
>   degradation. In this case, we switch to CMAKE_BUILD_TYPE=Debug.
> 
> - orthogonally to the above, BR2_ENABLE_DEBUG still determines passing the
>   '-g' flag to enable debug symbols, and BR2_OPTIMIZE_X still determines the
>   used optimization flags.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> --->  docs/manual/adding-packages-cmake.txt | 2 +-
>  package/pkg-cmake.mk                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index 73f0943024..541d7422cf 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -100,7 +100,7 @@ typical packages will therefore only use a few of them.
>    necessary to set them in the package's +*.mk+ file unless you want
>    to override them:
>  
> -** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
> +** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_RUNTIME_DEBUG+;
>  ** +CMAKE_INSTALL_PREFIX+;
>  ** +BUILD_SHARED_LIBS+ is driven by +BR2_STATIC_LIBS+;
>  ** +BUILD_DOC+, +BUILD_DOCS+ are disabled;
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 37078f3c34..4ee100a0c6 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -266,7 +266,7 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
>  		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>  		-e 's#@@TOOLCHAIN_HAS_CXX@@#$(if $(BR2_INSTALL_LIBSTDCPP),1,0)#' \
>  		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
> -		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
> +		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_RUNTIME_DEBUG),Debug,Release)#' \
>  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
>  		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
>  	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \
> 
