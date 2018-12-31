From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2018 17:44:54 +0100
Subject: [Buildroot] [PATCH] support/dependencies: require at least
 CMake 3.8
In-Reply-To: <20181231162638.13606-1-thomas.petazzoni@bootlin.com>
References: <20181231162638.13606-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231164454.GA26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-31 17:26 +0100, Thomas Petazzoni spake thusly:
> The json-for-modern-cpp package unfortunately now requires CMake >=
> 3.8, so we need to bump our requirement from 3.1 to 3.8. If the host
> doesn't have a CMake >= 3.8, Buildroot will build its own host-cmake
> package.

The upstream commit that bumped the requirement to cmake 3.8 states:

    Using target_compile_features to specify C++ 11 standard
    https://github.com/nlohmann/json/commit/73cc5089e33ea950b6677e19ee7ec656c9bcf985

However, target_compile_features has been available even since 3.1 at
least:

    https://cmake.org/cmake/help/v3.1/command/target_compile_features.html

I'll kick-start a build with a patched json-for-modern-cpp, to see if we
can stay on 3.1.

Regards,
Yann E. MORIN.

> Fixes:
> 
>   http://autobuild.buildroot.org/results/1f893d8bc7df3bfefd31df69aba918e2121cfaf7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/dependencies/check-host-cmake.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 4300e6f600..3ea422ea87 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,14 +1,5 @@
> -# Versions before 3.0 are affected by the bug described in
> -# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
> -# and fixed in upstream CMake in version 3.0:
> -# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> -#
> -# Set this to either 3.0 or higher, depending on the highest minimum
> -# version required by any of the packages bundled in Buildroot. If a
> -# package is bumped or a new one added, and it requires a higher
> -# version, our cmake infra will catch it and whine.
> -#
> -BR2_CMAKE_VERSION_MIN = 3.1
> +# The json-for-modern-cpp package needs at least CMake 3.8
> +BR2_CMAKE_VERSION_MIN = 3.8
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
