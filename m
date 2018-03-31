From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 19:50:15 +0200
Subject: [Buildroot] [PATCH 07/15 v4] fs: use a per-rootfs fakeroot
 script
In-Reply-To: <c296e87bd778b9c2ef610a772adbd3d41bcb54a3.1522487149.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 31 Mar 2018 11:05:53 +0200")
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <c296e87bd778b9c2ef610a772adbd3d41bcb54a3.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <87woxst9rc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ... and locate that script in a per-rootfs directory.
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---
 >  fs/common.mk | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/fs/common.mk b/fs/common.mk
 > index eebe83d6e5..db4f8c23ad 100644
 > --- a/fs/common.mk
 > +++ b/fs/common.mk
 > @@ -28,7 +28,6 @@
 >  # macro will automatically generate a compressed filesystem image.
 
 >  FS_DIR = $(BUILD_DIR)/buildroot-fs
 > -FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.fs
 >  FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 >  ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 >  	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 > @@ -76,10 +75,11 @@ ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 >  endif
 
 >  $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 > +$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot

It wasn't quite clear to me why we had to go through the hoops to ensure
ROOTFS didn't leak but we don't do it for FAKEROOT_SCRIPT, so I've
extended the commit message a bit.

-- 
Bye, Peter Korsgaard
