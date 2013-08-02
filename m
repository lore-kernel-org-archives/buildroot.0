From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 02 Aug 2013 11:05:15 +0200
Subject: [Buildroot] [PATCH 2 of 2 v3] xzcat: treat as host prerequisite and
 build if needed
In-Reply-To: <patchbomb.1375434313@BEANTN0L019720>
References: <patchbomb.1375434313@BEANTN0L019720>
Message-ID: <a7969409ab53a2fc00c4.1375434315@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If xzcat is not present on the host system, buildroot bails out early asking
the developer to install it (xzcat is now a DL_TOOLS_DEPENDENCY)
Conversely, when BR2_TARGET_ROOTFS_CPIO_XZ is enabled, then host-xz is a
build dependency, and no manual action is required from the developer.

Because the second approach is nicer, also build host-xz when xzcat is not
available, using the host-prerequisite and suitable-host-pkg mechanisms,
already used for tar.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: update after $(firstword) change
v2: avoid filtering out xzcat from DL_TOOLS_DEPENDENCIES (comment ThomasP)

 package/pkg-generic.mk                   |   4 ++++
 support/dependencies/check-host-xzcat.mk |   7 +++++++
 support/dependencies/check-host-xzcat.sh |  14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
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
