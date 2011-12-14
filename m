From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Dec 2011 15:22:18 +0100
Subject: [Buildroot] [PATCH 4 of 4 v3] dependencies: build a host-tar if no
 suitable tar can be found
In-Reply-To: <patchbomb.1323862796@devws108>
References: <patchbomb.1323862796@devws108>
Message-ID: <bc11accdafb5b8b0d945.1323862800@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains, like the one built with buildroot itself, use hardlinks (for
example to link between the c++ and g++ binary). Unpacking such a toolchain
with the --strip-components options does not work correctly if the system tar
is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
tar 1.15.

This patch checks for a suitable tar version (tar 1.17+) on the host system,
and adds host-tar to the host dependencies if none can be found.

host-tar is download and extracted as cpio.gz instead of tar.gz, to prevent
chicken-egg problem.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
v1/v2 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v3: remove chicken-egg problem, causing great simplification; update check-
    host-tar.sh with Arnout's comments.

 package/Makefile.package.in            |  12 ------------
 package/tar/tar.mk                     |   9 +++++++++
 support/dependencies/check-host-tar.mk |   9 +++++++++
 support/dependencies/check-host-tar.sh |  35 +++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -235,18 +235,6 @@ define DOWNLOAD
 	exit 1
 endef
 
-# Utility programs used to build packages
-TAR ?= tar
-
-# Automatically detect tar --strip-path/components option
-TAR_STRIP_COMPONENTS := \
-  $(shell $(TAR) --help | grep strip-path > /dev/null ; \
-  if test $$? = 0 ; then \
-   echo '--strip-path' ; \
-  else \
-   echo '--strip-components' ; \
-  fi)
-
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
 define sep
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,3 +13,12 @@ TAR_DEPENDENCIES += busybox
 endif
 
 $(eval $(call AUTOTARGETS))
+
+# host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
+# of needing tar to build tar.
+HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+HOST_TAR_EXTRACT_CMDS = \
+	mkdir -p $(HOST_TAR_DIR) && cd $(HOST_TAR_DIR) && \
+	$(INFLATE.gz) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i && \
+	mv tar-$(TAR_VERSION)/* . && rmdir tar-$(TAR_VERSION)
+$(eval $(call AUTOTARGETS,host))
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
new file mode 100644
--- /dev/null
+++ b/support/dependencies/check-host-tar.mk
@@ -0,0 +1,9 @@
+TAR ?= tar
+
+ifeq (,$(call suitable-host-package,tar,$(TAR)))
+  DEPENDENCIES_HOST_PREREQ += host-tar
+  TAR = $(HOST_DIR)/usr/bin/tar
+endif
+
+# Since TAR is at least 1.17, it will certainly support --strip-components
+TAR_STRIP_COMPONENTS = --strip-components
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
new file mode 100755
--- /dev/null
+++ b/support/dependencies/check-host-tar.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+candidate="$1"
+
+tar=`which $candidate`
+if [ ! -x "$tar" ]; then
+	tar=`which tar`
+	if [ ! -x "$tar" ]; then
+		# echo nothing: no suitable tar found
+		exit 1
+	fi
+fi
+
+# Output of 'tar --version' examples:
+# tar (GNU tar) 1.15.1
+# tar (GNU tar) 1.25
+version=`$tar --version | head -n 1 | sed 's/^.*\s\([0-9]\+\.\S\+\).*$/\1/'`
+major=`echo "$version" | cut -d. -f1`
+minor=`echo "$version" | cut -d. -f2`
+bugfix=`echo "$version" | cut -d. -f3`
+
+# Minimal version = 1.17 (previous versions do not correctly unpack archives
+# containing hard-links if the --strip-components option is used).
+major_min=1
+minor_min=17
+if [ $major -gt $major_min ]; then
+	echo $tar
+else
+	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
+		echo $tar
+	else
+		# echo nothing: no suitable tar found
+		exit 1
+	fi
+fi
