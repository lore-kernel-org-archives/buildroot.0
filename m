From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:26:53 +0100
Subject: [Buildroot] [git commit] toolchain-external: factorize regular
	expressions
Message-ID: <20131110232734.4CCA49A131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=646bd86908f7f995cdc2b95e0be381d97600f905
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on a suggestion from Peter, this commit factorizes the logic and
regular expressions that are used to find the sysroot and libdir for a
given compiler. It reduces a bit the duplication of code, and
centralizes the most bizarre part of this logic in one place.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   32 +++++++++++++------
 1 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1732070..bd4f375 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -387,6 +387,22 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 endef
 endif
 
+# Returns the location of the libc.a file for the given compiler + flags
+define toolchain_find_libc_a
+$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
+endef
+
+# Returns the sysroot location for the given compiler + flags
+define toolchain_find_sysroot
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+endef
+
+# Returns the lib subdirectory for the given compiler + flags (i.e
+# typically lib32 or lib64 for some toolchains)
+define toolchain_find_libdir
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
+endef
+
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
@@ -394,8 +410,7 @@ endif
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -476,15 +491,13 @@ endif
 #                       to the target filesystem.
 
 define TOOLCHAIN_EXTERNAL_INSTALL_CORE
-	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	ARCH_LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
-	ARCH_SYSROOT_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
-	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:'` ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
 		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
@@ -529,9 +542,8 @@ ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_LIBC_A_LOCATION=`readlink -f $$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
-	FDPIC_SYSROOT_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::'` ; \
-	FDPIC_LIB_DIR=`echo $${FDPIC_LIBC_A_LOCATION} | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:'` ; \
+	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
 	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
 	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
