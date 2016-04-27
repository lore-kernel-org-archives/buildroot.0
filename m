From: lionel at vanbemten.com <lionel@vanbemten.com>
Date: Wed, 27 Apr 2016 17:29:43 +0200
Subject: [Buildroot] [PATCH 1/1] lksctp-tools: allow building the library
 without the tools
Message-ID: <3c566d3c65caadb3a7c897ec56b93c0c@vanbemten.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 From 6ec58aa8226a212e7b1d7bd7f058f52313f3e0e8 Mon Sep 17 00:00:00 2001
 From: Lionel Van Bemten <lionel@vanbemten.com>
Date: Tue, 26 Apr 2016 18:43:55 +0200
Subject: [PATCH 1/1] lksctp-tools: allow building the library without 
the tools

lksctp-tools provides three things:
   * C language header files (netinet/sctp.h)
   * a user-space library (libsctp)
   * some helper utilities around SCTP (sctp_darn,
     checksctp, sctp_status, withsctp and sctp_test)

This change makes it possible to
   * publish the header file without building the library
     nor the tools (for applications using only system calls)
   * build the library without the tools (typical usecase
     for an embedded application)

Signed-off-by: Lionel Van Bemten <lionel@vanbemten.com>
---
  package/lksctp-tools/Config.in       |   22 ++++++++++++++
  package/lksctp-tools/lksctp-tools.mk |   53 
++++++++++++++++++++++++++++++++++
  2 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/package/lksctp-tools/Config.in 
b/package/lksctp-tools/Config.in
index 9c95ef5..13d86db 100644
--- a/package/lksctp-tools/Config.in
+++ b/package/lksctp-tools/Config.in
@@ -15,3 +15,25 @@ config BR2_PACKAGE_LKSCTP_TOOLS
  comment "lksctp-tools needs a toolchain w/ threads, dynamic library"
         depends on BR2_USE_MMU
         depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LKSCTP_TOOLS
+
+config BR2_PACKAGE_LKSCTP_TOOLS_LIBSCTP
+       bool "libsctp"
+       default y
+       help
+         Enable this option to compile libsctp and make it available
+         to other packages. Otherwise only the header file
+         netinet/sctp.h is made public.
+
+config BR2_PACKAGE_LKSCTP_TOOLS_TOOLS
+       bool "tools"
+       default y
+       depends on BR2_PACKAGE_LKSCTP_TOOLS_LIBSCTP
+       help
+         Enable this option to compile the utilities provided by
+         lksctp-tools: sctp_darn, checksctp, sctp_status, withsctp
+         and sctp_test.
+
+endif
+
diff --git a/package/lksctp-tools/lksctp-tools.mk 
b/package/lksctp-tools/lksctp-tools.mk
index 91b96a6..1cb25ce 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -18,6 +18,59 @@ define LKSCTP_TOOLS_MAKE_M4
  endef
  LKSCTP_TOOLS_POST_PATCH_HOOKS += LKSCTP_TOOLS_MAKE_M4

+# Build and install binaries only when requested
+# Otherwise we only copy header files (netinet/sctp.h) to the staging 
directory
+# Therefore the BUILD and INSTALL_TARGET steps are skipped
+# and INSTALL_STAGING runs "make install" in subdirectory src/include
+
+# If libsctp is not selected
+#   - no compilation
+#   - no installation to target
+#   - only header files are installed to the staging directory
+ifneq ($(BR2_PACKAGE_LKSCTP_TOOLS_LIBSCTP),y)
+
+LKSCTP_TOOLS_INSTALL_TARGET = NO
+
+define LKSCTP_TOOLS_BUILD_CMDS
+       @echo Skip build step because BR2_PACKAGE_LKSCTP_TOOLS_LIBSCTP 
is not set
+endef
+
+define LKSCTP_TOOLS_INSTALL_STAGING_CMDS
+       $(TARGET_MAKE_ENV) $(LKSCTP_TOOLS_MAKE_ENV) $(LKSCTP_TOOLS_MAKE) 
$(LKSCTP_TOOLS_INSTALL_STAGING_OPTS) -C 
$(LKSCTP_TOOLS_SRCDIR)/src/include
+endef
+
+# If libsctp is selected
+else
+
+# If tools are not selected
+#   - compile only libsctp
+#   - install header files and libsctp to staging directory
+#   - install only libsctp to target
+ifneq ($(BR2_PACKAGE_LKSCTP_TOOLS_TOOLS),y)
+
+define LKSCTP_TOOLS_BUILD_CMDS
+       $(TARGET_MAKE_ENV) $(LKSCTP_TOOLS_MAKE_ENV) $(LKSCTP_TOOLS_MAKE) 
$(LKSCTP_TOOLS_MAKE_OPTS) -C $(LKSCTP_TOOLS_SRCDIR)/src/lib
+endef
+
+define LKSCTP_TOOLS_INSTALL_STAGING_CMDS
+       $(TARGET_MAKE_ENV) $(LKSCTP_TOOLS_MAKE_ENV) $(LKSCTP_TOOLS_MAKE) 
$(LKSCTP_TOOLS_INSTALL_STAGING_OPTS) -C 
$(LKSCTP_TOOLS_SRCDIR)/src/include
+       $(TARGET_MAKE_ENV) $(LKSCTP_TOOLS_MAKE_ENV) $(LKSCTP_TOOLS_MAKE) 
$(LKSCTP_TOOLS_INSTALL_STAGING_OPTS) -C $(LKSCTP_TOOLS_SRCDIR)/src/lib
+endef
+
+define LKSCTP_TOOLS_INSTALL_TARGET_CMDS
+       $(TARGET_MAKE_ENV) $(LKSCTP_TOOLS_MAKE_ENV) $(LKSCTP_TOOLS_MAKE) 
$(LKSCTP_TOOLS_INSTALL_TARGET_OPTS) -C $(LKSCTP_TOOLS_SRCDIR)/src/lib
+endef
+
+endif
+
+# If tools are selected
+#   - compile everything
+#   - install everything to target and staging directory
+# This is the default behavior of the autotools-package
+# so we don't need to define anything
+
+endif
+
  # Cleanup installed target source code
  define LKSCTP_TOOLS_CLEANUP_TARGET
         rm -rf $(TARGET_DIR)/usr/share/lksctp-tools
-- 
1.7.1
