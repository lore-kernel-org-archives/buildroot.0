From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:30:20 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove unused
	calculation of ARCH_SUBDIR
Message-ID: <20160421213028.18A2881E80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4896b7c96fa67ea55d4f5dfdea2f5187eb46c554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS, ARCH_SUBDIR is calculated but not
used, and can thus be removed. Since SYSROOT_DIR is only used for the
calculation of ARCH_SUBDIR, it can be removed too.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ff4ae5e..66ba23a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -617,12 +617,7 @@ endef
 #                       to the target filesystem.
 
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	if test -z "$${SYSROOT_DIR}" ; then \
-		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
-		exit 1 ; \
-	fi ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
@@ -631,7 +626,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
