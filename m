From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:12:36 +0100
Subject: [Buildroot] [PATCH v5 2/4] boot/opensbi: new package
In-Reply-To: <20190320003706.1126-2-alistair.francis@wdc.com>
References: <20190320003706.1126-1-alistair.francis@wdc.com>
 <20190320003706.1126-2-alistair.francis@wdc.com>
Message-ID: <20190320221236.1ea9c11b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francis,

You are respining the patches too fast, without answering some of the
questions, and therefore there's still an issue, see below.

On Wed, 20 Mar 2019 00:38:05 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> +ifneq ($(OPENSBI_PLAT),)
> +OPENSBI_PLAT_INSTALL = \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin; \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
> +endif
> +
> +# Install libsbi.a in the host lib dir so it can be linked in the future.
> +define OPENSBI_INSTALL_IMAGES_CMDS
> +	$(OPENSBI_PLAT_INSTALL)
> +	$(INSTALL) -m 0644 -D $(@D)/build/lib/libsbi.a $(HOST_DIR)/usr/lib

I suppose that libsbi.a contains code cross-compiled for RISC-V, so
installing it in $(HOST_DIR) is wrong in this case. It should go in
$(STAGING_DIR).

The second question, which I asked in my review of your v4 is whether
this library is meant to be linked into bare-metal code (which is what
I would expect for something related to firmware) or to Linux
user-space applications. In the latter case, installing to
$(STAGING_DIR)/usr/lib is the right thing to do. In the former case
however, it should probably be installed elsewhere, maybe
$(STAGING_DIR)/usr/share/opensbi (but I'm not a FHS expert).

Also, when -D is used, the destination path should include the filename.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
