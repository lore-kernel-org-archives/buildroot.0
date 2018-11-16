From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 10:57:40 -0600
Subject: [Buildroot] [PATCH v2 2/3] package/xen: libxl/arm: Fix build on
 arm64
In-Reply-To: <1542387461-26373-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542387461-26373-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542387461-26373-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add zero-padding to #defined ACPI table strings that are copied.
Provides sufficient characters to satisfy the length required to
fully populate the destination and prevent array-bounds warnings.
Add BUILD_BUG_ON sizeof checks for compile-time length checking.

Origin:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/plain/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch

Upstream post:
https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01726.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Bug found while fixing:
http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6/

v1 -> v2
 - Re-generated patch on upstream clone of 4.10.2 and included SOF

---
 package/xen/0005-arm-acpi-fix-string-lengths.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/xen/0005-arm-acpi-fix-string-lengths.patch

diff --git a/package/xen/0005-arm-acpi-fix-string-lengths.patch b/package/xen/0005-arm-acpi-fix-string-lengths.patch
new file mode 100644
index 0000000..6a1e0a8
--- /dev/null
+++ b/package/xen/0005-arm-acpi-fix-string-lengths.patch
@@ -0,0 +1,72 @@
+From 09fd70da9418bb94e7f13a817e99a5a66ec117eb Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Thu, 16 Aug 2018 13:04:52 -0700
+Subject: [PATCH] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
+
+[modified for Xen 4.11 to add required: #include <xen-tools/libs.h>]
+
+Add zero-padding to #defined ACPI table strings that are copied.
+Provides sufficient characters to satisfy the length required to
+fully populate the destination and prevent array-bounds warnings.
+Add BUILD_BUG_ON sizeof checks for compile-time length checking.
+
+Origin:
+http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/plain/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ tools/libxl/libxl_arm_acpi.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
+index 636f724..8924396 100644
+--- a/tools/libxl/libxl_arm_acpi.c
++++ b/tools/libxl/libxl_arm_acpi.c
+@@ -29,6 +29,7 @@ typedef int64_t s64;
+ 
+ #include <acpi/acconfig.h>
+ #include <acpi/actbl.h>
++#include <xen-tools/libs.h>
+ 
+ #ifndef BITS_PER_LONG
+ #ifdef _LP64
+@@ -48,9 +49,9 @@ extern const unsigned char dsdt_anycpu_arm[];
+ _hidden
+ extern const int dsdt_anycpu_arm_len;
+ 
+-#define ACPI_OEM_ID "Xen"
+-#define ACPI_OEM_TABLE_ID "ARM"
+-#define ACPI_ASL_COMPILER_ID "XL"
++#define ACPI_OEM_ID "Xen\0\0"
++#define ACPI_OEM_TABLE_ID "ARM\0\0\0\0"
++#define ACPI_ASL_COMPILER_ID "XL\0"
+ 
+ enum {
+     RSDP,
+@@ -190,6 +191,7 @@ static void make_acpi_rsdp(libxl__gc *gc, struct xc_dom_image *dom,
+     struct acpi_table_rsdp *rsdp = (void *)dom->acpi_modules[0].data + offset;
+ 
+     memcpy(rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
++    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(rsdp->oem_id));
+     memcpy(rsdp->oem_id, ACPI_OEM_ID, sizeof(rsdp->oem_id));
+     rsdp->length = acpitables[RSDP].size;
+     rsdp->revision = 0x02;
+@@ -205,9 +207,12 @@ static void make_acpi_header(struct acpi_table_header *h, const char *sig,
+     memcpy(h->signature, sig, 4);
+     h->length = len;
+     h->revision = rev;
++    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(h->oem_id));
+     memcpy(h->oem_id, ACPI_OEM_ID, sizeof(h->oem_id));
++    BUILD_BUG_ON(sizeof(ACPI_OEM_TABLE_ID) != sizeof(h->oem_table_id));
+     memcpy(h->oem_table_id, ACPI_OEM_TABLE_ID, sizeof(h->oem_table_id));
+     h->oem_revision = 0;
++    BUILD_BUG_ON(sizeof(ACPI_ASL_COMPILER_ID) != sizeof(h->asl_compiler_id));
+     memcpy(h->asl_compiler_id, ACPI_ASL_COMPILER_ID,
+            sizeof(h->asl_compiler_id));
+     h->asl_compiler_revision = 0;
+-- 
+1.9.1
+
-- 
1.9.1
