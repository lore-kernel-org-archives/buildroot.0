From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 9 Jun 2014 23:13:43 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
Message-ID: <20140609211341.GB10459@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

To properly use systemd as init system, some modifications should be performed
on the default skeleton. This can be done via an overlay and a post-build
script, as done in [1]. However, it would be best for Buildroot users to have
it done automatically, as noted per ThomasP and MaximeH [2]. This brings forth
the idea of having one target skeleton per init system.

IHMO, there are two solutions for implementing it:

a) Move system/skeleton to system/skeleton/busybox, then add
   system/skeleton/systemd, and maybe system/skeleton/sysv. The menu in
   system/Config.in will be updated to select BR2_ROOTFS_SKELETON_BUSYBOX,
   or BR2_ROOTFS_SKELETON_CUSTOM.
b) Add a new virtual package: target-skeleton, with some providers:
   target-skeleton-busybox, target-skeleton-systemd and
   target-skeleton-custom (path to the custom skeleton would be handled in the
   configuration menu).

Solution A is the quickest and less intrusive to implement, but it can only
copy the files of the skeleton, not perform the additional operations from the
post-build script. So solution B seems the best.

But if a new package target-skeleton is added, what would be the dependency
chain? Would `make target-skeleton-rebuild` rebuild... the whole rootfs?

Comments and ideas welcomed!

Best regards,
ELB

[1] https://github.com/elebihan/buildroot-ext-elb/tree/master/overlays/base-systemd
[2] http://lists.busybox.net/pipermail/buildroot/2014-June/098738.html
