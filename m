From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 27 Jul 2015 19:36:55 +0200
Subject: [Buildroot] [PATCH v2] cmocka: new package
In-Reply-To: <1437886772-6787-1-git-send-email-nimaim@gmail.com>
References: <1437886772-6787-1-git-send-email-nimaim@gmail.com>
Message-ID: <55B66C37.9080103@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nimai,

Le 26/07/2015 06:59, Nimai Mahajan a ?crit :
> From: Nimai Mahajan <nimaim@gmail.com>
> 
> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> ---
> Changes v1->v2: Removed host-cmake dependency (Baruch)
> 
>  package/Config.in          |  1 +
>  package/cmocka/Config.in   | 11 +++++++++++
>  package/cmocka/cmocka.hash |  2 ++
>  package/cmocka/cmocka.mk   | 17 +++++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/cmocka/Config.in
>  create mode 100644 package/cmocka/cmocka.hash
>  create mode 100644 package/cmocka/cmocka.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f029e1d..e0dd14e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1037,6 +1037,7 @@ menu "Other"
>  	source "package/boost/Config.in"
>  	source "package/clapack/Config.in"
>  	source "package/classpath/Config.in"
> +	source "package/cmocka/Config.in"
>  	source "package/cppcms/Config.in"
>  	source "package/ding-libs/Config.in"
>  	source "package/eigen/Config.in"
> diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
> new file mode 100644
> index 0000000..37064bf
> --- /dev/null
> +++ b/package/cmocka/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_CMOCKA
> +	bool "cmocka"

cmocka only build a shared library libcmocka.so, so this package must not be
selected on static only build (it's hard coded in src/CMakeLists.txt):
	depends on !BR2_STATIC_LIBS

> +	help
> +	  cmocka is an elegant unit testing framework for C with support
> +	  for mock objects. It only requires the standard C library,
> +	  works on a range of computing platforms (including embedded)
> +	  and with different compilers. It is a fork of Google's very
> +	  popular cmockery unit testing framework to fix bugs and support 
> +	  it in the future.
> +
> +	  https://cmocka.org/

And add a comment here:
comment "cmocka needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

Also I tried to build with a uClibc-ng toolchain without stack protection
support (libssp) and cmocka fail to build. I haven't tested with a musl toolchain.

CMake Error at
/home/naourr/git/buildroot/test/uclibc-ng/host/usr/share/cmake-3.1/Modules/TestBigEndian.cmake:51
(message):
  no suitable type found
Call Stack (most recent call first):
  ConfigureChecks.cmake:142 (test_big_endian)
  CMakeLists.txt:43 (include)


-- Configuring incomplete, errors occurred!
See also
"/home/naourr/git/buildroot/test/uclibc-ng/build/cmocka-1.0.1/buildroot-build/CMakeFiles/CMakeOutput.log".
See also
"/home/naourr/git/buildroot/test/uclibc-ng/build/cmocka-1.0.1/buildroot-build/CMakeFiles/CMakeError.log".

Here the content of CMakeError.log (see -fstack-protector):

/home/naourr/git/buildroot/test/uclibc-ng/host/usr/bin/i686-buildroot-linux-uclibc-gcc
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-std=gnu99 -pedantic -pedantic-errors -Wall -Wextra -Wshadow
-Wmissing-prototypes -Wdeclaration-after-statement -Wunused -Wfloat-equal
-Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute
-Wundef -fPIC -fstack-protector -D_GNU_SOURCE
CMakeFiles/cmTryCompileExec2344790343.dir/CMAKE_SIZEOF_UNSIGNED_LONG.c.o  -o
cmTryCompileExec2344790343 -rdynamic -lrt
/home/naourr/git/buildroot/test/uclibc-ng/host/usr/lib/gcc/i686-buildroot-linux-uclibc/4.9.3/../../../../i686-buildroot-linux-uclibc/bin/ld:
ne peut trouver -lssp_nonshared
/home/naourr/git/buildroot/test/uclibc-ng/host/usr/lib/gcc/i686-buildroot-linux-uclibc/4.9.3/../../../../i686-buildroot-linux-uclibc/bin/ld:
ne peut trouver -lssp
collect2: erreur: ld a retourn? 1 code d'?tat d'ex?cution

-fstack-protector is added by cmake/Modules/DefineCompilerFlags.cmake:

        check_c_compiler_flag_ssp("-fstack-protector" WITH_STACK_PROTECTOR)
        if (WITH_STACK_PROTECTOR)
            set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector")
        endif (WITH_STACK_PROTECTOR)

For some reason, -fstack-protector is still added even when the ssp support is
disabled in the toolchain. It build fine when -fstack-protector is removed.

Thoughts ?

Best regards,
Romain Naour

> diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
> new file mode 100644
> index 0000000..96b81cb
> --- /dev/null
> +++ b/package/cmocka/cmocka.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 b36050d7a1224296803d216cba1a9d4c58c31bf308b2d6d6649d61aa5a36753b cmocka-1.0.1.tar.xz
> diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
> new file mode 100644
> index 0000000..812df76
> --- /dev/null
> +++ b/package/cmocka/cmocka.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# cmocka
> +#
> +################################################################################
> +
> +CMOCKA_VERSION = 1.0.1
> +CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
> +CMOCKA_SITE = https://cmocka.org/files/1.0/
> +CMOCKA_LICENSE = Apache-2.0
> +CMOCKA_LICENSE_FILES = COPYING
> +CMOCKA_INSTALL_STAGING = YES
> +
> +# cmocka only supports out of source builds
> +CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +$(eval $(cmake-package))
> 
