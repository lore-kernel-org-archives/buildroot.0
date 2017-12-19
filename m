From: Julien Floret <julien.floret@6wind.com>
Date: Tue, 19 Dec 2017 10:19:53 +0100
Subject: [Buildroot] [PATCH] lldpd: remove check on CXX compiler
In-Reply-To: <20171218211935.15149-1-damien.riegel@savoirfairelinux.com>
References: <20171218211935.15149-1-damien.riegel@savoirfairelinux.com>
Message-ID: <CAHfJR7ixxcsnHL4O_0nU22d3yXan5DBkyHMYHuSNLaprK689Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

2017-12-18 22:19 GMT+01:00 Damien Riegel <damien.riegel@savoirfairelinux.com>:
> lldpd currently depends on a C++ compiler to configure properly, but
> the package doesn't select that option, so builds fail if
> BR2_TOOLCHAIN_BUILDROOT_CXX is not selected with following errors:
>
>   checking how to run the C++ preprocessor... /lib/cpp
>   configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
>   configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>
> This package actually builds fine without C++, so drop this check in
> configure.ac. Attached patch has already been accepted upstream [1].
>
> [1] https://github.com/vincentbernat/lldpd/pull/261
>
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>

Reviewed-by: Julien Floret <julien.floret@6wind.com>

> ---
>  ...03-configure-remove-check-on-CXX-compiler.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
>
> diff --git a/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch b/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
> new file mode 100644
> index 0000000000..880f603f71
> --- /dev/null
> +++ b/package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch
> @@ -0,0 +1,35 @@
> +From d28b3bfa1b224f7770004dddf4dfaf10ad7ad6c9 Mon Sep 17 00:00:00 2001
> +From: Damien Riegel <damien.riegel@savoirfairelinux.com>
> +Date: Mon, 18 Dec 2017 14:37:08 -0500
> +Subject: [PATCH] configure: remove check on CXX compiler
> +
> +lldpd fails to build if the toolchain doesn't have a C++ compiler
> +because configure fails with the following error:
> +
> +  checking how to run the C++ preprocessor... /lib/cpp
> +  configure: error: in `/home/dkc/src/buildroot/build-zii/build/lldpd-0.9.4':
> +  configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> +
> +Since "8d92800b: build: cleaner way to not alter CFLAGS/CPPFLAGS/LDFLAGS",
> +it seems that the dependency on C++ is not required anymore, so there
> +is no reason to keep this restriction. Dropping AC_PROG_CXX allows to
> +build with a toolchain that doesn't have C++ just fine.
> +---
> + configure.ac | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0edceb1..5afe8f2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -48,7 +48,6 @@ AC_PROG_CC_C99
> + if test x"$ac_cv_prog_cc_c99" = x"no"; then
> +   AC_MSG_FAILURE([*** C99 support is mandatory])
> + fi
> +-AC_PROG_CXX
> + AM_PROG_CC_C_O
> + AC_PROG_LIBTOOL
> + AC_PROG_LN_S
> +--
> +2.15.1
> +
> --
> 2.15.1
>
