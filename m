From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 20:53:10 +0200
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
Message-ID: <20130915205310.06f8af50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 15 Sep 2013 14:37:21 -0400, Danomi Manchego wrote:

> > However, I'd like to add more detail on using the rootfs UBIFS
> > image in a volume (i.e $@fs in the existing code), but I'm not sure
> > what suggestion to give to the user: i.e, what image= line should
> > he put in his custom configuration file?
> 
> What I found was that the image path is relative to the $(TOPDIR).  So
> if you are providing your own file, you need to know your $(O) and
> either specify a path relative to $(TOPDIR), or an absolute path.  i
> played with the idea of having a sed line or something to substitute
> in a file path, but decided against.  I though that if you are
> providing your own config file, then it could refer to multiple images
> in different output directories (for whatever reason), in which case
> you have to know where your files are anyway.

Using sed sounds like a good idea. Just provide a keyword that the user
can use in his custom configuration file, and that Buildroot will
automatically replace by the path to the UBIFS root filesystem image.
Of course, for the other volumes, the user can specify whichever image
he wants.

So, the user could write something like:

[rootfs]
mode=ubi
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_alignment=1
vol_flags=autoresize
image=BR2_ROOTFS_UBIFS_PATH

[datafs]
mode=ubi
vol_id=1
vol_type=dynamic
vol_name=datafs
vol_alignment=1
vol_flags=autoresize
image=/some/other/location.img

and Buildroot replaces BR2_ROOTFS_UBIFS_PATH by the proper
$(O)/images/ubifs.img.

Note that this could also be used in the fs/ubifs/ubinize.cfg file,
therefore making the default and custom cases more similar:

ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
else
UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
endef

define ROOTFS_UBI_CMD
	cp $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg
	$(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/' $(BUILD_DIR)/ubinize.cfg
	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
	rm $(BUILD_DIR)/ubinize.cfg
endef

Of course, the BR2_ROOTFS_UBIFS_PATH trick would have to be properly
documented in the configuration option help text.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
