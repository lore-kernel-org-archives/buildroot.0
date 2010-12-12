From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 13:24:58 -0500
Subject: [Buildroot] [PATCH] ccache: do not setup vars with :=
Message-ID: <1292178298-8574-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ccache var setup does not need to assign values immediately, and by
doing so, prevents later toolchain logic from tweaking the cross target
easily.  So rework the code a bit to use deferred evaluation.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Makefile.in |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2ba2b64..9004bd7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,9 +103,9 @@ TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 # including the --sysroot option where necessary.
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
-TARGET_CC       = $(TARGET_CROSS)gcc $(TARGET_SYSROOT_OPT)
+_TARGET_CC      = $(TARGET_CROSS)gcc $(TARGET_SYSROOT_OPT)
 TARGET_CPP      = $(TARGET_CROSS)cpp $(TARGET_SYSROOT_OPT)
-TARGET_CXX      = $(TARGET_CROSS)g++ $(TARGET_SYSROOT_OPT)
+_TARGET_CXX     = $(TARGET_CROSS)g++ $(TARGET_SYSROOT_OPT)
 TARGET_FC       = $(TARGET_CROSS)gfortran $(TARGET_SYSROOT_OPT)
 TARGET_LD       = $(TARGET_CROSS)ld $(TARGET_SYSROOT_OPT)
 TARGET_NM       = $(TARGET_CROSS)nm
@@ -113,12 +113,15 @@ TARGET_RANLIB   = $(TARGET_CROSS)ranlib
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-TARGET_CC_NOCCACHE  := $(TARGET_CC)
-TARGET_CXX_NOCCACHE := $(TARGET_CXX)
+TARGET_CC_NOCCACHE  = $(_TARGET_CC)
+TARGET_CXX_NOCCACHE = $(_TARGET_CXX)
 
 ifeq ($(BR2_CCACHE),y)
-TARGET_CC  := $(CCACHE) $(TARGET_CC)
-TARGET_CXX := $(CCACHE) $(TARGET_CXX)
+TARGET_CC  = $(CCACHE) $(_TARGET_CC)
+TARGET_CXX = $(CCACHE) $(_TARGET_CXX)
+else
+TARGET_CC  = $(_TARGET_CC)
+TARGET_CXX = $(_TARGET_CXX)
 endif
 
 ifeq ($(BR2_STRIP_strip),y)
-- 
1.7.3.3
