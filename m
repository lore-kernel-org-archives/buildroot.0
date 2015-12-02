From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue,  1 Dec 2015 22:58:28 -0200
Subject: [Buildroot] [PATCH v2] musl: add a sys/queue.h implementation
Message-ID: <1449017908-7935-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Musl does not provide a 'sys/queue.h' implementation, and this has been
a problem for packages that depend on it.

So lets create a package called netbsd-queue that will install a
'sys/queue.h' in the staging directory when enabled, based on the
NetBSD implementation.

Musl toolchain and external toolchain packages will depend on this
package, so that 'sys/queue.h' will be always installed when compiling
with a musl based toolchain.

Tested on ARM and x86 in the following cases:
  - Buildroot musl toolchain.
  - External musl toolchain without 'sys/queue.h'.
  - External musl toolchain with 'sys/queue.h'.

Fixes:
http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e

And possibly many others.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

---
Changes v1 -> v2:
  - package name changed to netbsd-queue
  - queue.h is now downloaded from NetBSD CVS server
  - Config.in removed
  - license changed to BSD-3c
  - instead of checking if queue.h already exists before installing, 
    it will be installed unconditionally.
---
 package/musl/musl.mk                               |  5 +++++
 package/netbsd-queue/netbsd-queue.hash             |  2 ++
 package/netbsd-queue/netbsd-queue.mk               | 23 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  7 +++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/netbsd-queue/netbsd-queue.hash
 create mode 100644 package/netbsd-queue/netbsd-queue.mk

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 6fdcc7312288..2cc6699a35b2 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -13,6 +13,11 @@ MUSL_LICENSE_FILES = COPYRIGHT
 # cross-compiler and the kernel headers
 MUSL_DEPENDENCIES = host-gcc-initial linux-headers
 
+# musl does not provide a sys/queue.h implementation, so add the
+# netbsd-queue package that will install a sys/queue.h file in the
+# staging directory based on the NetBSD implementation.
+MUSL_DEPENDENCIES += netbsd-queue
+
 # musl is part of the toolchain so disable the toolchain dependency
 MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/netbsd-queue/netbsd-queue.hash b/package/netbsd-queue/netbsd-queue.hash
new file mode 100644
index 000000000000..f8e2a6c59878
--- /dev/null
+++ b/package/netbsd-queue/netbsd-queue.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h?rev=1.70
diff --git a/package/netbsd-queue/netbsd-queue.mk b/package/netbsd-queue/netbsd-queue.mk
new file mode 100644
index 000000000000..0f486fa25880
--- /dev/null
+++ b/package/netbsd-queue/netbsd-queue.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# netbsd-queue
+#
+################################################################################
+
+NETBSD_QUEUE_VERSION = 1.70
+NETBSD_QUEUE_SITE = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys
+NETBSD_QUEUE_SOURCE = queue.h?rev=$(NETBSD_QUEUE_VERSION)
+NETBSD_QUEUE_LICENSE = BSD-3c
+
+NETBSD_QUEUE_INSTALL_STAGING = YES
+
+define NETBSD_QUEUE_EXTRACT_CMDS
+	cp $(DL_DIR)/$(NETBSD_QUEUE_SOURCE) $(@D)/queue.h
+endef
+
+define NETBSD_QUEUE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/queue.h \
+		$(STAGING_DIR)/usr/include/sys/queue.h
+endef
+
+$(eval $(generic-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 613ce506608b..745b6858a2a7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -237,6 +237,13 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
+# musl does not provide a sys/queue.h implementation, so add the
+# netbsd-queue package that will install a sys/queue.h file in the
+# staging directory based on the NetBSD implementation.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += netbsd-queue
+endif
+
 # The Linaro ARMhf toolchain expects the libraries in
 # {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
 # {/usr,}/lib, so we need to create a symbolic link.
-- 
1.9.1
