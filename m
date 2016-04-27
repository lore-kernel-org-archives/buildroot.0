From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:18:35 +0200
Subject: [Buildroot] [git commit] toolchain-external: move the sysroot check
	to helper function
Message-ID: <20160427201954.BB4C281EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bb03553005c1773a0a5b18d4c5a4f3be3e50add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sysroot toolchain support check is duplicated at two locations in
the external toolchain infra. So move it inside the
check_unusable_toolchain helper that is called when the toolchain
package is configured (TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS).

The check in TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS can be safely
removed since it's already done in check_unusable_toolchain helper.

The check in TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS was removed by
2a87b64f8e8a832a351f8552eb032e4b18431949.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                               |  5 +++++
 toolchain/toolchain-external/toolchain-external.mk | 10 +---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 8aaad67..4548ede 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -376,6 +376,11 @@ check_unusable_toolchain = \
 	if test "$${libc_a_path}" = "libc.a" ; then \
 		echo "Unable to detect the toolchain sysroot, Buildroot cannot use this toolchain." ; \
 		exit 1 ; \
+	fi ; \
+	sysroot_dir="$(call toolchain_find_sysroot,$${__CROSS_CC})" ; \
+	if test -z "$${sysroot_dir}" ; then \
+		echo "External toolchain doesn't support --sysroot. Cannot use." ; \
+		exit 1 ; \
 	fi
 
 #
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2620fb8..2422b6d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -493,17 +493,13 @@ $$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64
 endef
 
 # Checks for an already installed toolchain: check the toolchain
-# location, check that it supports sysroot, and then verify that it
+# location, check that it is usable, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # kernel headers version, type of C library and all C library features.
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	if test -z "$${SYSROOT_DIR}" ; then \
-		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
-		exit 1 ; \
-	fi ; \
 	$(call check_kernel_headers_version,\
 		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
@@ -654,10 +650,6 @@ endif
 
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	if test -z "$${SYSROOT_DIR}" ; then \
-		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
-		exit 1 ; \
-	fi ; \
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
