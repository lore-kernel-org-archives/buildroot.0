From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 19:43:00 +0200
Subject: [Buildroot] [PATCH 02/15 v4] fs/cpio: don't extend packages'
 permissions table
In-Reply-To: <1303a4223d2e0a14e009f7585829aef10de66682.1522487149.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 31 Mar 2018 11:05:48 +0200")
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <1303a4223d2e0a14e009f7585829aef10de66682.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <871sg0uonv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when we build a cpio filesystem without static devices, we
 > shoehorn the /dev/console node as if it were specified by a package.

 > This means that this device is added for all filesystems as well, not
 > just the cpio. But if we disable cpio, that device is not created for
 > other filesystems.

 > This is not very clean, and may break expectations.

 > Instead, use an explicit mknod as part of the _CMD, as we know it's
 > going to run under fakeroot.

 > This is still visible to all filesystems built after cpio, and not to
 > those built before it, though.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---
 >  fs/cpio/cpio.mk | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
 > index aa4d947fa5..505976512b 100644
 > --- a/fs/cpio/cpio.mk
 > +++ b/fs/cpio/cpio.mk
 > @@ -15,14 +15,15 @@ endef
 >  else
 >  # devtmpfs does not get automounted when initramfs is used.
 >  # Add a pre-init script to mount it before running init
 > +# We must have /dev/console very early, even before /init runs, so
 > +# that it can at least open its stdin/stdout/stderr filedescriptors.
 >  define ROOTFS_CPIO_ADD_INIT
 >  	if [ ! -e $(TARGET_DIR)/init ]; then \
 >  		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
 >  	fi
 > +	mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1

This is executed before makedevs, so we cannot be sure /dev exists (our
default skeleton has it, but a custom one might not).

I've fixed that by adding a mkdir -p $(TARGET_DIR)/dev before mknod.

-- 
Bye, Peter Korsgaard
