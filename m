From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  5 Apr 2020 16:21:42 +0200
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: also replace /lib by
 STAGING_DIR/lib in .la files
Message-ID: <20200405142143.4182009-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the staging installation, we replace a number of paths in
libtool .la files so that those paths point to STAGING_DIR instead to
location in the build machine.

However, we replace only paths that start with /usr. And it turns out
that the linux-pam package is configured with --libdir=/lib (linux-pam
seems to always be installed in /lib rather than /usr/lib).

Due to this, libpam.la contains the following line:

  libdir='/lib'

When building a configuration that has:

 - BR2_ROOTFS_MERGED_USR=y
 - BR2_PACKAGE_LINUX_PAM=y
 - BR2_PACKAGE_POLKIT=y

on a system that has its system-wide PAM library installed in /lib,
the build fails with:

/lib/libpam.so: file not recognized: File format not recognized

For some reason, libtool searches only in STAGING_DIR/usr/lib, but
when BR2_ROOTFS_MERGED_USR=y, STAGING_DIR/lib points to
STAGING_DIR/usr/lib, so libtool finds libpam.la. And this libpam.la
contains a bogus libdir='/lib' path. libtool then goes on, finds
/lib/libpam.so, and links with it, causing the build failure.

By doing the proper replacement of libdir='/lib', we have a correct
libpam.la, and solve the build issue.

There is no autobuilder failure associated to this issue, as it
requires /lib/libpam.so to exist. This is the case on ArchLinux, on
which Xogium reported the issue, which can also be reproduced in an
ArchLinux container.

Reported-by: Xogium <contact@xogium.me>
Cc: Xogium <contact@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 20b07a7fa9..7679c41556 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -329,6 +329,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
 				-e "s:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			-e "s:\(['= ]\)/lib:\\1 at STAGING_DIR@/lib:g" \
 			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
 				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
-- 
2.25.1
