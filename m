From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 12 Mar 2021 14:05:32 -0600
Subject: [Buildroot] [PATCH 6/8] package/opkg-utils: add missing
 dependencies for host build
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312200534.923-7-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Since buildroot requires that bash, binutils, bzip2, gzip, sed and tar
be installed on the host system, only add dependencies on the
remaining host tools.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/opkg-utils/opkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index a250b4ef9f..d7f68b8555 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -10,7 +10,14 @@ OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
 
-HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
+HOST_OPKG_UTILS_DEPENDENCIES += \
+	host-coreutils \
+	host-diffutils \
+	host-findutils \
+	host-grep \
+	host-lz4 \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
+	host-xz
 
 define HOST_OPKG_UTILS_INSTALL_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
-- 
2.17.1
