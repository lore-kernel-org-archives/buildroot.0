From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Sep 2013 23:30:36 +0200
Subject: [Buildroot] [git commit] xzcat: treat as host prerequisite and
	build if needed
Message-ID: <20130907061414.1B9BE80474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f325f554cab7912e9221e91aba5b8aa97b1e3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If xzcat is not present on the host system, buildroot bails out early asking
the developer to install it (xzcat is now a DL_TOOLS_DEPENDENCY)
Conversely, when BR2_TARGET_ROOTFS_CPIO_XZ is enabled, then host-xz is a
build dependency, and no manual action is required from the developer.

Because the second approach is nicer, also build host-xz when xzcat is not
available, using the host-prerequisite and suitable-host-pkg mechanisms,
already used for tar.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk                   |    4 ++++
 support/dependencies/check-host-xzcat.mk |    7 +++++++
 support/dependencies/check-host-xzcat.sh |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 65ab8c6..00f1cb3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -541,7 +541,11 @@ endif # SITE_METHOD
 
 # $(firstword) is used here because the extractor can have arguments, like
 # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
+# Do not add xzcat to the list of required dependencies, as it gets built
+# automatically if it isn't found.
+ifneq ($(call suitable-extractor,$($(2)_SOURCE)),$(XZCAT))
 DL_TOOLS_DEPENDENCIES += $(firstword $(call suitable-extractor,$($(2)_SOURCE)))
+endif
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
new file mode 100644
index 0000000..24286ef
--- /dev/null
+++ b/support/dependencies/check-host-xzcat.mk
@@ -0,0 +1,7 @@
+# XZCAT is taken from BR2_XZCAT (defaults to 'xzcat') (see Makefile)
+# If it is not present, build our own host-xzcat
+
+ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
+  DEPENDENCIES_HOST_PREREQ += host-xz
+  XZCAT = $(HOST_DIR)/usr/bin/xzcat
+endif
diff --git a/support/dependencies/check-host-xzcat.sh b/support/dependencies/check-host-xzcat.sh
new file mode 100755
index 0000000..10f1c45
--- /dev/null
+++ b/support/dependencies/check-host-xzcat.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+xzcat=`which $candidate 2>/dev/null`
+if [ ! -x "$xzcat" ]; then
+	xzcat=`which xzcat 2>/dev/null`
+	if [ ! -x "$xzcat" ]; then
+		# echo nothing: no suitable xzcat found
+		exit 1
+	fi
+fi
+
+echo $xzcat
