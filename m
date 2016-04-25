From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:05:45 +0200
Subject: [Buildroot] [git commit] toolchain-external: extract installation
	of gdbserver to separate define
Message-ID: <20160425211729.745177FF24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e905f83dd4aebdea4c51ccbe4260f5adc6748c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation of the gdbserver binary has no relation to the installation
of the target libraries. Moving it to a separate define improves the
understandability of the code and makes later refactoring easier.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[Thomas:
 - move the BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY condition as a make
   condition rather than a shell condition, as suggested by Romain
   Naour.
 - rename the TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER variable to
   TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 40 +++++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ef16da1..d989e5e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -634,26 +634,31 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
-		$(call MESSAGE,"Copying gdbserver") ; \
-		gdbserver_found=0 ; \
-		for d in $${ARCH_SYSROOT_DIR}/usr \
-			 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
-			 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
-			 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
-			if test -f $${d}/bin/gdbserver ; then \
-				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
-				gdbserver_found=1 ; \
-				break ; \
-			fi ; \
-		done ; \
-		if [ $${gdbserver_found} -eq 0 ] ; then \
-			echo "Could not find gdbserver in external toolchain" ; \
-			exit 1 ; \
+	fi
+endef
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
+	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(call MESSAGE,"Copying gdbserver") ; \
+	gdbserver_found=0 ; \
+	for d in $${ARCH_SYSROOT_DIR}/usr \
+		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
+		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+		 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
+		if test -f $${d}/bin/gdbserver ; then \
+			install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+			gdbserver_found=1 ; \
+			break ; \
 		fi ; \
+	done ; \
+	if [ $${gdbserver_found} -eq 0 ] ; then \
+		echo "Could not find gdbserver in external toolchain" ; \
+		exit 1 ; \
 	fi
 endef
+endif
 
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
@@ -804,6 +809,7 @@ endef
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
