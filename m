From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat,  8 Feb 2014 16:54:31 -0500
Subject: [Buildroot] [PATCH] qemu: add host/target Linux version check
Message-ID: <1391896471-28299-1-git-send-email-fhunleth@troodon-software.com>
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
 package/qemu/qemu.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 093ae64..bd6f555 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -74,6 +74,24 @@ define HOST_QEMU_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_QEMU_LINUX_VERSION_CHECK
+	host_version_parts=`uname -r | sed 's/\-.*//g' | sed 's/\./ /g'` ;\
+	host_version_code=0 ;\
+	multiplier=65536 ;\
+	for host_version_part in $$host_version_parts; do \
+		host_version_code=`echo "$$host_version_code + $$host_version_part * $$multiplier" | bc` ;\
+		multiplier=`echo "$$multiplier / 256" | bc` ;\
+	done ;\
+	target_version_code=`grep LINUX_VERSION_CODE $(STAGING_DIR)/usr/include/linux/version.h | awk '{print $$3}'` ;\
+	if test $$host_version_code -lt $$target_version_code ; then \
+		echo "Refusing to install qemu-user since the target Linux version is newer" ;\
+		echo "than the host's. Missing system calls will fail." ;\
+		exit 1 ;\
+	fi
+endef
+
+HOST_QEMU_POST_BUILD_HOOKS += HOST_QEMU_LINUX_VERSION_CHECK
+
 $(eval $(host-autotools-package))
 
 # variable used by other packages
-- 
1.8.3.2
