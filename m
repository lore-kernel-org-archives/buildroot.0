From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:28 -0000
Subject: [Buildroot] [git commit branch/next] package/lttng-modules: use
	kernel-module helper
Message-ID: <20150808105628.2A29B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57f86ba34101f38c6e491af9c1db837967a0085f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

lttng-modules' Makefile already uses the Linux buildsystem to build its
modules, so just switch to using the new kernel-module infra.

To be noted: lttng-modules' Makefile uses $(shell pwd) that expects the
PWD to be the Linux' top build directory, which is not the case for us.
However, it uses to detect a conflict between a stale static version.h
and a generated version.h (due to the switch to uapi). This is of no
consequence to us, because we can't have a Linux build directory with
such stale files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-modules/lttng-modules.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 6833ad2..30c581e 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -10,14 +10,5 @@ LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 
-LTTNG_MODULES_DEPENDENCIES = linux
-
-define LTTNG_MODULES_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
-endef
-
-define LTTNG_MODULES_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) modules_install
-endef
-
+$(eval $(kernel-module))
 $(eval $(generic-package))
