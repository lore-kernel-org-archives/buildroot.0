From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 29 Aug 2020 17:26:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/trace-cmd: bump to version 2.9.1
Message-ID: <20200829152651.5769-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This also fixes issue with multiple definition
  of 'common_type_field' in 'trace-hist.c' and 'trace-mem.c'
  during linking with binutils 2.34 and gcc 10.2.0

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...-Makefile-variable-to-enable-cross-c.patch | 31 +++++++++++++++
 ...0001-trace-listen-add-missing-header.patch | 38 -------------------
 package/trace-cmd/trace-cmd.hash              |  4 +-
 package/trace-cmd/trace-cmd.mk                | 10 ++---
 4 files changed, 38 insertions(+), 45 deletions(-)
 create mode 100644 package/trace-cmd/0001-Add-EXTRA_CFLAGS-Makefile-variable-to-enable-cross-c.patch
 delete mode 100644 package/trace-cmd/0001-trace-listen-add-missing-header.patch

diff --git a/package/trace-cmd/0001-Add-EXTRA_CFLAGS-Makefile-variable-to-enable-cross-c.patch b/package/trace-cmd/0001-Add-EXTRA_CFLAGS-Makefile-variable-to-enable-cross-c.patch
new file mode 100644
index 0000000000..4c0f714ce3
--- /dev/null
+++ b/package/trace-cmd/0001-Add-EXTRA_CFLAGS-Makefile-variable-to-enable-cross-c.patch
@@ -0,0 +1,31 @@
+From 5df99a39264d547c8a012bcfa230a4d30458c62e Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar-dev@posteo.net>
+Date: Sat, 29 Aug 2020 16:51:51 +0200
+Subject: [PATCH 1/1] Add EXTRA_CFLAGS Makefile variable to enable
+ cross-compilation
+
+The main Makefile modifies CFLAGS variable but the changes are
+not propagated to recursive MAKE sub-processes if one overrides
+it on the command-line.
+
+Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index b034042..fdd1e48 100644
+--- a/Makefile
++++ b/Makefile
+@@ -235,6 +235,8 @@ CFLAGS ?= -g -Wall
+ CPPFLAGS ?=
+ LDFLAGS ?=
+ 
++CFLAGS += $(EXTRA_CFLAGS)
++
+ VSOCK_DEFINED := $(shell if (echo "$(pound)include <linux/vm_sockets.h>" | $(CC) -E - >/dev/null 2>&1) ; then echo 1; else echo 0 ; fi)
+ 
+ export VSOCK_DEFINED
+-- 
+2.28.0
+
diff --git a/package/trace-cmd/0001-trace-listen-add-missing-header.patch b/package/trace-cmd/0001-trace-listen-add-missing-header.patch
deleted file mode 100644
index 350e523025..0000000000
--- a/package/trace-cmd/0001-trace-listen-add-missing-header.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c68c868b573acc73e144312326750be2ed96632f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 29 Jun 2017 14:43:19 +0300
-Subject: [PATCH] trace-listen: add missing header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The PATH_MAX macro requires the limits.h header. This fixes build with musl
-libc:
-
-.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c: In function ?make_pid_name?:
-.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c:167:16: error: ?PATH_MAX? undeclared (first use in this function)
-  snprintf(buf, PATH_MAX, VAR_RUN_DIR "/trace-cmd-net.pid");
-                ^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://lkml.org/lkml/2017/6/29/286
-
- trace-listen.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/trace-listen.c b/trace-listen.c
-index 17ff9d8c160c..838d6bcf3649 100644
---- a/trace-listen.c
-+++ b/trace-listen.c
-@@ -31,6 +31,7 @@
- #include <fcntl.h>
- #include <signal.h>
- #include <errno.h>
-+#include <limits.h>
- 
- #include "trace-local.h"
- #include "trace-msg.h"
--- 
-2.11.0
-
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index c6447f34d4..91c0512d5f 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256 f7d591ac13ac3de004aa69fa3c2d333f620bb29ad0fec064ec215f488588b333  trace-cmd-trace-cmd-v2.9.1.tar.gz
+sha256 b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index dfca6a170d..59924aebf3 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.7
+TRACE_CMD_VERSION = trace-cmd-v2.9.1
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
@@ -37,17 +37,17 @@ TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 TRACE_CMD_CPPFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CPPFLAGS))
 
 define TRACE_CMD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TRACE_CMD_CFLAGS)" \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		EXTRA_CFLAGS="$(TRACE_CMD_CFLAGS)" \
 		CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
 		$(TRACE_CMD_MAKE_OPTS) \
 		-C $(@D) all
 endef
 
 define TRACE_CMD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin/trace-cmd
+	$(INSTALL) -D -m 0755 $(@D)/tracecmd/trace-cmd $(TARGET_DIR)/usr/bin/trace-cmd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
-	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+	$(INSTALL) -D -m 0755 $(@D)/lib/traceevent/plugins/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
 endef
 
 $(eval $(generic-package))
-- 
2.28.0
