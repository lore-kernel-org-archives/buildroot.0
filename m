From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 28 Aug 2012 16:25:37 +0200
Subject: [Buildroot] [PATCH] mtdev2tuio: new package
In-Reply-To: <503CD20D.7060703@relinux.de>
References: <503CD20D.7060703@relinux.de>
Message-ID: <503CD4E1.7020707@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

please discard this because I forgot the license info

Stephan

Am 28.08.2012 16:13, schrieb Stephan Hoffmann:
> mtdev2tuio is a simple application for converting touch events
> to the standard TUIO 1.1 protocol.
>
> https://github.com/olivopaolo/mtdev2tuio
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  package/Config.in                                  |    2 +
>  package/mtdev2tuio/Config.in                       |    8 ++++++
>  ...ev2tuio-Use-gcc-instead-of-ld-for-linking.patch |   26
> ++++++++++++++++++++
>  package/mtdev2tuio/mtdev2tuio.mk                   |   22 ++++++++++++++++
>  4 files changed, 58 insertions(+), 0 deletions(-)
>  create mode 100644 package/mtdev2tuio/Config.in
>  create mode 100644
> package/mtdev2tuio/mtdev2tuio-Use-gcc-instead-of-ld-for-linking.patch
>  create mode 100644 package/mtdev2tuio/mtdev2tuio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f308de7..67498f8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -291,6 +291,7 @@ source "package/libcdaudio/Config.in"
>  source "package/libcue/Config.in"
>  source "package/libcuefile/Config.in"
>  source "package/libid3tag/Config.in"
> +source "package/liblo/Config.in"
>  source "package/libmad/Config.in"
>  source "package/libmpd/Config.in"
>  source "package/libreplaygain/Config.in"
> @@ -461,6 +462,7 @@ source "package/libsigc/Config.in"
>  source "package/libtpl/Config.in"
>  source "package/liburcu/Config.in"
>  source "package/lttng-libust/Config.in"
> +source "package/mtdev2tuio/Config.in"
>  source "package/orc/Config.in"
>  source "package/poco/Config.in"
>  source "package/protobuf/Config.in"
> diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
> new file mode 100644
> index 0000000..ab50c7b
> --- /dev/null
> +++ b/package/mtdev2tuio/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MTDEV2TUIO
> +	bool "mtdev2tuio"
> +	help
> +	  mtdev2tuio is a simple application for converting touch
> +	  events captured from libmtdev to TUIO 1.1
> +
> +	  https://github.com/olivopaolo/mtdev2tuio
> +
> diff --git
> a/package/mtdev2tuio/mtdev2tuio-Use-gcc-instead-of-ld-for-linking.patch
> b/package/mtdev2tuio/mtdev2tuio-Use-gcc-instead-of-ld-for-linking.patch
> new file mode 100644
> index 0000000..cb7e16d
> --- /dev/null
> +++ b/package/mtdev2tuio/mtdev2tuio-Use-gcc-instead-of-ld-for-linking.patch
> @@ -0,0 +1,26 @@
> +From 3594a424f9610f982cd98b56fffb3ba3f597bd6a Mon Sep 17 00:00:00 2001
> +From: Stephan Hoffmann <sho@relinux.de>
> +Date: Tue, 28 Aug 2012 11:53:14 +0200
> +Subject: [PATCH] Use gcc instead of ld for linking
> +
> +Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> +---
> + Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8ed320a..788d6ed 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -26,7 +26,7 @@ OBJS=${SRCS:.c=.o}
> + + # Link rule
> + $(TARGET): $(OBJS)
> +-	$(LD) $(LDFLAGS) $(OBJS) -o $@ $(LIBDIRS) $(LIBS)
> ++	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(LIBDIRS) $(LIBS)
> + + # Compilation rule
> + %.o:%.c
> +-- +1.7.0.4
> +
> diff --git a/package/mtdev2tuio/mtdev2tuio.mk
> b/package/mtdev2tuio/mtdev2tuio.mk
> new file mode 100644
> index 0000000..2636525
> --- /dev/null
> +++ b/package/mtdev2tuio/mtdev2tuio.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# mtdev2tuio
> +#
> +#############################################################
> +MTDEV2TUIO_VERSION = e1e7378d86
> +MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
> +# MTDEV2TUIO_AUTORECONF = YES
> +# MTDEV2TUIO_INSTALL_STAGING = YES
> +# MTDEV2TUIO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
> LDFLAGS=-L$(STAGING_DIR)/usr/lib install
> +MTDEV2TUIO_DEPENDENCIES = mtdev
> +
> +define MTDEV2TUIO_BUILD_CMDS
> +$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) clean
> +$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) +endef
> +
> +define MTDEV2TUIO_INSTALL_TARGET_CMDS
> +$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
