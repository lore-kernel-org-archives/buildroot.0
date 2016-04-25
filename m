From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 21:56:34 +0200
Subject: [Buildroot] [git commit] toolchain-external: blackfin: install
	FDPIC libraries also to staging
Message-ID: <20160425211729.6823B81E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38040b2e1f25e17b94a9ac33dc09fc728ef46381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For external Blackfin toolchains with BR2_BFIN_INSTALL_FDPIC_SHARED set,
the FDPIC shared libraries are currently only copied to the target
directory, not to staging.

For debugging purposes, an unstripped copy in staging is necessary.
Moreover, this change will simplify a subsequent change that lines up the
location of shared libraries between target and staging directories.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 66ba23a..ef16da1 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -680,6 +680,20 @@ endef
 # nonetheless requested the installation of the FDPIC libraries to the
 # target filesystem.
 ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...") ; \
+	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	FDPIC_SUPPORT_LIB_DIR="" ; \
+	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
+	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
+	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
+	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
+	        fi ; \
+	fi ; \
+	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
+endef
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
@@ -779,6 +793,7 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
@@ -795,3 +810,4 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
+
