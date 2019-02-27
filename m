From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Feb 2019 19:49:44 +0100
Subject: [Buildroot] [PATCH 1/1] support/dependencies: require at least
 CMake 3.8
In-Reply-To: <20190208221221.17852-1-fontaine.fabrice@gmail.com>
References: <20190208221221.17852-1-fontaine.fabrice@gmail.com>
Message-ID: <20190227184944.GA2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-02-08 23:12 +0100, Fabrice Fontaine spake thusly:
> gerbera package in version 1.3 unfortunately now requires CMake >= 3.8
> for C++17 macros:
> https://github.com/gerbera/gerbera/commit/b5fd39f30fb10385ec228b71377685206a609c3a
> 
> So we need to bump our requirement from 3.1 to 3.8. If the host doesn't
> have a CMake >= 3.8, Buildroot will build its own host-cmake package.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6405647b47b132ff5d0d211b92d407322d52d507
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/dependencies/check-host-cmake.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 4300e6f600..703bae400f 100644
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

Why do you drop this comment?

So, yes, the last part of it is wrong: we won;t whine, but we will build
our own. Otherwise, the comment is still valid, and I prefer a "generic"
comment rather than the name of the affected package.

If onwe wants to check why the version is set to 3.8, one can git-blame
the file, and see the commit log that identifies the culprit package.

Additionally, now that we update the version to 3.8, you may also remove
package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch

Regards,
Yann E. MORIN.

> -#
> -BR2_CMAKE_VERSION_MIN = 3.1
> +# gerbera package needs at least CMake 3.8
> +BR2_CMAKE_VERSION_MIN = 3.8
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
