From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2016 20:20:23 +0100
Subject: [Buildroot] [PATCH 2/5] toolchain-external: remove unused
	calculation of ARCH_SUBDIR
In-Reply-To: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1455304826-10557-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

In TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS, ARCH_SUBDIR is calculated but not
used, and can thus be removed. Since SYSROOT_DIR is only used for the
calculation of ARCH_SUBDIR, it can be removed too.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ffdee49..9d88158 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -587,12 +587,7 @@ endef
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
@@ -601,7 +596,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
-- 
2.4.10
