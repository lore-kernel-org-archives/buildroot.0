From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 17:03:03 +0200
Subject: [Buildroot] [PATCH v4 1/2] ts4800-mbrboot: new package
In-Reply-To: <1465498542-7333-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 (Patrick Keroulas's message of "Thu, 9 Jun 2016 14:55:41 -0400")
References: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1465498542-7333-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <87vb0mu5lk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Keroulas <patrick.keroulas@savoirfairelinux.com> writes:

 > This MBR routine is based on TS' original bootloader.  It is loaded by
 > the bootrom stored in the companion FPGA, and chainloads an executable
 > located at the beginning of the first non-fs (0xda) partition.

 > Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>

Is there no official upstream location for this so we don't need to
carry it inside Buildroot? I know it is small, but still.

 > diff --git a/package/ts4800-mbrboot/ts4800-mbrboot.mk b/package/ts4800-mbrboot/ts4800-mbrboot.mk
 > new file mode 100644
 > index 0000000..706d191
 > --- /dev/null
 > +++ b/package/ts4800-mbrboot/ts4800-mbrboot.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# ts4800-mbrboot
 > +#
 > +################################################################################
 > +
 > +TS4800_MBRBOOT_VERSION = 1.0
 > +TS4800_MBRBOOT_SITE = $(TOPDIR)/package/ts4800-mbrboot/src
 > +TS4800_MBRBOOT_SITE_METHOD = local

That's not really nice. If we have to include it inside buildroot then I
would prefer to handle it like we do for E.G. makedevs.


> +TS4800_MBRBOOT_LICENSE = BSD-2c
 > +TS4800_MBRBOOT_LICENSE_FILES = LICENSE
 > +
 > +define TS4800_MBRBOOT_BUILD_CMDS
 > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
 > +		OBJCOPY="$(TARGET_OBJCOPY)" -C $(@D)

please use $(TARGET_CONFIGURE_OPTS) instead.

> +endef
 > +
 > +define TS4800_MBRBOOT_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/

We normally use install -D, so I would prefer to use that here as well.

-- 
Bye, Peter Korsgaard
