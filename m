From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 13:46:29 +0200
Subject: [Buildroot] [PATCH] xzcat: treat as host prerequisite and build if
	needed
Message-ID: <30d579ff97c4fb7e76b3.1374234389@BEANTN0L019720>
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
 support/dependencies/check-host-xzcat.mk |   7 +++++++
 support/dependencies/check-host-xzcat.sh |  14 ++++++++++++++
 support/dependencies/dependencies.mk     |   4 +++-
 3 files changed, 24 insertions(+), 1 deletions(-)

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
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -20,9 +20,11 @@ ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
 
+# Filter out XZCAT from download tools as this is already handled as host
+# prerequisite and will be built if needed.
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
-		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
+		DL_TOOLS="$(sort $(filter-out $(XZCAT),$(DL_TOOLS_DEPENDENCIES)))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
