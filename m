From: Steve Kenton <skenton@ou.edu>
Date: Sat, 28 Mar 2015 15:17:18 -0500
Subject: [Buildroot]  Something odd about  /dev/console creation
In-Reply-To: <5515D638.9090502@mind.be>
References: <5512F41A.3080208@ou.edu>
 <CAOS_Y6SpQXSC3z2AEBH3j9wgqbbtC6=LDNb8p3fk_s0YyMe2Tw@mail.gmail.com>
 <5514D92B.4050305@ou.edu> <5515D638.9090502@mind.be>
Message-ID: <55170C4E.1080403@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like there is something odd going on with the creation of /dev/console
There also seems to be some unintended mixing of creation of the cpio filesystem
vs installing it as an initramfs as controlled by these settings.

BR2_TARGET_ROOTFS_CPIO
BR2_TARGET_ROOTFS_INITRAMFS

Which can result in /init being created and populated with the script for an initramfs
boot when in fact it is not needed if BR2_TARGET_ROOTFS_CPIO os set and BR2_TARGET_ROOTFS_INITRAMFS
is not. It does not seem to hurt anything but is odd to see.

# Anyway, back to /dev/console apparently always being created in the on-disk filesystem.
# As far as I can tell this line always gets executed during any buildroot make
# independent of the above settings for actually creating a cpio filesystem or initramfs
./fs/cpio/cpio.mk:PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)

# Which means that this line:
./fs/common.mk:	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)

# will always add /dev/console to _device_table.txt for creation during the build (example from my usual build)
printf '	/bin/busybox                     f 4755 0  0 - - - - -\n	/usr/share/udhcpc/default.script f 755  0  0 - - - - -\n \  # split for email readability
/dev/console c 622 0 0 5 1 - - -\n' >> /data/bcdist/buildroot-2015.02/output/build/_device_table.txt


# I got lost in the maze of twisty windy make rules, all different, so I
# added a syntactically invalid 'puke here' to the fs/cpio/cpio.mk as shown here
PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
puke here
# Then did 'make defconfig; make -d' in a clean buildroot tree and generated this output when it died
# which definitely shows it's being read, even when no kernel is being built.
...
Reading makefile 'fs/cpio/cpio.mk' (search path) (no ~ expansion)...
fs/cpio/cpio.mk:25: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.

# Without the 'puke here' the minimal build results in a dev directory containing these files:
# .../buildroot-2015.02$ ls -l /output/target/dev
total 4
-rw--w--w- 1 steve steve    0 Mar 28 14:32 console
lrwxrwxrwx 1 steve steve   10 Mar  1 15:26 log -> ../tmp/log
drwxrwxr-x 2 steve steve 4096 Mar  1 15:26 pts


I'm not sure how to proceed from here but I don't think the current situation is 'correct'

Steve Kenton
