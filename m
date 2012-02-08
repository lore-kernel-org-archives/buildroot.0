From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 08 Feb 2012 17:22:16 +0100
Subject: [Buildroot] [PATCH 1 of 5 v6] dependencies: move from toolchain/ to
	support/
In-Reply-To: <patchbomb.1328718135@beantl019720>
References: <patchbomb.1328718135@beantl019720>
Message-ID: <15ca714101d6d9eb8830.1328718136@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout Vandecappelle, move toolchain/dependencies to
support/dependencies, as it really is not toolchain-specific anymore.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 Makefile                               |    2 ++
 toolchain/dependencies/dependencies.mk |    2 +-
 toolchain/dependencies/dependencies.sh |  Bin
 toolchain/toolchain-buildroot.mk       |    1 -
 toolchain/toolchain-crosstool-ng.mk    |    1 -
 toolchain/toolchain-external.mk        |    1 -
 6 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -297,6 +297,8 @@ include package/Makefile.in
 
 all: world
 
+include support/dependencies/dependencies.mk
+
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
diff --git a/toolchain/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
rename from toolchain/dependencies/dependencies.mk
rename to support/dependencies/dependencies.mk
--- a/toolchain/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -14,7 +14,7 @@ core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
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
