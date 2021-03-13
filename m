From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Mar 2021 08:47:18 +0100
Subject: [Buildroot] [git commit] package/opkg-utils: add missing
 dependencies for host build
Message-ID: <20210313072428.7DB8F81172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9521492bd0706fbb5c81e87b65ad25898f974f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opkg-utils is a collection of bash and python scripts which require
additional commands/tools be available for the bash scripts. The full
list of dependencies that the opkg-util scripts require is:

  bash
  binutils
  bzip2
  coreutils
  diffutils
  findutils
  grep
  gzip
  lz4
  python3
  sed
  tar
  xz

The Buildroot manual requires a few packages (bash, binutils, bzip2,
gzip, sed and tar) to be installed on the host system, so we need not
add those. Additionally, and even though they are not in that list,
that grep and find are also required (we already make extensive use of
both everywhere, so it is as good as them being in the list).

We have a host variant for coreutils, but only for systems that do not
already have a recent-enough one, i.e. that provides 'realpath' and
'ln --relative'. opkg-utils uses neither, so can rely on the ones on the
system.

Only add dependencies on the remaining host tools: diffutils, lz4, and
xz.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - drop excessive dependencies,
  - reword the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg-utils/opkg-utils.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index a7dc22d7c4..19dfb26f7a 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -10,7 +10,11 @@ OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
 
-HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
+HOST_OPKG_UTILS_DEPENDENCIES = \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
+	host-diffutils \
+	host-lz4 \
+	host-xz
 
 # Nothing to build; only scripts to install.
 define HOST_OPKG_UTILS_INSTALL_CMDS
