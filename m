From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jul 2009 22:43:51 +0200
Subject: [Buildroot] [git commit] linux26: do not set CFLAGS_KERNEL to
	TARGET_CFLAGS
Message-ID: <20090722204437.752507781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bb5ce002cd9ecd697ed4defd912d3f0de02319b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using TARGET_CFLAGS breaks the kernel build for the arm platform. The
result is a kernel that can not be booted. So simply do not fiddle with
the CFLAGS on a kernel build and the kernel build system will do the
right thing (TM).

[Peter: do the same thing for the standard kernel build]

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Makefile.in          |    3 ---
 target/linux/Makefile.in.advanced |    3 +--
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index ff0b88e..3e8bc7b 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -89,11 +89,8 @@ LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
 #"))
 endif
 endif
-__LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
-__LINUX26_ZERO_OPTIMIZATION=-O0
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
-	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC) $(__LINUX26_ZERO_OPTIMIZATION),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 9d878f2..47a1f4e 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -190,10 +190,8 @@ LINUX_KERNEL:=$(LINUX26_KERNEL)
 # -----------------------------------------------------------------------------
 LINUX26_BZCAT:=$(BZCAT)
 
-__LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
-	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -549,6 +547,7 @@ linux-status:
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
 	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_VERSION=$(LINUX26_VERSION)
+	@echo LINUX26_MAKE_FLAGS=$(LINUX26_MAKE_FLAGS)
 	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
 	@echo TARGETS=$(TARGETS)
 
-- 
1.6.3.3
