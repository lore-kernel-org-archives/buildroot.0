From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  7 May 2018 11:44:26 -0300
Subject: [Buildroot] [PATCH v3 0/5] Improve verification of custom rootfs
 skeletons and overlays
Message-ID: <20180507144431.14488-1-casantos@datacom.ind.br>
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

Patch 4 allows rootfs overlays to override symbolic links on purpose (e.g.
/var/log, to persist system logs).

Patch 5 removes the restriction of using merged /usr only with the default
skeleton or when systemd is selected.

Carlos Santos (5):
  skeleton-custom: use a script to check merged usr structure
  skeleton-custom: install /bin, /lib, and /sbin
  Makefile: check rootfs overlays with BR2_ROOTFS_MERGED_USR enabled
  Makefile: allow rootfs overlays to override symbolic links
  system: allow selecting merged /usr along with custom rootfs skeleton

 Makefile                                   | 20 ++++++++++++---
 docs/manual/customize-rootfs.txt           | 17 +++++++++++++
 package/skeleton-custom/skeleton-custom.mk | 25 +++----------------
 support/scripts/check-merged-usr.sh        | 39 ++++++++++++++++++++++++++++++
 system/Config.in                           |  8 ++----
 5 files changed, 78 insertions(+), 31 deletions(-)
 create mode 100755 support/scripts/check-merged-usr.sh

-- 
2.14.3
