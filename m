From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:20:03 +0100
Subject: [Buildroot] [PATCH v4 4/9] package/pkg-generic: handle host-tar as
 an extract dependency
In-Reply-To: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180324142008.10375-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This moves the host-tar dependency handling from
DEPENDENCY_HOST_PREREQ to an extract dependency.

To achieve that, check-host-tar.mk fills in the
BR2_TAR_HOST_DEPENDENCY variable with host-tar if building a host-tar
is needed. The name BR2_TAR_HOST_DEPENDENCY has been chosen because it
matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
check-host-cmake.mk.

The BR2_TAR_HOST_DEPENDENCY is added to all packages, except host-tar
itself (obviously) and host-skeleton, because we depend on
host-skeleton to install host-tar properly in HOST_DIR.

In addition, we modify tar.mk to explicitly build host-tar without
ccache: since ccache source code is available as a tarball, ccache
will obviously depend on host-tar if the system tar is insufficient.

Finally, to make things really clean, we also add
$(BR2_TAR_HOST_DEPENDENCY) to the dependencies of the tar filesystem
format, since it requires tar, so we'd better make sure we have a
suitable tar.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes since v3:
 - Add dependency on BR2_TAR_HOST_DEPENDENCY in the tar filesystem
 - Use = instead of += when defining BR2_TAR_HOST_DEPENDENCY
 - Fix typo in commit log
 - Added Reviewed-by from Yann.

Changes since v2:
 - New patch
---
 fs/tar/tar.mk                          | 2 ++
 package/pkg-generic.mk                 | 4 ++++
 package/tar/tar.mk                     | 5 +++++
 support/dependencies/check-host-tar.mk | 2 +-
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index e39c2fdbf1..68149e9eb7 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -6,6 +6,8 @@
 
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
+ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
+
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
 		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0a404040b0..ae50c5f284 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -555,6 +555,10 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
+ifeq ($(filter host-tar host-skeleton,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index a8a15d9518..92b6e9eaa5 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -47,4 +47,9 @@ endef
 
 HOST_TAR_CONF_OPTS = --without-selinux
 
+# we are built before ccache
+HOST_TAR_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 $(eval $(host-autotools-package))
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
index ad0b32e277..07d02fd1b1 100644
--- a/support/dependencies/check-host-tar.mk
+++ b/support/dependencies/check-host-tar.mk
@@ -1,6 +1,6 @@
 TAR ?= tar
 
 ifeq (,$(call suitable-host-package,tar,$(TAR)))
-DEPENDENCIES_HOST_PREREQ += host-tar
 TAR = $(HOST_DIR)/bin/tar
+BR2_TAR_HOST_DEPENDENCY = host-tar
 endif
-- 
2.14.3
