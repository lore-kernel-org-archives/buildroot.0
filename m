From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 15:00:02 +0100
Subject: [Buildroot] [PATCH 3 of 3 v2] Move toolchain/dependencies to
	support/dependencies
In-Reply-To: <patchbomb.1322053783@devws108>
References: <patchbomb.1322053783@devws108>
Message-ID: <52e7185c07a0115567d6.1322053786@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout Vandecappelle, move toolchain/dependencies to
support/dependencies, as it really is not toolchain-specific anymore.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -298,6 +298,8 @@ include package/Makefile.in
 
 all: world
 
+include support/dependencies/dependencies.mk
+
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
diff --git a/toolchain/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
rename from toolchain/dependencies/check-host-tar.mk
rename to support/dependencies/check-host-tar.mk
diff --git a/toolchain/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
rename from toolchain/dependencies/check-host-tar.sh
rename to support/dependencies/check-host-tar.sh
diff --git a/toolchain/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
rename from toolchain/dependencies/dependencies.mk
rename to support/dependencies/dependencies.mk
--- a/toolchain/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -11,9 +11,9 @@ DEPENDENCIES_HOST_PREREQ:=
 # should return the path to the suitable host tool, or nothing if no
 # suitable tool was found.
 define suitable-host-package
-$(shell toolchain/dependencies/check-host-$(1).sh)
+$(shell support/dependencies/check-host-$(1).sh)
 endef
-include toolchain/dependencies/check-host-*.mk
+include support/dependencies/check-host-*.mk
 
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
@@ -29,7 +29,7 @@ core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		DL_TOOLS="$(DL_TOOLS)" \
-		$(TOPDIR)/toolchain/dependencies/dependencies.sh
+		$(TOPDIR)/support/dependencies/dependencies.sh
 
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
diff --git a/toolchain/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
rename from toolchain/dependencies/dependencies.sh
rename to support/dependencies/dependencies.sh
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,6 +1,5 @@
 # Include files required for the internal toolchain backend
 
-include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -2,7 +2,6 @@
 
 # Explicit ordering:
 include toolchain/helpers.mk
-include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,7 +1,6 @@
 # Required includes for the external toolchain backend
 
 include toolchain/helpers.mk
-include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
