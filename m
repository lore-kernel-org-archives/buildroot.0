From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 22:32:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 20.08.00
In-Reply-To: <20200907213246.771557-1-fontaine.fabrice@gmail.com>
References: <20200907213246.771557-1-fontaine.fabrice@gmail.com>
Message-ID: <20201006203246.GR11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-07 23:32 +0200, Fabrice Fontaine spake thusly:
> - Update patch
> - Update hash of license file (update in year, git.mk added, lintian
>   warning fixed):
>   - https://github.com/ColinIanKing/fwts/commit/2a75afca6f392491bbe8541398d409c459718388
>   - https://github.com/ColinIanKing/fwts/commit/429c2595847c673515967622787722a0341994bd
>   - https://github.com/ColinIanKing/fwts/commit/bc71a14a4a65a07585a8600c46c85a3a32b92e69
> - json-c has been dropped since version 20.08.00 and
>   https://github.com/ColinIanKing/fwts/commit/1a663dd3b37948b84452f5ab20f2ba8a86e3911f
> - Update indentation in hash file (two spaces)
> 
> This bump will also fix the following build failure with bison 3.7.1
> thanks to
> https://github.com/ColinIanKing/fwts/commit/cfd5f5870751a796462cdd2f7e41f5f0dabb67b8:
> 
> libtool: compile:  /home/peko/autobuild/instance-1/output-1/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_H -I. -I../.. -Wall -Wstrict-prototypes -fno-strict-aliasing -D_LINUX -DACPI_ASL_COMPILER -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -I../acpica/source/include -I../acpica/source/compiler -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c aslcompiler.c  -fPIC -DPIC -o .libs/libfwtsiasl_la-aslcompiler.o
> aslcompiler.tab.c:297:10: fatal error: aslcompiler.tab.h: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3eeb20a24595ab1b790bd770ba745676225ef8b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fwts/0001-build-do-not-use-Werror.patch | 8 ++++----
>  package/fwts/Config.in                          | 3 ---
>  package/fwts/fwts.hash                          | 4 ++--
>  package/fwts/fwts.mk                            | 4 ++--
>  4 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
> index c3ea2efc22..07f64b35b1 100644
> --- a/package/fwts/0001-build-do-not-use-Werror.patch
> +++ b/package/fwts/0001-build-do-not-use-Werror.patch
> @@ -10,7 +10,7 @@ newer versions that introduce new warnings.
>  Remove use of -Werror.
>  
>  Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> -[Fabrice: updated for 19.09.00]
> +[Fabrice: updated for 20.08.00]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   configure.ac              | 2 +-
> @@ -40,9 +40,9 @@ index 52c637dd..d9d73f1c 100644
>   	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
>  -	-Wall -Werror -Wextra				\
>  +	-Wall -Wextra					\
> - 	-Wno-address-of-packed-member
> - 
> - bin_PROGRAMS = fwts
> + 	-Wno-address-of-packed-member			\
> + 	-Wfloat-equal -Wmissing-declarations		\
> + 	-Wno-long-long -Wredundant-decls -Wshadow	\
>  diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
>  index 54de7f44..e129ed16 100644
>  --- a/src/lib/src/Makefile.am
> diff --git a/package/fwts/Config.in b/package/fwts/Config.in
> index 269f065fd5..ff28a4a403 100644
> --- a/package/fwts/Config.in
> +++ b/package/fwts/Config.in
> @@ -2,13 +2,11 @@ config BR2_PACKAGE_FWTS
>  	bool "fwts"
>  	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
>  	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>  	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_USE_WCHAR # libglib2, libbsd
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_JSON_C
>  	select BR2_PACKAGE_LIBBSD
>  	help
>  	  Firmware Test Suite (FWTS) is a test suite that performs
> @@ -36,7 +34,6 @@ endif
>  comment "fwts needs a glibc toolchain w/ wchar, threads"
>  	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
>  	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
> index 6338077732..9b05673152 100644
> --- a/package/fwts/fwts.hash
> +++ b/package/fwts/fwts.hash
> @@ -1,5 +1,5 @@
>  # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
> -sha256 91075982d067deef86d2830d622c27ed5f5c0b04dfd712902343a67fee753bfd fwts-V19.09.00.tar.gz
> +sha256  bfe7993f1dd328b96a90ecfe92df67063df21afe4b4a103e498da6625c7c71b7  fwts-V20.08.00.tar.gz
>  
>  # Hash for license file
> -sha256 9cfdcde669bcdbd2eb640dca6ed3f9b5ae381d100ac208f9dca6e12e61ad639c debian/copyright
> +sha256  379eab3c1071a6f5b8acd3632586577ec9c47ef10601b10467e890b8ff8b3842  debian/copyright
> diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
> index 853f27af49..e4e9defebf 100644
> --- a/package/fwts/fwts.mk
> +++ b/package/fwts/fwts.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -FWTS_VERSION = 19.09.00
> +FWTS_VERSION = 20.08.00
>  FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
>  FWTS_SITE = http://fwts.ubuntu.com/release
>  FWTS_STRIP_COMPONENTS = 0
>  FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
>  FWTS_LICENSE_FILES = debian/copyright
>  FWTS_AUTORECONF = YES
> -FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
> +FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
>  	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
>  	$(if $(BR2_PACKAGE_DTC),dtc)
>  
> -- 
> 2.28.0
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
