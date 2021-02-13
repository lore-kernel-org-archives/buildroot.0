From: Alexander Dahl <post@lespocky.de>
Date: Sat, 13 Feb 2021 16:56:27 +0100
Subject: [Buildroot] [PATCHv2 3/7] package/pkg-cmake.mk: determine
 CMAKE_BUILD_TYPE depending on BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210212135451.22786-4-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-4-patrickdepinguin@gmail.com>
Message-ID: <20210213155627.tzvlickemz5apzpt@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

disclaimer: I'm no heavy buildroot user, but I have some experience
with CMake and embedded builds for real world products built with a
competing build system.

On Fri, Feb 12, 2021 at 02:54:46PM +0100, Thomas De Schampheleire wrote:
> The CMAKE_BUILD_TYPE is currently set as 'Debug' in case BR2_ENABLE_DEBUG is
> set, and as 'Release' in other cases. However, while the description of
> BR2_ENABLE_DEBUG is to enable debug symbols (no runtime impact), the 'Debug'
> build type in CMake can actually have runtime impact. For one, because it
> does not set -DNDEBUG like is done for 'Release', but also because packages
> may do custom things based on it.

For that description I would consider "RelWithDebInfo" the correct
option.

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

Why? What we want for devices in the field: no performance penalty,
but being able to analyze core dumps or even use gdb/gdbserver (which
is not ideal if you have optimization _and_ debug flags on at the same
time, but better than nothing).

Since you can have all the debug symbols detached (in general, don't
know if buildroot allows this), you don't need to copy them to the
target and we store it with our release builds and can access them
later for debugging.

> - orthogonally to the above, BR2_ENABLE_DEBUG still determines passing the
>   '-g' flag to enable debug symbols, and BR2_OPTIMIZE_X still determines the
>   used optimization flags.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  docs/manual/adding-packages-cmake.txt | 2 +-
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
> index c001051002..07b8091117 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -265,7 +265,7 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
>  		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
>  		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>  		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
> -		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
> +		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_RUNTIME_DEBUG),Debug,Release)#' \
>  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
>  		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
>  	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \

That said, I see no use anymore in using "Release" at all.
"RelWithDebInfo" in combination with detached debug symbols works as
well. This means, NDEBUG is set for both of those builds, so no real
difference. (Yes of course, it might affect build time and those
symbols take space.)

And for "real" debug you can turn on "Debug" with all the stuff
masked by NDEBUG before.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210213/13f55777/attachment.asc>
