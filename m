From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 00:14:50 +0200
Subject: [Buildroot] [PATCH v5 1/9] package/pkg-cmake.mk: fix build type
 and optimization flags
In-Reply-To: <20161015210349.29432-2-s.martin49@gmail.com>
References: <20161015210349.29432-1-s.martin49@gmail.com>
 <20161015210349.29432-2-s.martin49@gmail.com>
Message-ID: <01bb48f3-1c37-20bc-7140-84a857793dfd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject is wrong: no optimization flags are fixed.

On 15-10-16 23:03, Samuel Martin wrote:
> tl;dr:
> 
> Before applying this patch, CMake packages are built with the following
> options:
>   * if BR2_ENABLE_DEBUG is set:
>     The CMake build type is set to RelWithDebInfo, which means:
>     - Optimization level is forced to: -O2;
>     - no log nor assert due to -DNDEBUG;
>     - BR2_DEBUG_{1..3} effect is unchanged;
>   * otherwise:
>     The CMake build type is set to Release, which means:
>     - Optimization level is forced to: -O3;
>     - no log nor assert due to -DNDEBUG (as expected).
>   In any case, the optimization WRT the binary size is always ignored and
>   forced.
> 
> This change chooses the build type doing the closest thing to what
> Buildroot attempts to do.
> 
> Long version:
> 
> Flags set by Buildroot depending on the configuration:
> 
>   BR2_ENABLE_DEBUG | Optim. level   | Buildroot {C,CXX}FLAGS
>   =================+================+=======================
>           y        | BR2_OPTIMIZE_S | -Os -gx
>           y        | BR2_OPTIMIZE_G | -Og -gx
>           y        | BR2_OPTIMIZE_n | -On -gx
>           n        | BR2_OPTIMIZE_S | -Os
>           n        | BR2_OPTIMIZE_G | -Og
>           n        | BR2_OPTIMIZE_n | -On
> 
> Default flags appended by CMake depending on the build type:
> 
>   Build type     | Flags           | Effects on {C,CXX}FLAGS
>   ===============+=================+===========================================
>   Debug          | -g              | Force -g, compatible with BR2_ENABLE_DEBUG
>   MinSizeRel     | -Os -DNDEBUG    | Set -Os, compatible with BR2_OPTIMIZE_S
>   Release        | -O3 -DNDEBUG    | Set -O3, closest to the others cases,
>                  |                 | though the optimization level is forced.
>   RelWithDebInfo | -O2 -g -DNDEBUG | Force -g and set -O2, not friendly with BR
> 
> Since CMake appends its own build type flags and because of the gcc
> option parser, the CMake flags takes precedence over the Buildroot
> flags.
> 
> So, this change sets the build type in a very simple way depending on
> the BR2_ENABLE_DEBUG symbol.
> 
> Follow-up patches will fix the CMake flag variables that are appended by
> CMake.

 Most of this explanation fits better in patch 3, because here we're not yet
fixing anything.

 Also, this patch is now basically reverting
4b0120183404913f7f7788ef4f0f6b51498ef363, so that should be mentioned.

 How about:

package/pkg-cmake.mk: use Debug or Release build types

Before applying this patch, CMake packages are built with the following
options:
  * if BR2_ENABLE_DEBUG is set:
    The CMake build type is set to RelWithDebInfo, which means:
    - Optimization level is forced to: -O2;
    - no log nor assert due to -DNDEBUG;
    - BR2_DEBUG_{1..3} effect is unchanged;
  * otherwise:
    The CMake build type is set to Release, which means:
    - Optimization level is forced to: -O3;
    - no log nor assert due to -DNDEBUG (as expected).
  In any case, the optimization WRT the binary size is always ignored and
  forced.

In particular, the -DNDEBUG added by RelWithDebInfo is wrong because it removes
assertions and logging, which is exactly what we do want in BR2_ENABLE_DEBUG.

Follow-up patches will fix the CMake flag variables that are appended by CMake.
But then, the 'Debug' and 'Release' config types make more semantical sense than
'RelWithDebInfo' and 'Release'. So revert commit 4b012018 which introduced
RelWithDebInfo.


> 
> Cc: Charles Hardin <ckhardin@exablox.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> ---
> changes v4->v5:
> - none
> 
> changes v3->v4:
> - simplify build type selection
> ---
>  package/pkg-cmake.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index aca9e61..259865d 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -35,6 +35,14 @@ ifneq ($(QUIET),)
>  CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>  endif
>  
> +# Set the CMake build type which matches the best the build configuration sets
> +# in Buildroot.

 This explanation is now not needed anymore: it's quite obvious that debug
corresponds to debug...

> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +BR_CMAKE_BUILD_TYPE=Debug
> +else
> +BR_CMAKE_BUILD_TYPE=Release
> +endif

 This is now so simple that the original in-line definition is good enough.

 In other words, I would do an exact revert of commit 4b012018 instead of
introducing a new symbol that is used only once (after patch 2 it is still used
only once).

 Regards,
 Arnout

> +
>  ################################################################################
>  # inner-cmake-package -- defines how the configuration, compilation and
>  # installation of a CMake package should be done, implements a few hooks to
> @@ -87,7 +95,7 @@ define $(2)_CONFIGURE_CMDS
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> -		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
> +		-DCMAKE_BUILD_TYPE=$(BR_CMAKE_BUILD_TYPE) \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
>  		-DBUILD_DOC=OFF \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
