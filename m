From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:03:21 +0200
Subject: [Buildroot] [PATCHv3 10/14] gcc: create symbolic link to ld-linux
	in EABIhf/gcc 4.7/eglibc
In-Reply-To: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373961805-3901-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using eglibc, the ld-linux loader is installed as
ld-linux-armhf.so.3, but gcc 4.7.x was not yet updated, and generates
binaries that reference ld-linux.so.3. This was fixed starting with
gcc 4.8.x. In order to be able to use gcc 4.7, we create the
appropriate symbolic link.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0db2eaa..b89b2b7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -90,6 +90,18 @@ endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
 
+# In gcc 4.7.x, the ARM EABIhf library loader path for eglibc was not
+# correct, so we create a symbolic link to make things work
+# properly. eglibc installs the library loader as ld-linux-armhf.so.3,
+# but gcc creates binaries that reference ld-linux.so.3.
+ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),yyyy)
+define HOST_GCC_FINAL_LD_LINUX_LINK
+	ln -sf ld-linux-armhf.so.3 $(TARGET_DIR)/lib/ld-linux.so.3
+	ln -sf ld-linux-armhf.so.3 $(STAGING_DIR)/lib/ld-linux.so.3
+endef
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_LD_LINUX_LINK
+endif
+
 # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
 # libgcc_s to be installed in /lib and not /usr/lib. We add +x on
 # libgcc_s to ensure it will be stripped.
-- 
1.8.1.2
