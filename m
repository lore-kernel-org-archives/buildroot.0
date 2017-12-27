From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 22:12:44 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: add new package
In-Reply-To: <1514406889-8233-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1514406889-8233-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20171227221244.20b92ffd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 21:34:49 +0100, Kurt Van Dijck wrote:
> nilfs-utils provide the user-space utilities for the nilfs2 filesystem.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Thanks for this contribution! It looks generally good, but there are a
few things that need to be improved. See below.

> ---
>  package/Config.in                               |  1 +
>  package/nilfs-utils/0001-max-input.patch        | 14 +++++++++++++
>  package/nilfs-utils/0002-dynamic-cleanerd.patch | 11 +++++++++++
>  package/nilfs-utils/0003-drop-rpc-types-h.patch | 12 ++++++++++++
>  package/nilfs-utils/Config.in                   | 10 ++++++++++
>  package/nilfs-utils/nilfs-utils.hash            |  2 ++
>  package/nilfs-utils/nilfs-utils.mk              | 26 +++++++++++++++++++++++++
>  7 files changed, 76 insertions(+)

Could you please update the DEVELOPERS file to include yourself as a
developer for this package? This will make sure you get notified when
there are build failures caused by this package, or when other people
send patches touching this package.

> diff --git a/package/nilfs-utils/0001-max-input.patch b/package/nilfs-utils/0001-max-input.patch
> new file mode 100644
> index 0000000..b1542f0
> --- /dev/null
> +++ b/package/nilfs-utils/0001-max-input.patch

All patches need a description and a Signed-off-by line. Also, since
nilfs-utils is maintained using Git, please use Git formatted patches
(i.e generated with git format-patch -N).

> @@ -0,0 +1,14 @@
> +--- a/bin/rmcp.c	2017-12-20 00:49:40.560348415 +0100
> ++++ b/bin/rmcp.c	2017-12-20 00:50:01.780241186 +0100
> +@@ -47,6 +47,11 @@
> + #include <limits.h>
> + #endif	/* HAVE_LIMITS_H */
> + 
> ++/* define MAX_INPUT for libmusl */

Just "musl" instead of "libmusl".


> diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
> new file mode 100644
> index 0000000..abd4a75
> --- /dev/null
> +++ b/package/nilfs-utils/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NILFS_UTILS
> +	bool "nilfs-utils"
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT

You need to replicate the dependencies of those options, i.e:

	depends on BR2_USE_MMU # util-linux libmount, libblkid

> diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
> new file mode 100644
> index 0000000..e772025
> --- /dev/null
> +++ b/package/nilfs-utils/nilfs-utils.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha1	99504805c6f9363fb6b775bea14c5cadfab97898  nilfs-utils-v2.2.7.tar.gz

It would be nice to use a sha256 hash instead, and to add a hash for the license file.

> diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
> new file mode 100644
> index 0000000..99fa22c
> --- /dev/null
> +++ b/package/nilfs-utils/nilfs-utils.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# nilfs-utils
> +#
> +################################################################################
> +
> +NILFS_UTILS_VERSION = v2.2.7
> +NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,$(NILFS_UTILS_VERSION))
> +NILFS_UTILS_LICENSE = LGPL-2.1
> +NILFS_UTILS_LICENSE_FILES = COPYING
> +
> +# need libuuid, libblkid, libmount
> +NILFS_UTILS_DEPENDENCIES += util-linux

Just = here would be sufficient, since it's unconditional.

> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +NILFS_UTILS_CONF_OPTS += --with-selinux
> +NILFS_UTILS_DEPENDENCIES += libselinux
> +else
> +NILFS_UTILS_CONF_OPTS += --without-selinux
> +endif
> +
> +NILFS_UTILS_CONF_OPTS += --disable-static

Why do you need this ?

> +NILFS_UTILS_AUTORECONF=YES

Please put this earlier, i.e after the LICENSE/LICENSE_FILES variables,
and don't forget the spaces before and after the = sign.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Why do you have a host variant of the package ? It isn't referenced
anywhere. If you need it to generate a NILFS filesystem image, then we
should add it to package/Config.in.host.

Last but not least, did you test your package with utils/test-pkg ? It
would be nice to do so.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
