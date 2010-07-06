From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: create
	lib64 symlinks if needed
Message-ID: <20100706060218.0DACC825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e774eb0c9d75d4d86c25cd45e5728e80e92b8ff0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
target and staging directories. This is needed for some 64 bits
toolchains such as the Crosstool-NG toolchains, for which the path to
the dynamic loader and other libraries is /lib64, but the libraries
are stored in /lib.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/external-toolchain/ext-tool.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index a181f25..d5a64b5 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -133,6 +133,19 @@ copy_toolchain_sysroot = \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
 #
+# Create lib64 -> lib and usr/lib64 -> usr/lib symbolic links in the
+# target and staging directories. This is needed for some 64 bits
+# toolchains such as the Crosstool-NG toolchains, for which the path
+# to the dynamic loader and other libraries is /lib64, but the
+# libraries are stored in /lib.
+#
+create_lib64_symlinks = \
+	(cd $(TARGET_DIR) ;      ln -s lib lib64) ; \
+	(cd $(TARGET_DIR)/usr ;  ln -s lib lib64) ; \
+	(cd $(STAGING_DIR) ;     ln -s lib lib64) ; \
+	(cd $(STAGING_DIR)/usr ; ln -s lib lib64)
+
+#
 # Check the availability of a particular glibc feature. We assume that
 # all Buildroot toolchain options are supported by glibc, so we just
 # check that they are enabled.
@@ -319,4 +332,8 @@ endif
 	done
 	@echo "Copy external toolchain sysroot to staging..."
 	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR),$(ARCH_SYSROOT_DIR),$(ARCH_SUBDIR))
+	# Create lib64 symbolic links if needed
+	$(Q)if [ -L $(ARCH_SYSROOT_DIR)/lib64 ] ; then \
+		$(call create_lib64_symlinks) ; \
+	fi
 	@touch $@
-- 
1.7.1
