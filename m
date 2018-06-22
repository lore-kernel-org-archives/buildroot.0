From: Joel Carlson <joelsoncarl@gmail.com>
Date: Fri, 22 Jun 2018 10:28:19 -0600
Subject: [Buildroot] [PATCH v3 1/1] cmocka: new package
In-Reply-To: <1529533571-22499-1-git-send-email-JoelsonCarl@gmail.com>
References: <1529533571-22499-1-git-send-email-JoelsonCarl@gmail.com>
Message-ID: <CAAjKBV_N0+TmOMvy+XuYatkPiNUrOk_31dWGnfTADSh7qG0+AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 20, 2018 at 4:26 PM, Joel Carlson <joelsoncarl@gmail.com> wrote:
> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
> v2 was by Nimai Mahajan, here: http://patchwork.ozlabs.org/patch/500181/
>
> Changes v2 -> v3
>   - changed from v1.0.1 to v1.1.1
>   - added dependency on !BR2_STATIC_LIBS (suggested by Romain)
>   - added patch to fix build issue for toolchains without stack protection
>     (issue found by Romain)
>   - added generation of static library for BR2_SHARED_STATIC_LIBS
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  ...0001-cmocka-cmake-fix-stack-protect-check.patch | 34 ++++++++++++++++++++++
>  package/cmocka/Config.in                           | 15 ++++++++++
>  package/cmocka/cmocka.hash                         |  2 ++
>  package/cmocka/cmocka.mk                           | 23 +++++++++++++++
>  6 files changed, 76 insertions(+)
>  create mode 100644 package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
>  create mode 100644 package/cmocka/Config.in
>  create mode 100644 package/cmocka/cmocka.hash
>  create mode 100644 package/cmocka/cmocka.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d22ac52..229a584 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -966,6 +966,7 @@ N:  Jeremy Rosen <jeremy.rosen@openwide.fr>
>  F:     package/fxload/
>
>  N:     Joel Carlson <JoelsonCarl@gmail.com>
> +F:     package/cmocka/
>  F:     package/flatcc/
>
>  N:     Joel Stanley <joel@jms.id.au>
> diff --git a/package/Config.in b/package/Config.in
> index a5ecfec..f60af1e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1501,6 +1501,7 @@ menu "Other"
>         source "package/clang/Config.in"
>         source "package/clapack/Config.in"
>         source "package/classpath/Config.in"
> +       source "package/cmocka/Config.in"
>         source "package/cppcms/Config.in"
>         source "package/cracklib/Config.in"
>         source "package/dawgdic/Config.in"
> diff --git a/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch b/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
> new file mode 100644
> index 0000000..c7a2c27
> --- /dev/null
> +++ b/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
> @@ -0,0 +1,34 @@
> +From f9a964edde4011adf88902018cbb87723d78d0a2 Mon Sep 17 00:00:00 2001
> +From: Joel Carlson <JoelsonCarl@gmail.com>
> +Date: Wed, 20 Jun 2018 14:35:13 -0600
> +Subject: [PATCH 1/1] cmocka cmake: fix stack protect check
> +
> +The cmake check for if -fstack-protect is supported needs to use
> +CMAKE_REQUIRED_FLAGS and not CMAKE_REQUIRED_DEFINITIONS.
> +
> +Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> +---
> +Upstream status: submitted to cmocka mailing list

Note: this is now committed to the cmocka master branch as commit
d677b564c2193a5cd381925c2eeaad6b23c6af2f

> +
> + cmake/Modules/CheckCCompilerFlagSSP.cmake | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/cmake/Modules/CheckCCompilerFlagSSP.cmake b/cmake/Modules/CheckCCompilerFlagSSP.cmake
> +index 2fe4395..ed34eb3 100644
> +--- a/cmake/Modules/CheckCCompilerFlagSSP.cmake
> ++++ b/cmake/Modules/CheckCCompilerFlagSSP.cmake
> +@@ -19,8 +19,8 @@
> + include(CheckCSourceCompiles)
> +
> + function(CHECK_C_COMPILER_FLAG_SSP _FLAG _RESULT)
> +-   set(SAFE_CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS}")
> +-   set(CMAKE_REQUIRED_DEFINITIONS "${_FLAG}")
> ++   set(SAFE_CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS}")
> ++   set(CMAKE_REQUIRED_FLAGS "${_FLAG}")
> +    check_c_source_compiles("int main(int argc, char **argv) { char buffer[256]; return buffer[argc]=0;}" ${_RESULT})
> +-   set(CMAKE_REQUIRED_DEFINITIONS "${SAFE_CMAKE_REQUIRED_DEFINITIONS}")
> ++   set(CMAKE_REQUIRED_FLAGS "${SAFE_CMAKE_REQUIRED_FLAGS}")
> + endfunction(CHECK_C_COMPILER_FLAG_SSP)
> +--
> +2.7.4
> +

[snip]
