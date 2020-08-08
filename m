From: Christian Stewart <christian@paral.in>
Date: Sat, 8 Aug 2020 05:26:51 -0700
Subject: [Buildroot] [PATCH v1 4/6] package/libnvidia-container: new
 package
In-Reply-To: <CALFsTFXgQ_e+Gr7hjh9fvTJXWRQ5bGDxk_ZvF9qhVnrMmYuKBA@mail.gmail.com>
References: <20200801213658.33869-2-christian@paral.in>
 <20200801213658.33869-4-christian@paral.in>
 <CALFsTFXgQ_e+Gr7hjh9fvTJXWRQ5bGDxk_ZvF9qhVnrMmYuKBA@mail.gmail.com>
Message-ID: <CA+h8R2pTxZR33jpJqcpuEBFDxnqF1pYCP233i_Fa-m5rsXtZWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,


On Sat, Aug 8, 2020 at 1:01 AM Asaf Kahlon <asafka7@gmail.com> wrote:
> On Sun, Aug 2, 2020 at 12:37 AM Christian Stewart <christian@paral.in> wrote:
> >
> > The libnvidia-container package adds a library and CLI for GPU-backed
> > containers, agnostic to container runtime.
> >
> > https://github.com/NVIDIA/libnvidia-container
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---

[snip]

> > +
> > +diff --git a/src/nvc.c b/src/nvc.c
> > +index 35ad5be..f1d9b62 100644
> > +--- a/src/nvc.c
> > ++++ b/src/nvc.c
> > +@@ -14,8 +14,8 @@
> > + #include <stdlib.h>
> > + #include <unistd.h>
> > +
> > +-#include <pci-enum.h>
> > +-#include <nvidia-modprobe-utils.h>
> > ++#include "pci-enum.h"
> > ++#include "nvidia-modprobe-utils.h"
> > +
> > + #include "nvc_internal.h"
> > +
> > +diff --git a/src/nvidia-modprobe-utils.c b/src/nvidia-modprobe-utils.c
> > +new file mode 100644
> > +index 0000000..d3f3233
> > +--- /dev/null
> > ++++ b/src/nvidia-modprobe-utils.c
> > +@@ -0,0 +1,794 @@
> > ++
> > ++#if defined(NV_LINUX)
> > ++
> > ++#include <stdio.h>

[snip]

> > ++
> > ++    return err;
> > ++}
> > ++
> > ++#endif /* defined(NV_LINUX) */
> > +\ No newline at end of file
> > +diff --git a/src/pci-sysfs.h b/src/pci-sysfs.h
> > +new file mode 100644
> > +index 0000000..1fc695b
> > +--- /dev/null
> > ++++ b/src/pci-sysfs.h
> > +@@ -0,0 +1,85 @@

[snip]

> > ++#endif /* __PCI_SYSFS_H__ */
> > +\ No newline at end of file
> > +--
> > +2.27.0
> > +
> > diff --git a/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> > new file mode 100644
> > index 0000000000..d4ba9dfe80
> > --- /dev/null
> > +++ b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> > @@ -0,0 +1,698 @@
> > +From 6752d8d5e315eb3f061498a9c35558f90f9600e2 Mon Sep 17 00:00:00 2001
> > +From: Christian Stewart <christian@paral.in>
> > +Date: Sat, 18 Jul 2020 15:26:22 -0700
> > +Subject: [PATCH] Remove dependency handling from Makefile
> > +
> > +Buildroot will handle this for the makefile.
> > +
> > +Signed-off-by: Christian Stewart <christian@paral.in>
> > +---
> > + Makefile                    |  54 +++------
> > + mk/nvidia-modprobe.mk       |  55 ---------
> > + src/nvc.c                   |   6 +-
> > + src/nvidia-modprobe-utils.c | 225 ++++++++++++++++--------------------
> > + src/nvidia-modprobe-utils.h |  53 ++-------
> > + 5 files changed, 128 insertions(+), 265 deletions(-)
> > + delete mode 100644 mk/nvidia-modprobe.mk
> > +
> > +diff --git a/Makefile b/Makefile
> > +index f1c56a9..80780d1 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -2,13 +2,13 @@

[snip]

