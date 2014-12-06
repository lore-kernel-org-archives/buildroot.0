From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 06 Dec 2014 18:08:00 +0100
Subject: [Buildroot] [PATCHv2 12/12] Add option for paranoid unsafe path
 checking
In-Reply-To: <1417470913-1280-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <548337F0.5090300@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
> This commit adds a Config.in option to the "Build options" submenu to
> enable paranoid checking of unsafe paths. This mechanism is added as
> an option so that when we'll enable it in the autobuilders, people
> trying to reproduce the build failures will be able to do so by just
> downloading the configuration file. If instead we were leaving this
> feature as an environment variable, everyone would have to remember to
> pass this environment variable to reproduce build issues. And certain
> build issues triggered by paranoid unsafe patch checking may not be
> visible in the build output, for example when they happen during the
> execution of configure scripts.
> 
> Since this option is fairly advanced, a new submenu inside "Build
> options" is created, for Advanced options.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Config.in           | 20 ++++++++++++++++++++
>  package/Makefile.in |  4 ++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 1aa1080..3374e0f 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -569,6 +569,26 @@ config BR2_GLOBAL_PATCH_DIR
>  	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
>  	  then all *.patch files in the directory will be applied.
>  
> +menu "Advanced"
> +
> +config BR2_COMPILER_PARANOID_UNSAFE_PATH
> +	bool "paranoid check of library/header paths"
> +	help
> +	  By default, when this option is disabled, when the Buildroot
> +	  cross-compiler will encounter an unsafe library or header
> +	  path (such as /usr/include, or /usr/lib), the compiler will
> +	  display a warning.
> +
> +	  By enabling this option, this warning is turned into an
> +	  error, which will completely abort the build when such
> +	  unsafe paths are encountered.
> +
> +	  Note that this mechanism is available for both the internal
> +	  toolchain (through gcc and binutils patches) and external
> +	  toolchain backends (through the external toolchain wrapper).
> +
> +endmenu
> +
>  endmenu
>  
>  source "toolchain/Config.in"
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 36ecf0b..f60b08d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -398,6 +398,10 @@ else
>  SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
>  endif
>  
> +ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
> +export BR_COMPILER_PARANOID_UNSAFE_PATH=enabled
> +endif
> +
>  include package/pkg-download.mk
>  include package/pkg-autotools.mk
>  include package/pkg-cmake.mk
> 

Sorry, I haven't yet tested the others patches with an internal
toolchain.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>

Tested with an external x86 toolchain with iprutils package selected.

$ make O=test/paranoid  iprutils-rebuild

The build stop if BR2_COMPILER_PARANOID_UNSAFE_PATH has been selected
in the Buildroot configuration. Otherwise the build continue with the
following warning:

/home/naourr/git/buildroot/test/paranoid/host/usr/bin/i686-pc-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-Wall -DIPR_MAJOR_RELEASE=2 -DIPR_MINOR_RELEASE=4 -DIPR_FIX_LEVEL=2
-DIPR_FIX_DATE='"(June 10, 2014)"' -DIPR_VERSION_STR='"2.4.2 (June 10, 2014)"'
-DIPR_RELEASE=1 -I. -I/usr/include/ncurses -o iprlib.o -c iprlib.c
i686-pc-linux-gnu-gcc: WARNING: unsafe header/library path used in
cross-compilation: '/usr/include/ncurses'

Thanks,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
