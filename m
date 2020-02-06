From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  6 Feb 2020 14:32:23 -0300
Subject: [Buildroot] [PATCH 0/2] A better solution for the swapon/swapoff
 issue in inittag
Message-ID: <20200206173225.25677-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The current solution is a bit clunky. It adds target-finalize hooks to
two packages and defines the hook in system/system.mk. The hook code is
more complex than it needs to be.

This solution ensures that swapon/swapoff are built if BR2_USE_MMU == y,
only, and moves the hook to skeleton-init-sysv.mk.
---
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Peter Korsgaard <peter@korsgaard.com>
---

Carlos Santos (2):
  Revert "system: don't attempt swapon/swapoff in inittab if not
    available"
  package/skeleton-init-sysv: conditionally enable swapon/swapoff in
    inittab

 package/busybox/Config.in                        |  6 ++++++
 package/busybox/busybox.mk                       | 15 ++++++++++++++-
 package/skeleton-init-sysv/skeleton-init-sysv.mk | 12 ++++++++++++
 package/sysvinit/sysvinit.mk                     |  1 -
 package/util-linux/Config.in                     |  1 +
 system/Config.in                                 |  6 ++++++
 system/system.mk                                 | 13 -------------
 7 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.18.2