> > +
> > + deb: DESTDIR:=$(DIST_DIR)/$(LIB_NAME)_$(VERSION)_$(ARCH)
> > +diff --git a/mk/nvidia-modprobe.mk b/mk/nvidia-modprobe.mk
> > +deleted file mode 100644
> > +index ad399de..0000000
> > +--- a/mk/nvidia-modprobe.mk
> > ++++ /dev/null
> > +@@ -1,55 +0,0 @@
> > +-#
> > +-# Copyright (c) 2017-2018, NVIDIA CORPORATION. All rights reserved.
> > +-#
> > +-
> > +-include $(MAKE_DIR)/common.mk
> > +-
> > +-##### Source definitions #####
> > +-
> > +-VERSION        := 396.51
> > +-PREFIX         := nvidia-modprobe-$(VERSION)
> > +-URL            := https://github.com/NVIDIA/nvidia-modprobe/archive/$(VERSION).tar.gz
> > +-
> > +-SRCS_DIR       := $(DEPS_DIR)/src/$(PREFIX)
> > +-MODPROBE_UTILS := $(SRCS_DIR)/modprobe-utils
> > +-
> > +-LIB_STATIC     := $(MODPROBE_UTILS)/libnvidia-modprobe-utils.a
> > +-LIB_INCS       := $(MODPROBE_UTILS)/nvidia-modprobe-utils.h \
> > +-                  $(MODPROBE_UTILS)/pci-enum.h
> > +-LIB_SRCS       := $(MODPROBE_UTILS)/nvidia-modprobe-utils.c \
> > +-                  $(MODPROBE_UTILS)/pci-sysfs.c
> > +-
> > +-##### Flags definitions #####
> > +-
> > +-ARFLAGS  := -rU
> > +-CPPFLAGS := -D_FORTIFY_SOURCE=2 -DNV_LINUX
> > +-CFLAGS   := -O2 -g -fdata-sections -ffunction-sections -fstack-protector -fno-strict-aliasing -fPIC
> > +-
> > +-##### Private rules #####
> > +-
> > +-LIB_OBJS := $(LIB_SRCS:.c=.o)
> > +-
> > +-$(SRCS_DIR)/.download_stamp:
> > +-      $(MKDIR) -p $(SRCS_DIR)
> > +-      $(CURL) --progress-bar -fSL $(URL) | \
> > +-      $(TAR) -C $(SRCS_DIR) --strip-components=1 -xz $(PREFIX)/modprobe-utils
> > +-      @touch $@
> > +-
> > +-$(LIB_SRCS): $(SRCS_DIR)/.download_stamp
> > +-
> > +-##### Public rules #####
> > +-
> > +-.PHONY: all install clean
> > +-
> > +-all: $(LIB_STATIC)
> > +-
> > +-$(LIB_STATIC): $(LIB_OBJS)
> > +-      $(AR) rs $@ $^
> > +-
> > +-install: all
> > +-      $(INSTALL) -d -m 755 $(addprefix $(DESTDIR),$(includedir) $(libdir))
> > +-      $(INSTALL) -m 644 $(LIB_INCS) $(DESTDIR)$(includedir)
> > +-      $(INSTALL) -m 644 $(LIB_STATIC) $(DESTDIR)$(libdir)
> > +-
> > +-clean:
> > +-      $(RM) $(LIB_OBJS) $(LIB_STATIC)
> > +diff --git a/src/nvc.c b/src/nvc.c
> > +index f1d9b62..74ea61c 100644
> > +--- a/src/nvc.c
> > ++++ b/src/nvc.c
> > +@@ -190,13 +190,13 @@ load_kernel_modules(struct error *err, const char *root)
> > +                 }
> > +
> > +                 log_info("loading kernel module nvidia");
> > +-                if (nvidia_modprobe(0, -1) == 0)
> > ++                if (nvidia_modprobe(0) == 0)
> > +                         log_err("could not load kernel module nvidia");
> > +                 else {
> > +-                        if (nvidia_mknod(NV_CTL_DEVICE_MINOR, -1) == 0)
> > ++                        if (nvidia_mknod(NV_CTL_DEVICE_MINOR) == 0)
> > +                                 log_err("could not create kernel module device node");
> > +                         for (int i = 0; i < (int)devs.num_matches; ++i) {
> > +-                                if (nvidia_mknod(i, -1) == 0)
> > ++                                if (nvidia_mknod(i) == 0)
> > +                                         log_err("could not create kernel module device node");
> > +                         }
> > +                 }
> > +diff --git a/src/nvidia-modprobe-utils.c b/src/nvidia-modprobe-utils.c
> > +index d3f3233..fca21cf 100644
> > +--- a/src/nvidia-modprobe-utils.c
> > ++++ b/src/nvidia-modprobe-utils.c
> > +@@ -1,3 +1,29 @@

[snip]

