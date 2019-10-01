From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 30 Sep 2019 22:36:54 -0300
Subject: [Buildroot] [PATCH v2 2/2] toolchain: install gdbinit under
 TARGET_DIR
In-Reply-To: <20191001013654.22298-1-unixmania@gmail.com>
References: <20191001013654.22298-1-unixmania@gmail.com>
Message-ID: <20191001013654.22298-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Now that binaries are stripped only in the root filesystem we can use
TARGET_DIR as sysroot in gdb, instead of STAGING dir. Install gdbinit
at target/usr/share/buildroot but exclude it from the root filesystem
since it's required only at the host side.

Update the documentation accordingly.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Ciro Santilli <ciro.santilli@gmail.com>
---
 docs/manual/quickstart.txt                            |  5 +++--
 docs/manual/using-buildroot-debugger.txt              | 11 +++++++----
 fs/common.mk                                          |  1 +
 toolchain/helpers.mk                                  |  4 ++--
 .../toolchain-external/pkg-toolchain-external.mk      |  4 ++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 74158ae249..d2e48b4540 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -108,8 +108,9 @@ This directory contains several subdirectories:
   use the tarball image generated in +images/+ and extract it as
   root. Compared to +staging/+, +target/+ contains only the files and
   libraries needed to run the selected target applications: the
-  development files (headers, etc.) are not present, the binaries are
-  stripped.
+  development files (headers, etc.) are not present. The binaries are stripped
+  in the generation of the root filesystem but are left unstripped in
+  +target/+.
 
 * +host/+ contains the installation of tools compiled for the host
   that are needed for the proper execution of Buildroot, including the
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index d5293beb53..599f9f77d1 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -35,15 +35,18 @@ Then, on the host, you should start the cross gdb using the following
 command line:
 
 ----------------------------
-<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/target/usr/share/buildroot/gdbinit foo
 ----------------------------
 
 Of course, +foo+ must be available in the current directory, built
 with debugging symbols. Typically you start this command from the
-directory where +foo+ is built (and not from +output/target/+ as the
-binaries in that directory are stripped).
+directory where +foo+ is built or from from +output/target/+, as in
 
-The +<buildroot>/output/staging/usr/share/buildroot/gdbinit+ file will tell the
+----------------------------
+<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/target/usr/share/buildroot/gdbinit output/target/usr/bib/foo
+----------------------------
+
+The +<buildroot>/output/target/usr/share/buildroot/gdbinit+ file will tell the
 cross gdb where to find the libraries of the target.
 
 Finally, to connect to the target from the cross gdb:
diff --git a/fs/common.mk b/fs/common.mk
index caa7825cbb..612baffca2 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,6 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
 	rsync -auH \
 		--exclude=/$$(notdir $$(TARGET_DIR_WARNING_FILE)) \
+		--exclude=/usr/share/buildroot \
 		$$(BASE_TARGET_DIR)/ \
 		$$(TARGET_DIR)
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6a4f7223c8..4ee3ba3e99 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -458,8 +458,8 @@ check_toolchain_ssp = \
 # Generate gdbinit file for use with Buildroot
 #
 gen_gdbinit_file = \
-	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	mkdir -p $(TARGET_DIR)/usr/share/buildroot/ ; \
+	echo "set sysroot $(TARGET_DIR)" > $(TARGET_DIR)/usr/share/buildroot/gdbinit
 
 # Given a path, determine the relative prefix (../) needed to return to the
 # root level. Note that the last component is treated as a file component; use a
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c00211d59c..613e170855 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -469,7 +469,7 @@ endef
 #
 # Generate gdbinit file for use with Buildroot
 #
-define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBINIT
 	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
 		$(call MESSAGE,"Installing gdbinit"); \
 		$(gen_gdbinit_file); \
@@ -569,7 +569,6 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
-	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
 # Even though we're installing things in both the staging, the host
@@ -579,6 +578,7 @@ define $(2)_INSTALL_TARGET_CMDS
 	$$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBINIT)
 	$$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
-- 
2.18.1
