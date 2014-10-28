From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 28 Oct 2014 22:28:17 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain-external: Detect empty or
	invalid sysroot
In-Reply-To: <1414531699-6789-1-git-send-email-romain.naour@openwide.fr>
References: <1414531699-6789-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1414531699-6789-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the Sourcery Codebench standard edition, the sysroot returned
point to a non existant directory if no CFLAGS are specified.

Here are the results of -print-sysroot gcc option:

$ ./i686-pc-linux-gnu-gcc -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/system32 (doesn't exist)

$ ./i686-pc-linux-gnu-gcc -m64 -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/system64 (doesn't exist)

$ ./i686-pc-linux-gnu-gcc -msgxx-glibc -print-sysroot
Full/path/to/i686-pc-linux-gnu/libc/sgxx-glibc (exist)

The problem is that in the "libc" directory there is only the sub-directory
"sgxx-glibc". Therefore all hearders files and libraries are only available
in arch specific sysroot.

When using the -print-file-name gcc option, the result is quite buggy and it
is not empty.

$ ./i686-pc-linux-gnu-gcc -print-file-name=libc.a
libc.a

So the toolchain check fail because $PWD/libc.a is used as SYSROOT_DIR since
the toolchain-external backend does not always use CFLAGS.

This patch change the SYSROOT_DIR/ARCH_SYSROOT_DIR detection logic so that if
SYSROOT_DIR is empty/bogus, then the same value as ARCH_SYSROOT_DIR is used.

This ensures that both SYSROOT_DIR and ARCH_SYSROOT_DIR point to valid
directories (which would the same in the case of this toolchain, which brings
us back to the non-multilib toolchain case).

If toolchain_find_sysroot() was used without flags, then flags are added to
allow the fallback to arch sysroot. In normal cases the same behavior as
before is expected.

If toolchain_find_sysroot() was used with flags, then it's replaced by
toolchain_find_arch_sysroot() with the same flags.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/toolchain-external.mk | 28 +++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b7a0e60..2aee133 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -437,9 +437,9 @@ define toolchain_find_libc_a
 $$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
 endef
 
-# Returns the sysroot location for the given compiler + flags
-define toolchain_find_sysroot
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+# Returns the arch sysroot location for the given compiler + flags
+define toolchain_find_arch_sysroot
+$$(echo -n $(call toolchain_find_libc_a,$(1) $(2)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
@@ -448,6 +448,18 @@ define toolchain_find_libdir
 $$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
 endef
 
+# Returns the main sysroot location for the given compiler + flags
+# First, try to find the sysroot without flags.
+# If the sysroot path is empty/bogus then use the arch sysroot instead.
+define toolchain_find_sysroot
+$$(main_sysroot="$(call toolchain_find_arch_sysroot,$(1))"; \
+if ! test -d $${main_sysroot}; then \
+	echo -n $(call toolchain_find_arch_sysroot,$(1), $(2)) ; \
+else \
+	echo -n $${main_sysroot}; \
+fi)
+endef
+
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
@@ -455,13 +467,13 @@ endef
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
 	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
+		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
@@ -544,12 +556,12 @@ endif
 #                       to the target filesystem.
 
 define TOOLCHAIN_EXTERNAL_INSTALL_CORE
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_arch_sysroot,$(TOOLCHAIN_EXTERNAL_CC), $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
@@ -595,7 +607,7 @@ ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	FDPIC_SYSROOT_DIR="$(call toolchain_find_arch_sysroot,$${FDPIC_EXTERNAL_CC}, $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
 	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-- 
1.9.3
