From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 22:37:48 +0100
Subject: [Buildroot] [PATCH 8/9] boards/zynq: rename the DTB to be
 loaded by U-Boot
In-Reply-To: <1512855007-1834-9-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Sat, 9 Dec 2017 22:30:06 +0100")
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
 <1512855007-1834-9-git-send-email-luca@lucaceresoli.net>
Message-ID: <87k1xtues3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > We are about to introduce genimage support for the Zynq boards. For
 > all of them U-Boot loads the DTB from a file named "devicetree.dtb" so
 > we need to rename it on the SD card image.

 > We could use genimage itself to rename files while creating the
 > image. But this would require a different genimage.cfg for each board,
 > leading to duplicate code.

 > Instead let's create a "devicetree.dtb" symlink pointing to the dtb
 > listed in the configuration. Currently all the Zynq-based boards have
 > only one DTS configured, but if one had two or more of them, the
 > symlink would point to the first one.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 >  board/zynq/post-image.sh        | 11 +++++++++++
 >  configs/zynq_microzed_defconfig |  1 +
 >  configs/zynq_zc706_defconfig    |  1 +
 >  configs/zynq_zed_defconfig      |  1 +
 >  4 files changed, 14 insertions(+)
 >  create mode 100755 board/zynq/post-image.sh

 > diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
 > new file mode 100755
 > index 000000000000..449f4a23725a
 > --- /dev/null
 > +++ b/board/zynq/post-image.sh
 > @@ -0,0 +1,11 @@
 > +#!/bin/sh
 > +
 > +# By default U-Boot loads DTB from a file named "devicetree.dtb", so
 > +# let's use a symlink with that name that points to the *first*
 > +# devicetree listed in the config.
 > +
 > +FIRST_DT=$(sed -n \
 > +           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
 > +           ${BR2_CONFIG})
 > +
 > +ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb

I've added a check for the empty string (E.G. in case you are not
building a kernel / using this option) and committed, thanks.

-- 
Bye, Peter Korsgaard
