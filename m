From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:36:32 +0100
Subject: [Buildroot] [git commit] package/kexec: add optional support for xz,
	bump version
Message-ID: <20160221133751.8046380770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1a04d7ad12ce6162601bb0801782597e7bfb107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xz was compiled before, kexec will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/kdump | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [liblzma.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

The version bump to 2.0.11 is needed to fix a configure script issue:

   line 4712: ac_fn_c_try_link: command not found

This issue was fixed by upstream commit
http://git.kernel.org/cgit/utils/kernel/kexec/kexec-tools.git/commit/configure.ac?id=58bbd468571b3e80585e5d68e97c8d67c8ed583b,
which was merged after 2.0.9 was released.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: bump version instead of doing a "hack" to force the use of
the lzma library.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index fa2d8be..24a71e7 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	8ae34a9ceb76350954e1e1e3ca9ab51da15862bd5f2fd14392208e60fb454f71	kexec-tools-2.0.9.tar.xz
+sha256	b1097986ffdb928cf41a94e8a5dfddc981a8fa710cccf13298e7f8dd939a2ee3	kexec-tools-2.0.11.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index d158406..0e64c0d 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.9
+KEXEC_VERSION = 2.0.11
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
@@ -17,6 +17,13 @@ else
 KEXEC_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+KEXEC_CONF_OPTS += --with-lzma
+KEXEC_DEPENDENCIES += xz
+else
+KEXEC_CONF_OPTS += --without-lzma
+endif
+
 define KEXEC_REMOVE_LIB_TOOLS
 	rm -rf $(TARGET_DIR)/usr/lib/kexec-tools
 endef
