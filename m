From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Mar 2019 17:37:25 -0700
Subject: [Buildroot] [PATCH v4 3/5] boot/opensbi: Initial commit of
 OpenSBI for RISC-V
In-Reply-To: <20190319220949.06f6ee34@windsurf>
References: <20190319181449.25067-1-alistair.francis@wdc.com>
 <20190319181449.25067-3-alistair.francis@wdc.com>
 <20190319220949.06f6ee34@windsurf>
Message-ID: <CAKmqyKP9xR-Uprioe9DsqNti_fbSjfRRS3mDqQcEQ2W_OQ3WsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 19, 2019 at 2:09 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I was about to apply this patch, but there is still an issue (see
> below). Since a new iteration will be needed, I'll point out some minor
> nits as well that I would have normally fixed myself when applying, but
> that you can fix together with the more significant issue.
>
> First minor nit: the commit title should be "boot/opensbi: new package"
>
> On Tue, 19 Mar 2019 18:15:48 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
>
> > diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> > new file mode 100644
> > index 0000000000..13dffb9ce0
> > --- /dev/null
> > +++ b/boot/opensbi/opensbi.mk
> > @@ -0,0 +1,32 @@
> > +################################################################################
> > +#
> > +# OpenSBI
>
> opensbi in lower-case
>
> > +#
> > +################################################################################
> > +
> > +OPENSBI_VERSION = v0.3
> > +OPENSBI_SITE = $(call github,riscv,opensbi,$(OPENSBI_VERSION))
> > +OPENSBI_LICENSE = BSD-2-Clause
> > +OPENSBI_LICENSE_FILES = COPYING.BSD
> > +OPENSBI_INSTALL_IMAGES = YES
> > +
> > +OPENSBI_MAKE_ENV = \
> > +     CROSS_COMPILE=$(TARGET_CROSS)
> > +
> > +OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
> > +ifneq ($(OPENSBI_PLAT),)
> > +OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
> > +endif
> > +
> > +define OPENSBI_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
> > +endef
> > +
> > +ifneq ($(OPENSBI_PLAT),)
> > +define OPENSBI_INSTALL_IMAGES_CMDS
> > +     $(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
> > +     $(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
> > +endef
> > +endif
>
> So the issue that I have is that this package doesn't install anything
> when OPENSBI_PLAT is empty. It doesn't install any image, it doesn't
> install any library to STAGING_DIR.
>
> Should the libplatsbi.a library be installed in
> $(STAGING_DIR)/usr/lib ? This location is normally for regular Linux
> user-space libraries, which I suppose libplatsbi.a is not. Perhaps it
> should be in another location ?
>
> In any case, it should be installed somewhere, otherwise the package is
> pretty meaningless when OPENSBI_PLAT is empty.

Fixed in v5.

Alistair

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
