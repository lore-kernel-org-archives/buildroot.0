From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 9 Jan 2020 22:44:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/zxing-cpp: drop
 ZXING_CPP_MAKE_OPTS workaround
In-Reply-To: <20200109192049.3718440-1-fontaine.fabrice@gmail.com>
References: <20200109192049.3718440-1-fontaine.fabrice@gmail.com>
Message-ID: <20200109224444.1b71dc62@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu,  9 Jan 2020 20:20:48 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Bumping to version 0db7f85 in commit

Should be 'e0e40dd' instead of '0db7f85' (my mistake, I messed it up in the
original patch)...

> ad9c5bbfa7ee355b9f6120358cde08ae866537ac included the following upstream
> commit:
> https://github.com/glassechidna/zxing-cpp/commit/4e2b4fe1668c60d73e7649b0d3d5888912878392

Did not catch this one..., nice!

>
> This commit contains CMake improvements and especially a new
> BUILD_TESTING option that is off by default and disable the cppunit
> dependency that needs C++11 so drop ZXING_CPP_MAKE_OPTS workaround

The C++11 part is no longer valid after the version bump as it contains
the commit [1] enforcing -std=c++11 for the whole compile...

	...BUILD_TESTING option to disable the testrunner compile, use this
	instead of the ZXING_CPP_MAKE_OPTS workaround.

And commit title:

	replace ZXING_CPP_MAKE_OPTS workaround

With the commit messages fixes you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

[1] https://github.com/glassechidna/zxing-cpp/commit/14d0a7196993868e5fb5ef18afd03a2bf2ca8014

>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zxing-cpp/zxing-cpp.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index 1efd986c7d..6b26c20e00 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -10,12 +10,10 @@ ZXING_CPP_LICENSE = Apache-2.0
>  ZXING_CPP_LICENSE_FILES = COPYING
>  ZXING_CPP_INSTALL_STAGING = YES
>  ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
> +ZXING_CPP_CONF_OPTS = -DBUILD_TESTING=OFF
>
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  ZXING_CPP_DEPENDENCIES += libiconv
>  endif
>
> -# build all targets except testrunner (needs c++11 support)
> -ZXING_CPP_MAKE_OPTS = libzxing zxing
> -
>  $(eval $(cmake-package))
