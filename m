From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 22 Sep 2019 14:39:39 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190911162030.19418-2-matthew.weber@rockwellcollins.com>
References: <20190911162030.19418-1-matthew.weber@rockwellcollins.com>
 <20190911162030.19418-2-matthew.weber@rockwellcollins.com>
Message-ID: <403002f1-90b2-7534-b34b-ebeae669fbc6@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 11/09/2019 ? 18:20, Matt Weber a ?crit?:
> * Switch to new site and add license file hash
> * Add new libsysfs dependency for rng available check
> * Remove patch adding special return code when no RNG module is available.
>   This has been replaced by using the jitter library to always have a
>   source (new jitterentropy dependency)
> * Change to a autotools build and add patch to allow README file to not be
>   found during autoreconfig

Indeed, rng-tools version is very old (from 2004).
I was testing with Clang but the actual version use a VLA:

rngd_linux.c:126:17: error: fields must have a constant size: 'variable length
array in structure' extension will never be supported
                unsigned char data[size];
                              ^
Hopefully this version bump fix this issue.

[Runtime tested using Clang as cross-compiler and busybox init system]
Tested-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v2 -> v3
> [Thomas P
>  - Add patch to set AM_INIT_AUTOMAKE to foreign to prevent missing
>    README file from breaking the reconfigure.  Thanks Fabrice for
>    already starting the upstream up this.
> 
> v1 -> v2
> [Thomas P
>  - Added host automake/autotools dependencies and checked for no
>    libtool dependency.
> 
> [Baruch
>  - Removed cut paste error in comment for autoreconf
> ---
>  .../0001-configure.ac-fix-autoreconf.patch    | 34 +++++++++++++++++++
>  package/rng-tools/0001-rngd-exit-code.patch   | 22 ------------
>  package/rng-tools/Config.in                   |  2 ++
>  package/rng-tools/rng-tools.hash              |  6 ++--
>  package/rng-tools/rng-tools.mk                | 12 +++++--
>  package/rng-tools/rngd.service                |  1 -
>  6 files changed, 49 insertions(+), 28 deletions(-)
>  create mode 100644 package/rng-tools/0001-configure.ac-fix-autoreconf.patch
>  delete mode 100644 package/rng-tools/0001-rngd-exit-code.patch
> 
> diff --git a/package/rng-tools/0001-configure.ac-fix-autoreconf.patch b/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
> new file mode 100644
> index 0000000000..567a7a2891
> --- /dev/null
> +++ b/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
> @@ -0,0 +1,34 @@
> +From 1af1b4aab717a58da1dff8888c36c741b0f6ac03 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 5 Apr 2019 19:22:22 +0200
> +Subject: [PATCH] configure.ac: fix autoreconf
> +
> +Use foreign instead of gnu in AM_INIT_AUTOMAKE otherwise autoreconf will
> +fail on:
> +Makefile.am: error: required file './README' not found
> +
> +Upstream:
> +https://github.com/nhorman/rng-tools/commit/1af1b4aab717a58da1dff8888c36c741b0f6ac03
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d00a6f1..26b4806 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -21,7 +21,7 @@ AC_INIT(rng-tools, 6.7, [Neil Horman <nhorman@tuxdriver.com>])
> + AC_PREREQ(2.52)
> + AC_CONFIG_SRCDIR([rngd.c])
> + AC_CANONICAL_TARGET
> +-AM_INIT_AUTOMAKE([gnu])
> ++AM_INIT_AUTOMAKE([foreign])
> + AC_CONFIG_HEADERS([rng-tools-config.h])
> + AC_CONFIG_MACRO_DIRS([m4])
> + 
> +-- 
> +2.17.1
> +
> diff --git a/package/rng-tools/0001-rngd-exit-code.patch b/package/rng-tools/0001-rngd-exit-code.patch
> deleted file mode 100644
> index 709e20c70d..0000000000
> --- a/package/rng-tools/0001-rngd-exit-code.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Exit with a special value when RNG modules are not available
> -
> -Instead of returning with an error, exit with a special value when the
> -RNG kernel modules are not present in the kernel. This is not really a
> -hard failure.
> -
> -Patch borrowed from Fedora, at
> -http://pkgs.fedoraproject.org/cgit/rng-tools.git/tree/rngd-exit-code.patch.
> -
> -Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> -
> ---- a/rngd.c
> -+++ b/rngd.c
> -@@ -319,7 +319,7 @@ int main(int argc, char **argv)
> - 			message(LOG_DAEMON|LOG_ERR,
> - 				"Maybe RNG device modules are not loaded\n");
> - 		}
> --		return 1;
> -+		return 66;
> - 	}
> - 
> - 	if (arguments->verbose) {
> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index b00477d336..18521bdd90 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_RNG_TOOLS
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	# For rdrand ligcrypt is required and it's not obvious to users
>  	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_LIBSYSFS
> +	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
>  	help
>  	  Daemon to use hardware random number generators.
>  
> diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
> index 09769e4622..a0771034fe 100644
> --- a/package/rng-tools/rng-tools.hash
> +++ b/package/rng-tools/rng-tools.hash
> @@ -1,3 +1,3 @@
> -# From http://sourceforge.net/projects/gkernel/files/rng-tools/5/
> -md5	6726cdc6fae1f5122463f24ae980dd68	rng-tools-5.tar.gz
> -sha1	3092768ac45315a5dcc0170d05566d1d00dbad96	rng-tools-5.tar.gz
> +# Locally computed
> +sha256	b85e3530dbf943b6da03ebecaf64d0a4febfcc4f562fc7f8d886483906b15f08  rng-tools-6.7.tar.gz
> +sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index bbb1a64c15..1e8092be38 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -4,10 +4,18 @@
>  #
>  ################################################################################
>  
> -RNG_TOOLS_VERSION = 5
> -RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
> +RNG_TOOLS_VERSION = 6.7
> +RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>  RNG_TOOLS_LICENSE = GPL-2.0
>  RNG_TOOLS_LICENSE_FILES = COPYING
> +RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-automake \
> +			host-autoconf
> +
> +RNG_TOOLS_AUTORECONF = YES
> +
> +RNG_TOOLS_CONF_OPTS = \
> +	--without-nistbeacon \
> +	--without-pkcs11
>  
>  # Work around for uClibc or musl toolchains which lack argp_*()
>  # functions.
> diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
> index c0bcffe59e..11386d1e5d 100644
> --- a/package/rng-tools/rngd.service
> +++ b/package/rng-tools/rngd.service
> @@ -3,7 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
>  
>  [Service]
>  ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
> -SuccessExitStatus=66
>  EnvironmentFile=-/etc/default/rngd
>  
>  [Install]
> 
