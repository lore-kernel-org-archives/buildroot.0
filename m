From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2011 10:28:13 +0100
Subject: [Buildroot] [PATCH v2] add support for virtual terminal
In-Reply-To: <4EB8DEF6.3020106@visionsystems.de>
References: <4EB7C53D.4030902@visionsystems.de>
 <87pqh3d0bn.fsf@macbook.be.48ers.dk>
 <4EB8DEF6.3020106@visionsystems.de>
Message-ID: <20111108102813.084fff3d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 08 Nov 2011 08:49:10 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I'd like to have both serial console and virtual one (on tty I
> experiment with my program and vie serial console I can do other
> administrative tasks. One could use ssh, but this implies having
> network connection). Every time I execute make clean or clone BR I
> loose my inittab. Earlier versions of inittab had some ttys
> predefined, but they were deleted, so I thought, it would be useful
> to add this as an option. This way everyone should be satisfied.

Just use a post-build script to customize your inittab. Something like:

BR2_ROOTFS_POST_BUILD_SCRIPT="board/yegor_company/yegor_project/post-build.sh"

with board/yegor_company/yegor_project/post-build.sh containing:

---------------8<------------------
#!/bin/sh

TARGET_DIR=$1

grep -q "^tty1::respawn:" $TARGET_DIR/etc/inittab || \
	echo "tty1::respawn:/sbin/getty tty1 38400" >> $TARGET_DIR/etc/inittab
---------------8<------------------

And there you are. If you don't like that, you can also just copy the
fs/skeleton/etc/inittab into board/yegor_company/yegor_project/ and
have the post-build.sh script do something like:

---------------8<------------------
#!/bin/sh

TARGET_DIR=$1
BOARD_DIR=board/yegor_company/yegor_project/

cp $BOARD_DIR/inittab $TARGET_DIR/etc/inittab
---------------8<------------------

And there you are.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
