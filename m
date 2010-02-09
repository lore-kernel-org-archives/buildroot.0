From: Thomas Brandstetter <thomas.brandstetter@me.com>
Date: Tue, 09 Feb 2010 10:46:17 +0100
Subject: [Buildroot] [PATCH] Buildroot takes the wrong path for syslimits.h
Message-ID: <0A914E9F-E981-4CC3-A0D3-69042D149584@me.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fix the path to the syslimits.h file.

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 6f65cb3..236cfda 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -459,6 +459,10 @@ ifeq ($(findstring x4.3,x$(GCC_VERSION)),x4.3)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 GCC_INCLUDE_DIR:=include-fixed
 endif
+ifeq ($(findstring x4.4,x$(GCC_VERSION)),x4.4)
+GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
+GCC_INCLUDE_DIR:=include-fixed
+endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
        PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
@@ -478,7 +482,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
        # Work around problem of missing syslimits.h
        if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
                echo "warning: working around missing syslimits.h"; \
-               cp -f $(STAGING_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
+               cp -f $(STAGING_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
                        $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
        fi
        # Make sure we have 'cc'.

Cheers Thomas
