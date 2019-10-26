From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 26 Oct 2019 14:31:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uvw: new package
In-Reply-To: <20191026071905.23036-2-asafka7@gmail.com>
References: <20191026071905.23036-1-asafka7@gmail.com>
 <20191026071905.23036-2-asafka7@gmail.com>
Message-ID: <CAKcgs2wLdiW+vHL=f-coL4sHa-8iH_atBSQ3T+w+tJgmc=tVdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

thanks for your contribution. A few comments below.

Le sam. 26 oct. 2019 ? 09:19, Asaf Kahlon <asafka7@gmail.com> a ?crit :
>
> A header-only libuv wrapper in C++.
>
> A patch is added to enable in-tree build, which is
> checked and prevented by the package and fails the build.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v1->v2: add missing entry in DEVELOPERS
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...-CMakeLists.txt-allow-in-place-build.patch | 32 +++++++++++++++++++
>  package/uvw/Config.in                         | 16 ++++++++++
>  package/uvw/uvw.hash                          |  3 ++
>  package/uvw/uvw.mk                            | 15 +++++++++
>  6 files changed, 68 insertions(+)
>  create mode 100644 package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
>  create mode 100644 package/uvw/Config.in
>  create mode 100644 package/uvw/uvw.hash
>  create mode 100644 package/uvw/uvw.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ec4f50a79e..b9e6881419 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -239,6 +239,7 @@ F:  package/python*
>  F:     package/snmpclitools/
>  F:     package/spdlog/
>  F:     package/uftp/
> +F:     package/uvw/
>  F:     package/zeromq/
>
>  N:     Ash Charles <ashcharles@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index d78b4c444b..901c25fe02 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1805,6 +1805,7 @@ endif
>         source "package/tinycbor/Config.in"
>         source "package/tz/Config.in"
>         source "package/tzdata/Config.in"
> +       source "package/uvw/Config.in"
>         source "package/xapian/Config.in"
>  endmenu
>
> diff --git a/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
> new file mode 100644
> index 0000000000..01068d0427
> --- /dev/null
> +++ b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
> @@ -0,0 +1,32 @@
> +From 1d784a0067b7123971c834c77f4f137acca56ae6 Mon Sep 17 00:00:00 2001
> +From: Asaf Kahlon <asafka7@gmail.com>
> +Date: Fri, 25 Oct 2019 19:09:14 +0300
> +Subject: [PATCH 1/1] CMakeLists.txt: allow in-tree build
> +
> +Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> +---
> + CMakeLists.txt | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9fc5538..4aaabf7 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -4,14 +4,6 @@
> +
> + cmake_minimum_required(VERSION 3.2)
> +
> +-#
> +-# Building in-tree is not allowed (we take care of your craziness).
> +-#
> +-
> +-if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
> +-    message(FATAL_ERROR "Prevented in-tree built. Please create a build directory outside of the source code and call cmake from there. Thank you.")
> +-endif()
> +-
> + #
> + # Project configuration
> + #
> +--
> +2.20.1
> +
> diff --git a/package/uvw/Config.in b/package/uvw/Config.in
> new file mode 100644
> index 0000000000..58e68392af
> --- /dev/null
> +++ b/package/uvw/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_UVW
> +       bool "uvw"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
There's also a dependendy on the toolchain version. The package author
mentioned "a compiler that supports at least C++17"

> +       depends on BR2_USE_MMU # libuv
> +       depends on !BR2_STATIC_LIBS # libuv
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
What about selecting libuv here? I think this would be convenient for
the user to enable libuv through uvw.

Also, as there's seems to be such a dependency between this package
and libuv, I would add a comment in package/libuv/libuv.mk to instruct
the developer to bump uvw along with libuv.

thanks
regards
Gilles.
