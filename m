From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 11:42:11 +0200
Subject: [Buildroot] [PATCHv2 13/15] fs/iso9660: add hybrid image support
In-Reply-To: <CAOJKDvKk2uRb8nr3fVUubnd26CUn=n2XH60YMSYLzQukAnN5PQ@mail.gmail.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAOJKDvKk2uRb8nr3fVUubnd26CUn=n2XH60YMSYLzQukAnN5PQ@mail.gmail.com>
Message-ID: <20150727114211.5dad487b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No?,

On Mon, 27 Jul 2015 11:24:16 +0200, No? RUBINSTEIN wrote:

> 2015-06-09 0:21 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
> > +define ROOTFS_ISO9660_GEN_HYBRID
> > +       $(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
> > +endef
> > +
> > +ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
> 
> My understanding is that _POST_GEN_HOOKS has been skipped in the v2
> patch series, so this does not work. Is that correct?

Oops, you are absolutely right. I guess we simply need to do something
like:

ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
define ROOTFS_ISO9660_GEN_HYBRID
        $(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
endef
endif

define ROOTFS_ISO9660_CMD
        $(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
                -no-emul-boot -boot-load-size 4 -boot-info-table \
                -o $@ $(ROOTFS_ISO9660_TARGET_DIR)
	$(ROOTFS_ISO9660_GEN_HYBRID)
endef

Can you try this, and if it works, send the corresponding patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
