From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:33:29 +0200
Subject: [Buildroot] [git commit] toolchain: copy_toolchain_lib_root:
	clarify input parameter
Message-ID: <20170405195202.838B9804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e4fb2019b116da3f606eeae976752d1a64d5fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The input to copy_toolchain_lib_root is not one library, not a list of
libraries, but a library name pattern with glob wildcards.
This pattern is then passed to 'find' to get the actual list of libraries
matching the pattern. Reflect this using an appropriate variable name.

Note: if the root of the buildroot tree contains a file matching one of
these library patterns, the copying of libraries from staging to target will
not be correct. It is not impossible to fix that, e.g. using 'set -f', but
maybe it's not worth it.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk                                 | 4 ++--
 toolchain/helpers.mk                                   | 6 +++---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 58cb3d4..ccaa4c2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -110,8 +110,8 @@ GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
 define GLIBC_INSTALL_TARGET_CMDS
-	for libs in $(GLIBC_LIBS_LIB); do \
-		$(call copy_toolchain_lib_root,$$libs) ; \
+	for libpattern in $(GLIBC_LIBS_LIB); do \
+		$(call copy_toolchain_lib_root,$$libpattern) ; \
 	done
 endef
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0ec9da4..e83bf27 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -6,12 +6,12 @@
 # toolchain logic, and the glibc package, so care must be taken when
 # changing this function.
 #
-# $1: library name
+# $1: library name pattern (can include glob wildcards)
 #
 copy_toolchain_lib_root = \
-	LIB="$(strip $1)"; \
+	LIBPATTERN="$(strip $1)"; \
 \
-	LIBPATHS=`find $(STAGING_DIR)/ -name "$${LIB}" 2>/dev/null` ; \
+	LIBPATHS=`find $(STAGING_DIR)/ -name "$${LIBPATTERN}" 2>/dev/null` ; \
 	for LIBPATH in $${LIBPATHS} ; do \
 		DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index a4d010a..9670350 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -387,8 +387,8 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
-	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$$libs); \
+	$(Q)for libpattern in $(TOOLCHAIN_EXTERNAL_LIBS); do \
+		$(call copy_toolchain_lib_root,$$libpattern); \
 	done
 endef
 endif
