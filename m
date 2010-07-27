From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 22:43:04 +0200
Subject: [Buildroot] [git commit master 1/1] target-gcc: Get rid of
	TARGET_GCC_FLAGS
Message-ID: <20100727204322.E064883471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e8e1cdb608499dc620d88af32033adca72e5645
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is used only once, so let's just hardcode its value at
its call site.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/Makefile.in       |    5 -----
 toolchain/gcc/gcc-uclibc-4.x.mk |    5 ++++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index 0dcd803..4278bdb 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -50,11 +50,6 @@ EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARG
 #EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
-TARGET_GCC_FLAGS= CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-	CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-	CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-	BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)"
-
 ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS:=
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 081e906..cfbe616 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -393,7 +393,10 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_GCC_FLAGS) \
+		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+		CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+		CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
-- 
1.7.1
