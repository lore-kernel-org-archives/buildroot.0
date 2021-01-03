From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 12:07:14 +0100
Subject: [Buildroot] [git commit] package/trace-cmd: bump to version 2.9.1
Message-ID: <20210103104938.53C3E8618E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The layout of the pacakge direcotry has changed, as upstream has added
more than just trace-cmd in the repository (e.g. kernel-shark).

However, the buildsystem for trace-cmd is... unconventional:

  - the top-level Makefile will recurse into the trace-cmd/
    sub-directory, but does not pass any variable on the $(MAKE) command
    line; instead, it exports them in the environment, e.g.:
        export CFLAGS

  - the top-level Makefile appends some definitions to CFLAGS et al.,
    sometimes with a simple append-assignment, sometimes with an
    overriden append-assignment, e.g.:
        CFLAGS += -DVSOCK
        override CFLAGS += -DNO_PTRACE

  - the top-level Makefile does not export all the variables. For
    example, LDFLAGS is not exported;

  - the Makefile in the trace-cmd/ sub-directory expects some variables
    to be set, which is done by the top-level Makefile.

As a consequence, we can no longer pass our variable definitions as make
variable defintions on the command line; we must pass them in the
environment. Note that for some, like CFLAGS, that would still work, but
it would not for others, like LDFLAGS; for consistency, we put all in
the environment.

We can however use the provided 'make install', that behaves as
expected. But we must repeat most environment variables; especially, we
duplicate TARGET_CONFIGURE_OPTS as it has PATH et al. which are needed
by the top-level Makefile to properly detect tools (e.g. swig), which it
uses to decide what it should install.

Drop upstreamed patch.

Update the licensing information: new license files have been added in a
sub-directory, and the top-level COPYING now only references those two
(rather than being the actual text of the GPL-2).

Use two spaces in hash file.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - keep using a git clone
  - unbreak the build:
    - use the default make target rule, or the plugins and python
      bindings be built at install time, with the host compiler
    - use the default install target rule
  - expand commit log:
    - detail buildsystem issues
  - add new license files and their hashes
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-trace-listen-add-missing-header.patch     | 38 ----------------------
 package/trace-cmd/trace-cmd.hash                   |  8 +++--
 package/trace-cmd/trace-cmd.mk                     | 28 ++++++++--------
 3 files changed, 20 insertions(+), 54 deletions(-)

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
-.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c: In function ???make_pid_name???:
-.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c:167:16: error: ???PATH_MAX??? undeclared (first use in this function)
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
index c6447f34d4..3f17e94020 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,4 +1,6 @@
 # Locally computed
-sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
+sha256  f7d591ac13ac3de004aa69fa3c2d333f620bb29ad0fec064ec215f488588b333  trace-cmd-trace-cmd-v2.9.1.tar.gz
+sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
+sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index dfca6a170d..ffaf93a7cd 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.7
-TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_VERSION = trace-cmd-v2.9.1
+TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
-TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
+TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
 TRACE_CMD_DEPENDENCIES = host-pkgconf
+TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 TRACE_CMD_DEPENDENCIES += audit
@@ -19,10 +20,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 TRACE_CMD_DEPENDENCIES += python host-swig
-TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python
+TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 TRACE_CMD_DEPENDENCIES += python3 host-swig
-TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python3
+TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python3
 else
 TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
 endif
@@ -37,17 +38,18 @@ TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 TRACE_CMD_CPPFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CPPFLAGS))
 
 define TRACE_CMD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TRACE_CMD_CFLAGS)" \
-		CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
-		$(TRACE_CMD_MAKE_OPTS) \
-		-C $(@D) all
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TRACE_CMD_CFLAGS)" \
+	CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
+	$(MAKE) $(TRACE_CMD_MAKE_OPTS) -C $(@D)
 endef
 
 define TRACE_CMD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin/trace-cmd
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
-	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TRACE_CMD_CFLAGS)" \
+	CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
+	DESTDIR=$(TARGET_DIR) \
+	$(MAKE) $(TRACE_CMD_MAKE_OPTS) -C $(@D) install
 endef
 
 $(eval $(generic-package))
