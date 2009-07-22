From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 22 Jul 2009 14:25:05 +0200
Subject: [Buildroot] [PATCH] linux26: do not set CFLAGS_KERNEL to
	TARGET_CFLAGS
In-Reply-To: <87bpncdimz.fsf@macbook.be.48ers.dk>
References: <87bpncdimz.fsf@macbook.be.48ers.dk>
Message-ID: <1248265505-25870-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using TARGET_CFLAGS breaks the kernel build for the arm platform. The
result is a kernel that can not be booted. So simply do not fiddle with
the CFLAGS on a kernel build and the kernel build system will do the
right thing (TM).

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 target/linux/Makefile.in.advanced |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 9d878f2..9c11dbe 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -193,7 +193,6 @@ LINUX26_BZCAT:=$(BZCAT)
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
-	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -549,6 +548,7 @@ linux-status:
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
 	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_VERSION=$(LINUX26_VERSION)
+	@echo LINUX26_MAKE_FLAGS=$(LINUX26_MAKE_FLAGS)
 	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
 	@echo TARGETS=$(TARGETS)
 
-- 
1.6.0.4
