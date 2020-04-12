From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 16:13:19 +0200
Subject: [Buildroot] [git commit] package/libargon2: bump to version 20190702
Message-ID: <20200412140524.F18208E77F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=019f9a8bb440543b1f4c5c1d0afe04b48a72bdbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- There is no incompatibility of this version with php, the issue was
  due to libargon2 itself that installs library to lib/x86_64-linux-gnu
  on Linux x86_64 host since
  https://github.com/P-H-C/phc-winner-argon2/commit/d3639142fa71f8095ee36e64068f71b3c97baf6d
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libargon2/libargon2.hash |  4 ++--
 package/libargon2/libargon2.mk   | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libargon2/libargon2.hash b/package/libargon2/libargon2.hash
index c524b42718..331eea99f4 100644
--- a/package/libargon2/libargon2.hash
+++ b/package/libargon2/libargon2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 eaea0172c1f4ee4550d1b6c9ce01aab8d1ab66b4207776aa67991eb5872fdcd8  libargon2-20171227.tar.gz
-sha256 220f8736a89ff51c92ef3d497f413b48e6cf1df3d6278bc909c6308c78e1718e  LICENSE
+sha256  daf972a89577f8772602bf2eb38b6a3dd3d922bf5724d45e7f9589b5e830442c  libargon2-20190702.tar.gz
+sha256  220f8736a89ff51c92ef3d497f413b48e6cf1df3d6278bc909c6308c78e1718e  LICENSE
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index e10343a15e..b3f6e1b216 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
-# 20190702 is not recognized by php7.3
-LIBARGON2_VERSION = 20171227
+LIBARGON2_VERSION = 20190702
 LIBARGON2_SITE = $(call github,P-H-C,phc-winner-argon2,$(LIBARGON2_VERSION))
 LIBARGON2_LICENSE = CC0-1.0 or Apache-2.0
 LIBARGON2_LICENSE_FILES = LICENSE
 LIBARGON2_INSTALL_STAGING = YES
 
+LIBARGON2_OPTS = LIBRARY_REL=lib
+
 # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
 # only uses it to detect if some x86 optimizations can be used, and
 # GCC_TARGET_ARCH is defined on x86.
 ifneq ($(GCC_TARGET_ARCH),)
-LIBARGON2_OPTS = OPTTARGET=$(GCC_TARGET_ARCH)
+LIBARGON2_OPTS += OPTTARGET=$(GCC_TARGET_ARCH)
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
@@ -29,12 +30,12 @@ endef
 
 define LIBARGON2_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) install
+		$(LIBARGON2_OPTS) DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBARGON2_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
+		$(LIBARGON2_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
