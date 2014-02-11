From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 10 Feb 2014 22:06:48 -0500
Subject: [Buildroot] [PATCH v2] qemu: add host/target Linux version check
Message-ID: <1392088008-9268-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raise an error if the host is using an older kernel than the target.
Since qemu-user passes emulated system calls to the host kernel,
this prevents usage of qemu-user in situations where those system
calls will fail.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Add `uname -s` check that the host is Linux
  - Change bc arithmetic to shell arithmetic
  - Add toolchain dependency to make sure version.h is present
  - Clean up grep/awk
  - Switch check from post build to pre-configure hook
  - Update error text some

 package/qemu/qemu.mk | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 093ae64..e488f42 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman toolchain
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -74,6 +74,29 @@ define HOST_QEMU_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_QEMU_LINUX_VERSION_CHECK
+	if test `uname -s` != Linux ; then \
+		echo "qemu-user requires a Linux host." ;\
+		exit 1 ;\
+	fi ;\
+	host_version_parts=`uname -r | sed 's/\-.*//g' | sed 's/\./ /g'` ;\
+	host_version_code=0 ;\
+	multiplier=65536 ;\
+	for host_version_part in $$host_version_parts; do \
+		host_version_code=$$((host_version_code + host_version_part*multiplier)) ;\
+		multiplier=$$((multiplier/256)) ;\
+	done ;\
+	target_version_code=`awk '/LINUX_VERSION_CODE/ {print $$3}' $(STAGING_DIR)/usr/include/linux/version.h` ;\
+	if test $$host_version_code -lt $$target_version_code ; then \
+		echo "Refusing to build qemu-user since the target Linux version is newer" ;\
+		echo "than the host's. Running target binaries on this system will fail if" ;\
+		echo "the binaries invoke system calls missing on the host." ;\
+		exit 1 ;\
+	fi
+endef
+
+HOST_QEMU_PRE_CONFIGURE_HOOKS += HOST_QEMU_LINUX_VERSION_CHECK
+
 $(eval $(host-autotools-package))
 
 # variable used by other packages
-- 
1.8.3.2
