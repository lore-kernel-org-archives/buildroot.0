From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 09:53:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: disable parallel
 build
Message-ID: <20191226085308.2198045-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build randomly fails since December 2017 on:

make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
 /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
  /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
/usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
make[5]: *** [install-rootsbinPROGRAMS] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/2063bd18830ef02dca0bed889c43639009bc688e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 326ff4f2dd..ef62325a31 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -10,6 +10,9 @@ ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERS
 ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 
+# Package does not build in parallel due to improper make rules
+ECRYPTFS_UTILS_MAKE = $(MAKE1)
+
 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
-- 
2.24.0