> > +     else
> > +     {
> > +         ret = snprintf(name,
> > +@@ -154,4 +121,4 @@ fail:
> > +     name[0] = '\0';
> > + }
> > +
> > +-#endif /* __NVIDIA_MODPROBE_UTILS_H__ */
> > +\ No newline at end of file
> > ++#endif /* __NVIDIA_MODPROBE_UTILS_H__ */
> > +--
> > +2.27.0
> > +

> I must say I don't know how to address those big patches.
> Are they a part from an upstream patch or something?

See: https://github.com/vowstar/vowstar-overlay/tree/master/app-emulation/libnvidia-container/files

The patches bring in required modprobe-utils.c pci-sysfs.c which
originate from nvidia-modprobe. As nvidia-modprobe is an executable
and not a library, and the source files for modprobe-utils are not
available anywhere in libnvidia-container (yet are referenced), I had
to add the files as a patch.

>
> > diff --git a/package/libnvidia-container/Config.in b/package/libnvidia-container/Config.in
> > new file mode 100644
> > index 0000000000..7a452c3635
> > --- /dev/null
> > +++ b/package/libnvidia-container/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_LIBNVIDIA_CONTAINER
> > +       bool "libnvidia-container"
> > +       depends on BR2_SHARED_LIBS
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # tirpc
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC # fexecve
> > +       select BR2_PACKAGE_ELFUTILS
> > +       select BR2_PACKAGE_LIBCAP
> > +       select BR2_PACKAGE_LIBTIRPC
> > +       select BR2_PACKAGE_NVIDIA_MODPROBE
> > +       help
> > +         The libnvidia-container package adds a library and CLI for
> > +         GPU-backed containers, agnostic to container runtime.
> > +
> > +         https://github.com/NVIDIA/libnvidia-container
> > +
> > +comment "libnvidia-container needs a shared glibc toolchain w/ threads"
> > +       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC || \
> > +               !BR2_SHARED_LIBS
> > diff --git a/package/libnvidia-container/libnvidia-container.hash b/package/libnvidia-container/libnvidia-container.hash
> > new file mode 100644
> > index 0000000000..d356eb2b1e
> > --- /dev/null
> > +++ b/package/libnvidia-container/libnvidia-container.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed:
> > +sha256 fd447629fd65d171b68edb62fa2e581c67fdb450ff540f486987ab826150d06e  libnvidia-container-1.2.0.tar.gz
> > +sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> > diff --git a/package/libnvidia-container/libnvidia-container.mk b/package/libnvidia-container/libnvidia-container.mk
> > new file mode 100644
> > index 0000000000..d337d0a528
> > --- /dev/null
> > +++ b/package/libnvidia-container/libnvidia-container.mk
> > @@ -0,0 +1,57 @@
> > +################################################################################
> > +#
> > +# libnvidia-container
> > +#
> > +################################################################################
> > +
> > +LIBNVIDIA_CONTAINER_VERSION = 1.2.0
> > +LIBNVIDIA_CONTAINER_SITE = $(call github,NVIDIA,libnvidia-container,v$(LIBNVIDIA_CONTAINER_VERSION))
> > +LIBNVIDIA_CONTAINER_LICENSE = Apache-2.0
> > +LIBNVIDIA_CONTAINER_LICENSE_FILES = LICENSE
> > +
> > +LIBNVIDIA_CONTAINER_DEPENDENCIES = elfutils libcap libtirpc nvidia-modprobe \
> > +       host-pkgconf host-elfutils host-libcap
> > +
> > +LIBNVIDIA_CONTAINER_INCLUDE_DIRS += \
> > +       -I$(HOST_DIR)/include -I$(STAGING_DIR)/usr/include \
> > +       -I$(STAGING_DIR)/usr/include/nvidia-modprobe-utils

> I don't think it's a good idea to mix include flags from both host and
> target directories.

Given that the header was included in one of the patches, these
INCLUDE_DIRS lines are actually unnecessary. (Removed for v2).


> > +LIBNVIDIA_CONTAINER_MAKE_OPTS = \
> > +       AR="$(TARGET_AR)" STRIP="$(TARGET_STRIP)" \
> > +       CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) \
> > +       $(LIBNVIDIA_CONTAINER_INCLUDE_DIRS) -D_GNU_SOURCE" \
> > +       CXX="$(TARGET_CXX)" CPPFLAGS="$(TARGET_CXXFLAGS)" \
> > +       LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)" \
> > +       OBJCPY="$(TARGET_OBJCOPY)" \
> > +       RPCGEN="$(HOST_DIR)/bin/rpcgen" \
> > +       WITH_LIBELF=yes \
> > +       WITH_TIRPC=no

> Most of the above definitions can be acheived from TARGET_CONFIGURE_OPTS.
> I suggest to use TARGET_CONFIGURE_OPTS and define another variable for
> the additional definitions needed by this package.

You're right, I've simplified it for V2:

LIBNVIDIA_CONTAINER_MAKE_OPTS = \
CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
OBJCPY="$(TARGET_OBJCOPY)" \
RPCGEN="$(HOST_DIR)/bin/rpcgen" \
WITH_LIBELF=yes \
WITH_TIRPC=no

define LIBNVIDIA_CONTAINER_BUILD_CMDS
$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
$(TARGET_CONFIGURE_OPTS) \
$(LIBNVIDIA_CONTAINER_MAKE_OPTS) \
shared tools
endef

Thanks for the review.

Best regards,
Christian
