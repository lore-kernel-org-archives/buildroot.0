From: Julien Olivain <ju.o@free.fr>
Date: Fri, 13 Nov 2020 14:09:41 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/linux-backports: bump version to
 5.8
In-Reply-To: <20201113130941.67928-1-ju.o@free.fr>
References: <20201112120155.333290-1-ju.o@free.fr>
 <20201113130941.67928-1-ju.o@free.fr>
Message-ID: <20201113130941.67928-2-ju.o@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempting to compile this package with newer Kernel version (e.g. v5.4)
fails with message:

   Generating local configuration database from kernel ...Kernel version parse failed!

Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
rather old and beat the very purpose of having newer drivers in older
kernels.

Since backports tag v4.14-rc4-1, the requirement on minimal kernel
version changed from 3.0 to 3.10. See commit [1]. The minimal kernel
version check is changed accordingly.

License files are also updated: the linux backports package copies the
license files from the kernel version used for its generation. v5.8 is now
"GPL-2.0 WITH Linux-syscall-note".

[1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v2 -> v3:
  - Update kernel version check for 3.10 minimal version
  - Update all references to 3.0 to 3.10 (Config.in, .mk)
  - Update license files and checksums

Changes v1 -> v2:
  - Add a note about the change in minimal kernel version (3.0 -> 3.10).
---
 package/linux-backports/Config.in            |  2 +-
 package/linux-backports/linux-backports.hash |  8 +++++---
 package/linux-backports/linux-backports.mk   | 21 ++++++++++++--------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
index 362e6e4bc7..251d202fd2 100644
--- a/package/linux-backports/Config.in
+++ b/package/linux-backports/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LINUX_BACKPORTS
 	  recent kernels, backported to older ones.
 
 	  This version of linux-backports supports kernels starting
-	  from 3.0.
+	  from 3.10.
 
 	  https://backports.wiki.kernel.org
 
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index f39bc2ed27..3e103424f5 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,4 +1,6 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/sha256sums.asc
-sha256  a979e194c2ed9fdfca092a448e626d85c5af0e4de5ad993c0967afd15af01285  backports-4.4.2-1.tar.xz
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
+sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
 # Locally computed
-sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 1827ee18b7..1e054c7969 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
+LINUX_BACKPORTS_VERSION_MAJOR = 5.8
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
-LINUX_BACKPORTS_LICENSE = GPL-2.0
-LINUX_BACKPORTS_LICENSE_FILES = COPYING
+LINUX_BACKPORTS_LICENSE = GPL-2.0 WITH Linux-syscall-note
+LINUX_BACKPORTS_LICENSE_FILES = \
+	COPYING \
+	LICENSES/exceptions/Linux-syscall-note \
+	LICENSES/preferred/GPL-2.0
 
 # flex and bison are needed to generate kconfig parser. We use the
 # same logic as the linux kernel (we add host dependencies only if
@@ -91,7 +94,7 @@ $(eval $(kconfig-package))
 # instead.
 #
 # Furthermore, we want to check the kernel version, since linux-backports
-# only supports kernels >= 3.0. To avoid overriding linux-backports'
+# only supports kernels >= 3.10. To avoid overriding linux-backports'
 # KCONFIG_STAMP_DOTCONFIG rule defined in the kconfig-package infra, we
 # use an intermediate stamp-file.
 #
@@ -103,10 +106,12 @@ $(LINUX_BACKPORTS_DIR)/$(LINUX_BACKPORTS_KCONFIG_STAMP_DOTCONFIG): $(LINUX_BACKP
 
 .SECONDEXPANSION:
 $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/$$(LINUX_KCONFIG_STAMP_DOTCONFIG)
-	$(Q)LINUX_VERSION_PROBED=$(LINUX_VERSION_PROBED); \
-	if [ $${LINUX_VERSION_PROBED%%.*} -lt 3 ]; then \
-		printf "Linux version '%s' is too old for linux-backports (needs 3.0 or later)\n" \
-			"$${LINUX_VERSION_PROBED}"; \
+	$(Q)KVER=$(LINUX_VERSION_PROBED); \
+	KVER_MAJOR=`echo $${KVER} | sed 's/^\([0-9]*\)\..*/\1/'`; \
+	KVER_MINOR=`echo $${KVER} | sed 's/^[0-9]*\.\([0-9]*\).*/\1/'`; \
+	if [ $${KVER_MAJOR} -lt 3 -o \( $${KVER_MAJOR} -eq 3 -a $${KVER_MINOR} -lt 10 \) ]; then \
+		printf "Linux version '%s' is too old for linux-backports (needs 3.10 or later)\n" \
+			"$${KVER}"; \
 		exit 1; \
 	fi
 	$(Q)touch $(@)
-- 
2.28.0
