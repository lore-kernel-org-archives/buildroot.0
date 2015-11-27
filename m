From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Nov 2015 22:39:57 +0100
Subject: [Buildroot] [PATCH 2/2] unzip: new package
In-Reply-To: <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
 <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <5658CDAD.20304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-11-15 18:38, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Jan Pedersen <jp@jp-embedded.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/Config.in                                  |  1 +
>  ...a-CMakeFile.txt-to-ease-cross-compilation.patch | 53 ++++++++++++++++++++++
>  package/unzip/Config.in                            | 11 +++++
>  package/unzip/unzip.hash                           |  2 +
>  package/unzip/unzip.mk                             | 13 ++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
>  create mode 100644 package/unzip/Config.in
>  create mode 100644 package/unzip/unzip.hash
>  create mode 100644 package/unzip/unzip.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9e3494a..311d744 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -54,6 +54,7 @@ endif
>  	source "package/lz4/Config.in"
>  	source "package/lzip/Config.in"
>  	source "package/lzop/Config.in"
> +	source "package/unzip/Config.in"
>  	source "package/xz/Config.in"
>  	source "package/zip/Config.in"
>  endmenu
> diff --git a/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
> new file mode 100644
> index 0000000..cbc58e4
> --- /dev/null
> +++ b/package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
> @@ -0,0 +1,53 @@
> +From 992a497e9c5c421d3931e02a01e9d7c159f27135 Mon Sep 17 00:00:00 2001
> +From: Luca Ceresoli <luca@lucaceresoli.net>
> +Date: Thu, 26 Nov 2015 12:49:10 +0100
> +Subject: [PATCH] Add a CMakeFile.txt to ease cross-compilation
> +
> +Info-ZIP's UnZip 6.0 has a complex, hand-crafted Makefile with a
> +companion configure script which try to support an extremely wide
> +range of UNIX-like operating systems. The result is an overly complex
> +mass of code that does not support cross-compilation in several ways.
> +
> +Zip 3.0 has a similar build system, and has as many as 6 patches in
> +Buildroot to cross-compile [0]. UnZip fails at building even with
> +these patches adapted and a few more on top of them.
> +
> +Instead of tweaking and fixing a huge and complex build system, skip
> +it entirely and add a pretty simple CMakeLists.txt that cross-compiles
> +smoothly using CMake. It also preserves all of the Buildroot-provided
> +build options and flags as the original Makefile does.

 Great idea!

> +
> +[0] http://git.buildroot.net/buildroot/tree/package/infozip?id=2015.11-rc3
> +
> +Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> +---
> + CMakeLists.txt | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> + create mode 100644 CMakeLists.txt
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +new file mode 100644
> +index 0000000..27951b4
> +--- /dev/null
> ++++ b/CMakeLists.txt
> +@@ -0,0 +1,17 @@
> ++cmake_minimum_required(VERSION 2.8)
> ++INCLUDE(CheckFunctionExists)
> ++
> ++project(unzip C)
> ++
> ++CHECK_FUNCTION_EXISTS(lchmod HAVE_LCHMOD)
> ++if(NOT HAVE_LCHMOD)
> ++add_definitions("-DNO_LCHMOD")
> ++endif()
> ++
> ++set(UNZIP_SOURCES unzip.c crc32.c crypt.c envargs.c explode.c
> ++  extract.c fileio.c globals.c inflate.c list.c match.c process.c
> ++  ttyio.c ubz2err.c unreduce.c unshrink.c zipinfo.c unix/unix.c)

 To be upstreamable this should of course be made more generic to non-unix
systems, but since upstream is quite dead...


 Regards,
 Arnout

> ++
> ++include_directories(.)
> ++add_executable(unzip ${UNZIP_SOURCES})
> ++install(TARGETS unzip DESTINATION bin)
> +-- 
> +1.9.1
> +
> diff --git a/package/unzip/Config.in b/package/unzip/Config.in
> new file mode 100644
> index 0000000..0d98d28
> --- /dev/null
> +++ b/package/unzip/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_UNZIP
> +	bool "unzip"
> +	help
> +	  UnZip is an extraction utility for archives compressed in
> +	  .zip format (also called "zipfiles"). Although highly
> +	  compatible both with PKWARE's PKZIP and PKUNZIP utilities
> +	  for MS-DOS and with Info-ZIP's own Zip program, our primary
> +	  objectives have been portability and non-MSDOS
> +	  functionality.
> +
> +	  http://www.info-zip.org/UnZip.html
> diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
> new file mode 100644
> index 0000000..a138cc2
> --- /dev/null
> +++ b/package/unzip/unzip.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> new file mode 100644
> index 0000000..cff5951
> --- /dev/null
> +++ b/package/unzip/unzip.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# unzip
> +#
> +################################################################################
> +
> +UNZIP_VERSION = 60
> +UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
> +UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
> +UNZIP_LICENSE = Info-ZIP
> +UNZIP_LICENSE_FILES = LICENSE
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
