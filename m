From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:20:04 +0100
Subject: [Buildroot] [PATCH v4 5/9] package/pkg-generic: handle host-xz as
 an extract dependency
In-Reply-To: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180324142008.10375-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This moves the host-xz dependency handling from
DEPENDENCY_HOST_PREREQ to an extract dependency.

To achieve that, check-host-xz.mk fills in the
BR2_XZ_HOST_DEPENDENCY with host-tar if building a host-tar is
needed. The name BR2_XZ_HOST_DEPENDENCY has been chosen because it
matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
check-host-cmake.mk.

The BR2_XZ_HOST_DEPENDENCY is added to all packages, except:

 - host-xz, because we would otherwise depend on ourself.

 - host-tar, because xz itself is delivered as a tarball, so we need
   to have host-xz depend on host-tar, and not host-tar depend on
   host-xz

 - host-skeleton, because we need to have host-xz depend on
   host-skeleton, and not the opposite.

In addition, we modify xz.mk to explicitly build host-xz without
ccache. We generally took the approach of building host-ccache *after*
all the extractors have been built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes in v3:
 - Added Reviewed-by from Yann.

Changes since v2:
 - New patch
---
 package/pkg-generic.mk                   | 4 ++++
 package/xz/xz.mk                         | 5 +++++
 support/dependencies/check-host-xzcat.mk | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ae50c5f284..b03d7263b1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -559,6 +559,10 @@ ifeq ($(filter host-tar host-skeleton,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
 
+ifeq ($(filter host-tar host-skeleton host-xz,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e8116f24ae..bcdac13ee3 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -18,5 +18,10 @@ else
 XZ_CONF_OPTS = --disable-threads
 endif
 
+# we are built before ccache
+HOST_XZ_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index 9be75c7311..e5d72f95dd 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -2,7 +2,7 @@
 # If it is not present, build our own host-xzcat
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
-DEPENDENCIES_HOST_PREREQ += host-xz
+BR2_XZCAT_HOST_DEPENDENCY = host-xz
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
 XZCAT = $(HOST_DIR)/bin/xzcat
 endif
-- 
2.14.3
