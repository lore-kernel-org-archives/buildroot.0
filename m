From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 12 Feb 2018 19:27:39 +0000
Subject: [Buildroot] [PATCH v3 1/1] libcpprestsdk: fix building as a
 static library
In-Reply-To: <20180212172350.5697-1-aduskett@gmail.com>
References: <20180212172350.5697-1-aduskett@gmail.com>
Message-ID: <20180212192739.GB23199@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Looks good overall, just a small nit...

On Mon, 12 Feb 2018 12:23:50 -0500, Adam Duskett <aduskett@gmail.com> wrote:
> Use pkg-config to find OpenSSL. This will automatically find any
> dependent libraries and put them in the correct order for linking.
> 
> Upstream status: submitted
> https://github.com/Microsoft/cpprestsdk/pull/688
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Now using pkg-config instead of manually moving library search order
>     (Thomas)
> 
> Changes v2 -> v3:
>   - Removed spurious and unrelated change in patch. (Thomas)
> 
>  ...prestsdk-fix-building-as-a-static-library.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
> 
> diff --git a/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch b/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
> new file mode 100644
> index 0000000000..de900178d5
> --- /dev/null
> +++ b/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
> @@ -0,0 +1,38 @@
> +From 8a9c3db14a390c0a8788405e52e9b8737a430191 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 12 Feb 2018 07:49:34 -0500
> +Subject: [PATCH] libcpprestsdk: fix building as a static library
> +
> +Use pkg-config to find OpenSSL. This will automatically find any
> +dependent libraries and put them in the correct order for linking.
> +
> +Upstream status: submitted
> +https://github.com/Microsoft/cpprestsdk/pull/688
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + Release/cmake/cpprest_find_openssl.cmake | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/Release/cmake/cpprest_find_openssl.cmake b/Release/cmake/cpprest_find_openssl.cmake
> +index 0b49a7e..2be8afb 100644
> +--- a/Release/cmake/cpprest_find_openssl.cmake
> ++++ b/Release/cmake/cpprest_find_openssl.cmake
> +@@ -41,8 +41,12 @@ function(cpprest_find_openssl)
> +       # This should prevent linking against the system provided 0.9.8y
> +       set(_OPENSSL_VERSION "")
> +     endif()
> +-    find_package(OpenSSL 1.0.0 REQUIRED)
> +-
> ++    if(UNIX)
> ++		find_package(PkgConfig REQUIRED)
> ++		pkg_search_module(OPENSSL openssl REQUIRED)
> ++    else()
> ++    	find_package(OpenSSL 1.0.0 REQUIRED)
> ++	endif()

These added lines have a mix of spaces and tabs for indentation. It would be
nicer to use only tabs or only spaces, but I guess this is not an important
enough reason to avoid merging the patch :-)

> +     INCLUDE(CheckCXXSourceCompiles)
> +     set(CMAKE_REQUIRED_INCLUDES "${OPENSSL_INCLUDE_DIR}")
> +     set(CMAKE_REQUIRED_LIBRARIES "${OPENSSL_LIBRARIES}")
> +-- 
> +2.14.3
> +
> -- 
> 2.14.3

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180212/e65d5e17/attachment.asc>
