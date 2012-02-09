From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 21:45:59 +0100
Subject: [Buildroot] [git commit] dependencies: move from toolchain/ to
	support/
Message-ID: <20120209213031.9422790A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a792668b58fd5f551f30d40c2352f16011f1f92f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout Vandecappelle, move toolchain/dependencies to
support/dependencies, as it really is not toolchain-specific anymore.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                           |    2 ++
 .../dependencies/dependencies.mk                   |    2 +-
 .../dependencies/dependencies.sh                   |    0
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 6 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e1621f9..90d1a9d 100644
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
similarity index 94%
rename from toolchain/dependencies/dependencies.mk
rename to support/dependencies/dependencies.mk
index ea8bf25..3e621e9 100644
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
similarity index 100%
rename from toolchain/dependencies/dependencies.sh
rename to support/dependencies/dependencies.sh
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index c611562..f21cefd 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,6 +1,5 @@
 # Include files required for the internal toolchain backend
 
-include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index e480da9..f6cc2b9 100644
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
index d67405b..d5b2aac 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,7 +1,6 @@
 # Required includes for the external toolchain backend
 
 include toolchain/helpers.mk
-include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
