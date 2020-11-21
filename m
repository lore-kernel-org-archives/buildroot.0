From: Christian Stewart <christian@paral.in>
Date: Sat, 21 Nov 2020 12:32:05 -0800
Subject: [Buildroot] [PATCH v4 1/5] package/nvidia-modprobe: new package
In-Reply-To: <c39da99f-96c6-66ef-8f49-4655112a5441@gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <c39da99f-96c6-66ef-8f49-4655112a5441@gmail.com>
Message-ID: <CA+h8R2rq67w5b0qhgcMZewNehLKx-CRBDxOX1faixhv6QP=WPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Nov 21, 2020 at 2:19 AM Romain Naour <romain.naour@gmail.com> wrote:

[snip]

> > +NVIDIA_MODPROBE_VERSION = 450.57
> > +NVIDIA_MODPROBE_SITE = $(call github,NVIDIA,nvidia-modprobe,$(NVIDIA_MODPROBE_VERSION))
> > +NVIDIA_MODPROBE_LICENSE = GPL-2
>
> The license should use identifier like GPL-2.0 or GPL-2.0+.
> Here it should be GPL-2.0.

Ok, noted.

> > +NVIDIA_MODPROBE_LICENSE_FILES = COPYING
> > +
> > +NVIDIA_MODPROBE_DEPENDENCIES = host-pkgconf
>
> Why ? the binary is build by using gcc directly without any build system.

At one point I had errors about pkgconf, so I added the dependency.
Will try building it without the dependency and see if it works.

> > +NVIDIA_MODPROBE_INSTALL_STAGING = YES
> > +
> > +define NVIDIA_MODPROBE_BUILD_CMDS
> > +     mkdir -p $(@D)/bin
> > +     $(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> > +             -I $(@D)/common-utils -I $(@D)/modprobe-utils \
> > +             -o $(@D)/bin/nvidia-modprobe \
> > +             -DNV_LINUX=true -DPROGRAM_NAME=\"nvidia-modprobe\" \
> > +             -DNVIDIA_VERSION=\"$(NVIDIA_MODPROBE_VERSION)\" \
> > +             $(@D)/nvidia-modprobe.c $(@D)/modprobe-utils/nvidia-modprobe-utils.c \
> > +             $(@D)/modprobe-utils/pci-sysfs.c $(@D)/common-utils/common-utils.c \
> > +             $(@D)/common-utils/msg.c $(@D)/common-utils/nvgetopt.c
> > +endef
>
> There is a Makefile why not using it ?
> Ok it want to install the man pages but it should be easy to fix it.

The makefile was not working correctly and doing a lot of extra stuff
we don't need.

Why is storing the simplified build commands in the makefile via a
patch more clear / easy to maintain than directly in the Buildroot
makefiles?

If necessary, I will re-format this into the makefile via a patch for
the next revision. But this definitely works fine as-is and we are
unlikely to need a more complicated build script for this package in
the future.

> > +define NVIDIA_MODPROBE_INSTALL_STAGING_CMDS
> > +     $(INSTALL) -D -m 644 $(@D)/modprobe-utils/nvidia-modprobe-utils.h \
> > +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-modprobe-utils.h
> > +     $(INSTALL) -D -m 644 $(@D)/modprobe-utils/pci-enum.h \
> > +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/pci-enum.h
> > +     $(INSTALL) -D -m 644 $(@D)/common-utils/common-utils.h \
> > +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-common-utils.h
> > +     $(INSTALL) -D -m 644 $(@D)/common-utils/msg.h \
> > +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/msg.h
> > +     $(INSTALL) -D -m 644 $(@D)/common-utils/nvgetopt.h \
> > +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvgetopt.h
> > +endef
>
> Same, we really don't want to maintain the gcc command line and the list of
> installed files. The Makefile must do it for us :)

Why? The list won't change. How is storing it in a patch file easier
to maintain than in this makefile?

> > +
> > +define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -m 0755 $(@D)/bin/nvidia-modprobe \
> > +             $(TARGET_DIR)/usr/bin/nvidia-modprobe
> > +endef
>
> Same.

??

Best,
Christian
