From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 11:26:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/casync: new package
In-Reply-To: <onIw25oyihuYWcFwG2rTgzAbEF414WTH7efI53xEOXW2moxamXDh7mG1rqvPJT_5HOZ4Z52JarqzkoUbzYBk6z_8Z7UWehjNqnmXtRo45oI=@protonmail.com>
References: <onIw25oyihuYWcFwG2rTgzAbEF414WTH7efI53xEOXW2moxamXDh7mG1rqvPJT_5HOZ4Z52JarqzkoUbzYBk6z_8Z7UWehjNqnmXtRo45oI=@protonmail.com>
Message-ID: <20210102112643.3eef2517@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yair,

Thanks for this contribution! There's however a number of things to be
changed. See below.

On Sun, 06 Dec 2020 14:50:01 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> Content-Addressable Data Synchronization Tool
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  package/Config.in          |  1 +
>  package/casync/Config.in   | 16 ++++++++++++++++
>  package/casync/casync.hash |  3 +++
>  package/casync/casync.mk   | 28 ++++++++++++++++++++++++++++
>  4 files changed, 48 insertions(+)

Could you add an entry to the DEVELOPERS file ?


> diff --git a/package/casync/Config.in b/package/casync/Config.in
> new file mode 100644
> index 0000000000..2b00c849a3
> --- /dev/null
> +++ b/package/casync/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CASYNC
> +	bool "casync"
> +	depends on BR2_PACKAGE_EUDEV

You should not use BR2_PACKAGE_EUDEV, but BR2_PACKAGE_HAS_UDEV, so that
either eudev or systemd can be used as a udev provider. However, udev
is not a mandatory dependency, so in fact this dependency is not needed.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Please document why this is needed in a comment. If I get it correctly,
it's because casync uses scandirat(), which is not implemented by
current versions of musl and uclibc-ng.

> +	select BR2_PACKAGE_ACL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_XZ

This dependency is not mandatory.

> +	select BR2_PACKAGE_ZSTD

This dependency is not mandatory.

Also, there's an optional dependency on zlib.

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
> index 0000000000..c1f450423c
> --- /dev/null
> +++ b/package/casync/casync.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# casync
> +#
> +################################################################################
> +
> +CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
> +CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
> +CASYNC_LICENSE = LGPL-2.1

The license is LGPL-2.1+ according to the SPDX identifiers available in
the source code:

src/notify.c:/* SPDX-License-Identifier: LGPL-2.1+ */
src/cachunk.h:/* SPDX-License-Identifier: LGPL-2.1+ */
src/castore.h:/* SPDX-License-Identifier: LGPL-2.1+ */
...

> +CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
> +CASYNC_DEPENDENCIES += xz libcurl acl openssl zstd

+= not needed, just use = here. xz and zstd are not mandatory
dependencies. You also need to handle zlib as an optional dependency.
Hint: pass -Dliblzma=disabled -Dlibz=disabled -Dlibzstd=disabled.

Note that to handle udev as an optional dependency, there is a bug.
Even if you pass -Dudev=false it still tries to query pkg-config about
udev, due to a bug in meson.build. It would be good to fix the bug in
meson.build. I just worked around the problem by passing -Dudev=false
-Dudevrulesdir=blah.

> +CASYNC_CONF_OPTS += -Dman=False
> +
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +CASYNC_DEPENDENCIES += libfuse
> +CASYNC_CONF_OPTS += -Dfuse=True
> +else
> +CASYNC_CONF_OPTS += -Dfuse=False

I think everywhere else in meson packages we use lower-case "true" and
"false".

> +endif
> +
> +ifeq ($(BR2_PACKAGE_BR2_PACKAGE_LIBSELINUX),y)

Mistake here in the option name.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
