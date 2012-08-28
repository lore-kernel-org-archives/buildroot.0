From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 00:57:32 +0200
Subject: [Buildroot] [PATCH] mtdev2tuio: new package
In-Reply-To: <503CD43F.6060802@relinux.de>
References: <503CD43F.6060802@relinux.de>
Message-ID: <503D4CDC.2060806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/12 16:22, Stephan Hoffmann wrote:
> mtdev2tuio is a simple application for converting touch events
> to the standart TUIO 1.1 protocol.
>
> https://github.com/olivopaolo/mtdev2tuio
>
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
> ---
>   package/Config.in                                  |    2 +
>   package/mtdev2tuio/Config.in                       |    8 ++++++
>   ...ev2tuio-Use-gcc-instead-of-ld-for-linking.patch |   26
> ++++++++++++++++++++

  Thunderbird doesn't like to send patches - it wordwraps.  Use git send-email.

[snip]
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -291,6 +291,7 @@ source "package/libcdaudio/Config.in"
>  source "package/libcue/Config.in"
>  source "package/libcuefile/Config.in"
>  source "package/libid3tag/Config.in"
> +source "package/liblo/Config.in"

  This one doesn't belong here.

[snip]
> --- /dev/null
> +++ b/package/mtdev2tuio/mtdev2tuio-Use-gcc-instead-of-ld-for-linking.patch
> @@ -0,0 +1,26 @@
> +From 3594a424f9610f982cd98b56fffb3ba3f597bd6a Mon Sep 17 00:00:00 2001
> +From: Stephan Hoffmann<sho@relinux.de>
> +Date: Tue, 28 Aug 2012 11:53:14 +0200
> +Subject: [PATCH] Use gcc instead of ld for linking
> +
> +Signed-off-by: Stephan Hoffmann<sho@relinux.de>
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

  Alternative is to run make with LD=$(TARGET_CC) instead of $(TARGET_LD).
Happens in a couple of places.

> + + # Compilation rule
> + %.o:%.c
> +-- +1.7.0.4
> +
> diff --git a/package/mtdev2tuio/mtdev2tuio.mk
> b/package/mtdev2tuio/mtdev2tuio.mk
> new file mode 100644
> index 0000000..418f21c
> --- /dev/null
> +++ b/package/mtdev2tuio/mtdev2tuio.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# mtdev2tuio
> +#
> +#############################################################
> +MTDEV2TUIO_VERSION = e1e7378d86
> +MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
> +MTDEV2TUIO_DEPENDENCIES = mtdev
> +MTDEV2TUIO_LICENSE = GPLv3

  The only source file states GPLv3+

> +MTDEV2TUIO_LICENSE_FILES = COPYING
> +
> +define MTDEV2TUIO_BUILD_CMDS
> +$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) clean

  Is the clean really necessary?

> +$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) +endef
> +
> +define MTDEV2TUIO_INSTALL_TARGET_CMDS
> +$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
