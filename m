From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 18:49:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As shown recently by the firejail example, it is easy to miss that a
package builds and installs binaries without actually cross-compiling
them: they are built for the host architecture instead of the target
architecture.

This commit adds a small helper script, check-bin-arch, called from
the main Makefile as a TARGET_FINALIZE_HOOKS, to verify that all ELF
binaries have been built for the correct CPU architecture.

Example output with the firejail package enabled, when building for an
ARM target:

support/scripts/check-bin-arch .../buildroot/output/target .../buildroot/output/host/usr/bin/arm-linux-gnueabihf- "ARM"
ERROR: .../buildroot/output/target/usr/bin/firemon architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/bin/firejail architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/bin/firecfg architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/lib/firejail/libconnect.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/lib/firejail/faudit architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/lib/firejail/ftee architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/lib/firejail/libtrace.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
ERROR: .../buildroot/output/target/usr/lib/firejail/libtracelog.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
Makefile:665: recipe for target 'target-finalize' failed
make[1]: *** [target-finalize] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Following Yann E. Morin's comment, restrict the check to bin, lib,
   sbin, usr/bin, usr/lib and usr/sbin, in order to avoid matching
   firmware files that could use the ELF format but be targeted for
   other architectures.
---
 Makefile                       | 10 ++++++++++
 support/scripts/check-bin-arch | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100755 support/scripts/check-bin-arch

diff --git a/Makefile b/Makefile
index fb2c235..3cb1f7a 100644
--- a/Makefile
+++ b/Makefile
@@ -649,6 +649,16 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+READELF_ARCH_NAME = $(call qstrip,$(BR2_READELF_ARCH_NAME))
+
+ifneq ($(READELF_ARCH_NAME),)
+define CHECK_BIN_ARCH
+	support/scripts/check-bin-arch $(TARGET_DIR) \
+		$(TARGET_CROSS) "$(READELF_ARCH_NAME)"
+endef
+TARGET_FINALIZE_HOOKS += CHECK_BIN_ARCH
+endif
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
new file mode 100755
index 0000000..cb29ded
--- /dev/null
+++ b/support/scripts/check-bin-arch
@@ -0,0 +1,33 @@
+#!/bin/bash
+
+# This script looks at all files in the target filesystem, and for
+# those that are ELF files, verifies that they have been built for the
+# correct architecture.
+
+TARGET_DIR=$1
+TARGET_CROSS=$2
+READELF_ARCH_NAME=$3
+
+exitcode=0
+
+# In order to avoid matching firmware files that could have the ELF
+# format, but for other architectures, we only look in bin, lib, sbin,
+# usr/bin, usr/lib and usr/sbin
+for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do
+    # Skip non-ELF files
+    if ! file -b ${f} | grep -q "ELF " ; then
+	continue
+    fi
+
+    # Get architecture using readelf
+    farchname=$(${TARGET_CROSS}readelf -h ${f} | \
+		       grep '^  Machine:' | \
+		       sed 's/^  Machine: *\(.*\)/\1/')
+
+    if test "${farchname}" != "${READELF_ARCH_NAME}" ; then
+	echo "ERROR: ${f} architecture is '${farchname}', should be '${READELF_ARCH_NAME}'"
+	exitcode=1
+    fi
+done
+
+exit ${exitcode}
-- 
2.7.4
