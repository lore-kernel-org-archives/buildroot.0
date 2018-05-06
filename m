From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun,  6 May 2018 18:31:12 -0300
Subject: [Buildroot] [PATCH 0/4] Improve verification of custom rootfs
 skeletons and overlays
Message-ID: <20180506213116.25084-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series makes some improvements in the verification of custom rootfs
skeletons and overlays, regarding mergerd /usr:

Patch 1 adds a script to check if a given path complies to the merged /usr
requirements and makes skeleton-custom.mk use it instead of a bunch of
variables filled by $(shell ...) macros.

Patch 2 ensures that /bin, /lib and /sbin are created for custom skeletons,
either as directories or symlinks, according to BR2_ROOTFS_MERGED_USR.

Patch 3 uses the script added in patch 1 to check rootfs overlays, in
target-finalize.

Patch 3 removes the restriction of using merged /usr only with the default
skeleton or when systemd is selected.

Carlos Santos (4):
  skeleton-custom: use a script to check merged usr structure
  skeleton-custom: install /bin, /lib, and /sbin
  Makefile: check rootfs overlays with BR2_ROOTFS_MERGED_USR enabled
  system: allow selecting merged /usr along with custom rootfs skeleton

 Makefile                                   | 20 +++++++++--
 docs/manual/customize-rootfs.txt           | 10 ++++++
 package/skeleton-custom/skeleton-custom.mk | 25 ++------------
 support/scripts/check-merged-usr.sh        | 39 ++++++++++++++++++++++
 system/Config.in                           |  8 ++---
 5 files changed, 71 insertions(+), 31 deletions(-)
 create mode 100755 support/scripts/check-merged-usr.sh

-- 
2.17.0
