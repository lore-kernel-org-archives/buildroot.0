From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Dec 2014 22:41:37 +0100
Subject: [Buildroot] [PATCHv2 1/4] toolchain-external: split target
	installation from staging installation
In-Reply-To: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417470100-32657-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all the installation work of the toolchain-external package
is done during the install-staging step. However, in order to be able
to properly collect the size added by each package to the target
filesystem, we need to make sure that toolchain-external installs its
files to $(TARGET_DIR) during the install-target step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 51e0af5..933f812 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -538,7 +538,7 @@ endif
 #                       considered when searching libraries for copy
 #                       to the target filesystem.
 
-define TOOLCHAIN_EXTERNAL_INSTALL_CORE
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
@@ -563,8 +563,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
-	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
@@ -582,6 +580,26 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 	fi
 endef
 
+define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
+	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	if test -z "$${SYSROOT_DIR}" ; then \
+		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
+		exit 1 ; \
+	fi ; \
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	SUPPORT_LIB_DIR="" ; \
+	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
+			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+		fi ; \
+	fi ; \
+	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
+endef
+
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
@@ -680,15 +698,19 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
+define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+endef
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
-define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-	$(TOOLCHAIN_EXTERNAL_INSTALL_CORE)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
+	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
