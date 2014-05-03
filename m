From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 03 May 2014 16:09:52 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] toolchain: generate a gdbinit file
In-Reply-To: <patchbomb.1399126191@argentina>
References: <patchbomb.1399126191@argentina>
Message-ID: <27dc1ac8ec611337e29f.1399126192@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit slightly improves the external toolchain backend, and the
gdb build logic to create a file named
$(STAGING_DIR)/usr/share/buildroot/gdbinit which can be used as a
gdbinit file using gdb -x option. This allows gdb to automatically use
the proper sysroot to find libraries.

The initial insight for this patch comes from the report of Oded
Hanson <OHanson@xsightsys.com>, who found an issue with the Eclipse
Buildroot plugin, which was setting a solib-path in gdb, but not a
sysroot. Setting a solib-path was enough to find shared libraries, but
not the dynamic linker. And since Eclipse doesn't allow to set the
sysroot in any other way than giving a gdbinit file, it makes sense to
have Buildroot generate a gdbinit file (which can be used in other
situations than Eclipse).

To achieve this, this commit introduces a gen_gdbinit_file helper in
toolchain/helpers.mk, and uses it for the internal toolchain and
external toolchain backends.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[ThomasDS: minor updates in commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/gdb/gdb.mk                                 | 2 ++
 toolchain/helpers.mk                               | 7 +++++++
 toolchain/toolchain-external/toolchain-external.mk | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -126,5 +126,7 @@ endef
 
 HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
 
+HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -355,3 +355,10 @@ check_unusable_toolchain = \
 		echo "such as Buildroot." ; \
 		exit 1 ; \
 	fi
+
+#
+# Generate gdbinit file for use with Buildroot
+#
+gen_gdbinit_file = \
+	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
+	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -651,6 +651,12 @@ define TOOLCHAIN_EXTERNAL_SANITIZE_KERNE
 		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
 endef
 
+define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+	if test -f $(TARGET_CROSS)gdb ; then \
+		$(call gen_gdbinit_file) ; \
+	fi
+endef
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
@@ -659,6 +665,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGIN
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
 $(eval $(generic-package))
