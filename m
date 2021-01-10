From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 11:49:40 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/casync: new package
In-Reply-To: <NVlFsf4p-hDevSUmmsdNYsR87odtk0RPLWz3hIPYRvNNUDNNk6HX_FZ-LZly9XR9YK8s1UzTbGar5YW8gpp7kYG2kQ5KQAfcTOMjjujib_o=@protonmail.com>
References: <NVlFsf4p-hDevSUmmsdNYsR87odtk0RPLWz3hIPYRvNNUDNNk6HX_FZ-LZly9XR9YK8s1UzTbGar5YW8gpp7kYG2kQ5KQAfcTOMjjujib_o=@protonmail.com>
Message-ID: <20210110104940.GM3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yair, All,

On 2021-01-10 08:35 +0000, Yair Ben-Avraham via buildroot spake thusly:
> Content-Addressable Data Synchronization Tool
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

Applied to master, with the following changes:

  - correctly fix build without lzma in an upstreamable fashion
  - actually fix the build without udev
  - depend on udev, not libudev (which does not exist)
  - don't use += for the first variable assignment to _CONF_OPTS
  - explicitly disable unsupported fuzz options
  - add explicit optiopnal support for bash-completion
  - drop useless comments about "features" and "booleans"
  - fix alphabetical order in DEVELOPERS

Please do not forget to push the two pathes upstream, so we can
eventually drop them when we later bump the version.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-Insert-lzma-into-if-directive.patch  | 30 ++++++++++
>  package/casync/Config.in                      | 13 ++++
>  package/casync/casync.hash                    |  3 +
>  package/casync/casync.mk                      | 60 +++++++++++++++++++
>  6 files changed, 108 insertions(+)
>  create mode 100644 package/casync/0001-Insert-lzma-into-if-directive.patch
>  create mode 100644 package/casync/Config.in
>  create mode 100644 package/casync/casync.hash
>  create mode 100644 package/casync/casync.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ee175b7586..91d3756557 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2716,6 +2716,7 @@ F:	package/fwup/
> 
>  N:	Yair Ben Avraham <yairba@protonmail.com>
>  F:	package/gloox/
> +F:	package/casync/
> 
>  N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
>  F:	package/open62541/
> diff --git a/package/Config.in b/package/Config.in
> index f497fbffde..c24969f723 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2072,6 +2072,7 @@ menu "Networking applications"
>  	source "package/c-icap-modules/Config.in"
>  	source "package/can-utils/Config.in"
>  	source "package/cannelloni/Config.in"
> +	source "package/casync/Config.in"
>  	source "package/chrony/Config.in"
>  	source "package/civetweb/Config.in"
>  	source "package/connman/Config.in"
> diff --git a/package/casync/0001-Insert-lzma-into-if-directive.patch b/package/casync/0001-Insert-lzma-into-if-directive.patch
> new file mode 100644
> index 0000000000..552294391b
> --- /dev/null
> +++ b/package/casync/0001-Insert-lzma-into-if-directive.patch
> @@ -0,0 +1,30 @@
> +From d72e66f87f31f288f5445c3540520a8c82f6ff89 Mon Sep 17 00:00:00 2001
> +From: Yair Ben-Avraham <yairba@protonmail.com>
> +Date: Sun, 10 Jan 2021 06:34:58 +0100
> +Subject: [PATCH] Insert lzma into if directive
> +
> +lzma is a feature option in meson_options.txt
> +
> +Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> +---
> + src/castore.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/castore.c b/src/castore.c
> +index c290dfd..73cbf8d 100644
> +--- a/src/castore.c
> ++++ b/src/castore.c
> +@@ -2,7 +2,9 @@
> +
> + #include <dirent.h>
> + #include <fcntl.h>
> +-#include <lzma.h>
> ++#if HAVE_LIBLZMA
> ++#  include <lzma.h>
> ++#endif
> + #include <sys/stat.h>
> + #include <unistd.h>
> +
> +--
> +2.20.1
> +
> diff --git a/package/casync/Config.in b/package/casync/Config.in
> new file mode 100644
> index 0000000000..89a9520e35
> --- /dev/null
> +++ b/package/casync/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_CASYNC
> +	bool "casync"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # scandirat() is not implemented by musl and uclibc-ng
> +	select BR2_PACKAGE_ACL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  Content-Addressable Data Synchronization Tool
> +
> +	  https://github.com/systemd/casync
> +
> +comment "casync needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/casync/casync.hash b/package/casync/casync.hash
> new file mode 100644
> index 0000000000..dbb85520de
> --- /dev/null
> +++ b/package/casync/casync.hash
> @@ -0,0 +1,3 @@
> +# sha256 locally computed
> +sha256  d07f43e70e3c466152033da4c55c065f815d3025234a046c2bce1cfe4ac7d273  casync-4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/casync/casync.mk b/package/casync/casync.mk
> new file mode 100644
> index 0000000000..cc00a5e885
> --- /dev/null
> +++ b/package/casync/casync.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# casync
> +#
> +################################################################################
> +
> +CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
> +CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
> +CASYNC_LICENSE = LGPL-2.1+
> +CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
> +CASYNC_DEPENDENCIES = acl libcurl openssl
> +CASYNC_CONF_OPTS += -Dman=false
> +
> +# meson booleans
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +CASYNC_DEPENDENCIES += libfuse
> +CASYNC_CONF_OPTS += -Dfuse=true
> +else
> +CASYNC_CONF_OPTS += -Dfuse=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +CASYNC_DEPENDENCIES += libselinux
> +CASYNC_CONF_OPTS += -Dselinux=true
> +else
> +CASYNC_CONF_OPTS += -Dselinux=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +CASYNC_DEPENDENCIES += libudev
> +CASYNC_CONF_OPTS += -Dudev=true
> +else
> +CASYNC_CONF_OPTS += -Dudev=false
> +# Due to a bug in ./meson.build, 'udevrulesdir' must not be empty
> +CASYNC_CONF_OPTS += -Dudevrulesdir=this_is_a_bug
> +endif
> +
> +# meson features
> +ifeq ($(BR2_PACKAGE_LIBZSTD),y)
> +CASYNC_DEPENDENCIES += libzstd
> +CASYNC_CONF_OPTS += -Dlibzstd=enabled
> +else
> +CASYNC_CONF_OPTS += -Dlibzstd=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +CASYNC_DEPENDENCIES += xz
> +CASYNC_CONF_OPTS += -Dliblzma=enabled
> +else
> +CASYNC_CONF_OPTS += -Dliblzma=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +CASYNC_DEPENDENCIES += zlib
> +CASYNC_CONF_OPTS += -Dlibz=enabled
> +else
> +CASYNC_CONF_OPTS += -Dlibz=disabled
> +endif
> +
> +$(eval $(meson-package))
> --
> 2.20.1
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
