From: Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Thu,  3 Mar 2016 16:57:51 +1100
Subject: [Buildroot] [PATCH] host-fakeroot: re-run autotools to fix build on
	ppc64le host
Message-ID: <1456984671-10123-1-git-send-email-stewart@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building on ppc64le host (notably Ubuntu 14.04, where this was
reported), the configure/libtool combination in fakeroot would
incorrectly detect that ld doesn't know how to build shared libraries.
Instead of checking for ppc64le libs, it was checking if we could build
*big* endian libraries, which the native Ubuntu toolchain on Ubuntu 14.04
cannot. The end result would be that you wouldn't get libfakeroot.so,
causing a build failure later on.

However, if we rerun autotools, this works. Additionally, due to
the strange way that fakeroot builds, we need to mkdir build-aux as
this directory does not exist in the original source package.

With this patch, you can now successfully build OpenPower firmware
(which uses buildroot infrastructure) on an Ubuntu 14.04 ppc64le
system.

Fixes: https://github.com/open-power/op-build/issues/194
Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 package/fakeroot/fakeroot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 3f1c803..1f485f4 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -9,5 +9,12 @@ FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
+HOST_FAKEROOT_AUTORECONF=YES
+
+define HOST_FAKEROOT_POST_PATCH_FIXUP
+	mkdir $(HOST_FAKEROOT_DIR)/build-aux
+endef
+
+HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_POST_PATCH_FIXUP
 
 $(eval $(host-autotools-package))
-- 
2.5.0
