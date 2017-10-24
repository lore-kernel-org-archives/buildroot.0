From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Oct 2017 23:48:23 +0200
Subject: [Buildroot] [PATCH v4 1/1] libcpprestsdk: new package
In-Reply-To: <20171023134936.13457-1-aduskett@gmail.com>
References: <20171023134936.13457-1-aduskett@gmail.com>
Message-ID: <364e8612-c027-243f-0c54-ed187cbde320@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 15:49, Adam Duskett wrote:
> The C++ REST SDK is a Microsoft project for cloud-based client-server
> communication in native code using a modern asynchronous C++ API design.
> This project aims to help C++ developers connect to and interact with
> services.
> 
> This package is licensed under the MIT package and depends on BOOST
> and OpenSSL/LibreSSL.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
[snip]
> diff --git a/package/libcpprestsdk/0001-remove-cast-align-error-flag.patch b/package/libcpprestsdk/0001-remove-cast-align-error-flag.patch
> new file mode 100644
> index 0000000000..a8cfa2b093
> --- /dev/null
> +++ b/package/libcpprestsdk/0001-remove-cast-align-error-flag.patch
> @@ -0,0 +1,29 @@
> +From 2b1b376b6daa96e663f30032e3ac047c9f0668d7 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 23 Oct 2017 07:47:42 -0400
> +Subject: [PATCH 1/1] remove cast-align error flag
> +
> +When cross compiling, frame.hpp and md5.hpp both have casts that will throw
> +a cast-align warning, by default this will throw an error.

 So I trust you have verified that those casts can never lead to unaligned
accesses on architectures that don't support unaligned access? Note BTW that
this has nothing to do with cross-compilation, only with the target architecture.

 Anyway, it's better to disable the -Werror by giving cmake -DWERROR=OFF.

[snip]
> diff --git a/package/libcpprestsdk/0002-fix-xlocale-header-check.patch b/package/libcpprestsdk/0002-fix-xlocale-header-check.patch
> new file mode 100644
> index 0000000000..9c95fdf36c
> --- /dev/null
> +++ b/package/libcpprestsdk/0002-fix-xlocale-header-check.patch
> @@ -0,0 +1,55 @@
> +From a826b7b656c165bc35746d9af3ec371387d2bca1 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 23 Oct 2017 08:11:21 -0400
> +Subject: [PATCH 2/2] fix xlocale header check
> +
> +asyncrt_utils.h checks if __GLIBC__ is not defined before including
> +xlocal.h.  This will cause a compilation failure on uclibc and musl.
> +
> +Add a proper check in CMakeLists.txt and check for HAVE_XLOCALE_H
> +instead of __GLIBC__

 Good patch!

> +
> +Upstream-Status: Pending

 And upstreamed as well, great!

> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
[snip]
> diff --git a/package/libcpprestsdk/0003-fix-compilation-issues-with-musl.patch b/package/libcpprestsdk/0003-fix-compilation-issues-with-musl.patch
> new file mode 100644
> index 0000000000..121c8e110a
> --- /dev/null
> +++ b/package/libcpprestsdk/0003-fix-compilation-issues-with-musl.patch
> @@ -0,0 +1,28 @@
> +From 25453f9c186cf441881b06bc5503d979acb0ab75 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 23 Oct 2017 09:38:11 -0400
> +Subject: [PATCH] fix compilation issues with musl
> +
> +sys/time.h needed for struct timeval

 Small nit: this is a better subject line. "Fix compilation issues with musl"
doesn't say much. So

Include sys/time.h for struct timeval

This is needed with musl.

> +
> +Upstream-Status: Pending
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + Release/include/cpprest/asyncrt_utils.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Release/include/cpprest/asyncrt_utils.h b/Release/include/cpprest/asyncrt_utils.h
> +index 8faa2dc..aab87a5 100644
> +--- a/Release/include/cpprest/asyncrt_utils.h
> ++++ b/Release/include/cpprest/asyncrt_utils.h
> +@@ -28,6 +28,7 @@
> + #endif
> + 
> + #ifndef _WIN32
> ++#include <sys/time.h>
> + #include <boost/algorithm/string.hpp>
> + #if !defined(ANDROID) && !defined(__ANDROID__) && defined(HAVE_XLOCALE_H) // CodePlex 269
> + /* Systems using glibc: xlocale.h has been removed from glibc 2.26
> +-- 
> +2.13.6
> +
> diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
> new file mode 100644
> index 0000000000..84fa783015
> --- /dev/null
> +++ b/package/libcpprestsdk/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_LIBCPPRESTSDK
> +	bool "libcpprestsdk"
> +	depends on BR2_INSTALL_LIBSTDCPP # boost

 Another small nit: it is this package itself that requires C++, so remove the
# boost

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +	depends on BR2_USE_WCHAR # boost
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_ATOMIC
> +	select BR2_PACKAGE_BOOST_CHRONO
> +	select BR2_PACKAGE_BOOST_DATE_TIME
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_RANDOM
> +	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_BOOST_THREAD
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  The C++ REST SDK is a Microsoft project for cloud-based
> +	  client-server communication in native code using a modern
> +	  asynchronous C++ API design. This project aims to help C++
> +	  developers connect to and interact with services.
> +
> +	  https://github.com/Microsoft/cpprestsdk
> +
> +comment "libcpprestsdk needs a toolchain w/ C++, wchar, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> +	|| !BR2_USE_WCHAR

 Indent this line one tab more.

> diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
> new file mode 100644
> index 0000000000..85f4c4fcc9
> --- /dev/null
> +++ b/package/libcpprestsdk/libcpprestsdk.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 de333da67f1cb3d1b30be118860531092467f18d24ca6b4d36f6623fecab0de0 libcpprestsdk-v2.10.0.tar.gz
> +sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt

 We have no rules for the spaces in the hash files, but this definitely looks weird.

> diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
> new file mode 100644
> index 0000000000..87727901e7
> --- /dev/null
> +++ b/package/libcpprestsdk/libcpprestsdk.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libcpprestsdk
> +#
> +################################################################################
> +
> +LIBCPPRESTSDK_VERSION = v2.10.0
> +LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
> +LIBCPPRESTSDK_DEPENDENCIES = boost
> +LIBCPPRESTSDK_LICENSE = MIT
> +LIBCPPRESTSDK_LICENSE_FILES = license.txt
> +LIBCPPRESTSDK_SUBDIR = Release
> +LIBCPPRESTSDK_DEPENDENCIES += openssl zlib

 Makes no sense to have two DEPENDENCIES lines here, collect them in a single line.


 Regards,
 Arnout

> +
> +$(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
