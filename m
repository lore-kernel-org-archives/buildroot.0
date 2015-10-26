From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 17:47:08 +0100
Subject: [Buildroot] [PATCH] kmod: Fix tool links when
	BR2_ROOTFS_MERGED_USR
In-Reply-To: <562e333d.G1kZT16K4SVKn/lt%chris.lesiak@licor.com> (Chris
 Lesiak's message of "Mon, 26 Oct 2015 09:05:49 -0500")
References: <562e333d.G1kZT16K4SVKn/lt%chris.lesiak@licor.com>
Message-ID: <87r3khd1bn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:

 >> From 259a889fc3eb5196a9b69a624effe56b9e6dcfeb Mon Sep 17 00:00:00 2001
 > From: Chris Lesiak <chris.lesiak@licor.com>
 > Date: Mon, 26 Oct 2015 08:51:48 -0500
 > Subject: [PATCH] kmod: Fix tool links when BR2_ROOTFS_MERGED_USR

 > Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
 > ---
 >  package/kmod/kmod.mk | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
 > index e07e601..84ef7c3 100644
 > --- a/package/kmod/kmod.mk
 > +++ b/package/kmod/kmod.mk
 > @@ -46,11 +46,19 @@ KMOD_LICENSE_FILES += COPYING
 >  # take precedence over busybox implementation
 >  KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)

I was a bit confused that things didn't work as ../usr/bin/kmod seems a
sensible path from /sbin, but the symlink is resolved first so it really
starts from /usr/sbin.


 > +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 > +define KMOD_INSTALL_TOOLS
 > +	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
 > +		ln -sf ../bin/kmod $(TARGET_DIR)/usr/sbin/$$i; \
 > +	done
 > +endef
 > +else
 >  define KMOD_INSTALL_TOOLS
 >  	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
 >  		ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; \
 >  	done
 >  endef
 > +endif

Instead of having the logic twice with the risks of getting them out of
sync in the future, I've instead added a KMOD_BIN_PATH (that is either
../bin/kmod or ../usr/bin/kmod) and used that.

There isn't really any good reason to use $(TARGET_DIR)/usr/sbin/$$i
over $(TARGET_DIR/sbin/$$i as ln follows the symlink, so I've left that
as is.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
