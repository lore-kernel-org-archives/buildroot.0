From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 22:28:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: disable parallel build
Message-ID: <20210516202828.321469-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel build is broken since bump to version 2.03.13 in commit
80997acd3587a4528f8877d9e8a502c39ed800c5:

make[2]: Leaving directory '/srv/storage/autobuild/run/instance-0/output-1/build/lvm2-2.03.12/tools'
    [CC] dmsetup
/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: dmsetup.o: file not recognized: file truncated

or

    [INSTALL] systemd_generators
/usr/bin/install: cannot stat 'lvm2_activation_generator_systemd_red_hat': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/30359c351a6ce2f9139494a531e036f0b0406ccf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 224dbf5d54..509b979294 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -11,6 +11,8 @@ LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 LVM2_CPE_ID_PRODUCT = redhat
+# parallel build issues
+LVM2_MAKE = $(MAKE1)
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner. We disable NLS because it's broken, and
-- 
2.30.2
