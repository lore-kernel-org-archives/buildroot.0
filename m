From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] package/xen: bump to version 4.12.1
Message-ID: <20190903133617.63DE58A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32e9dad7d2e5372ff7aafaae9716a145d6daf183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 14 ++--
 ...bxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch | 37 ----------
 ...-make-32-bit-gcc-8-1-non-debug-build-work.patch | 79 ----------------------
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 5 files changed, 9 insertions(+), 125 deletions(-)

diff --git a/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
index 0d4e581af6..fb316739b4 100644
--- a/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
+++ b/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
@@ -1,4 +1,4 @@
-From 2a310549aaeaba05f640ade43488bb893101ce4a Mon Sep 17 00:00:00 2001
+From 8aea14bbd20b04b8fffaf35138ebdcbd39e433a3 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sat, 29 Oct 2016 16:35:26 +0200
 Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
@@ -19,18 +19,18 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/xen/Rules.mk b/xen/Rules.mk
-index a9fda71..09ccbfa 100644
+index 3090ea7828..d535bf9e2f 100644
 --- a/xen/Rules.mk
 +++ b/xen/Rules.mk
-@@ -49,7 +49,7 @@ ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
- CFLAGS += -nostdinc -fno-builtin -fno-common
- CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
- CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+@@ -61,7 +61,7 @@ CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+ $(call cc-option-add,CFLAGS,CC,-Wvla)
+ CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+ CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 -CFLAGS += '-D__OBJECT_FILE__="$@"'
 +CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
  
  ifneq ($(clang),y)
  # Clang doesn't understand this command line argument, and doesn't appear to
 -- 
-2.7.4
+2.22.0
 
diff --git a/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch b/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
deleted file mode 100644
index db2bbe8363..0000000000
--- a/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c8993743d611ed23ebded3168ac3ac6ff3e5d2fa Mon Sep 17 00:00:00 2001
-From: Christopher Clark <christopher.w.clark@gmail.com>
-Date: Thu, 16 Aug 2018 13:22:41 -0700
-Subject: [PATCH] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
-
-Add zero-padding to #defined ACPI table strings that are copied.
-Provides sufficient characters to satisfy the length required to
-fully populate the destination and prevent array-bounds warnings.
-Add BUILD_BUG_ON sizeof checks for compile-time length checking.
-
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
----
- tools/libxl/libxl_arm_acpi.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
-index 636f724039..eeca1def06 100644
---- a/tools/libxl/libxl_arm_acpi.c
-+++ b/tools/libxl/libxl_arm_acpi.c
-@@ -48,9 +48,9 @@ extern const unsigned char dsdt_anycpu_arm[];
- _hidden
- extern const int dsdt_anycpu_arm_len;
- 
--#define ACPI_OEM_ID "Xen"
--#define ACPI_OEM_TABLE_ID "ARM"
--#define ACPI_ASL_COMPILER_ID "XL"
-+#define ACPI_OEM_ID "Xen\0\0"
-+#define ACPI_OEM_TABLE_ID "ARM\0\0\0\0"
-+#define ACPI_ASL_COMPILER_ID "XL\0"
- 
- enum {
-     RSDP,
--- 
-2.17.1
-
diff --git a/package/xen/0004-xenpmd-make-32-bit-gcc-8-1-non-debug-build-work.patch b/package/xen/0004-xenpmd-make-32-bit-gcc-8-1-non-debug-build-work.patch
deleted file mode 100644
index 9c51c554cd..0000000000
--- a/package/xen/0004-xenpmd-make-32-bit-gcc-8-1-non-debug-build-work.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From e75c9dc85fdeeeda0b98d8cd8d784e0508c3ffb8 Mon Sep 17 00:00:00 2001
-From: Wei Liu <wei.liu2@citrix.com>
-Date: Thu, 26 Jul 2018 15:58:54 +0100
-Subject: [PATCH] xenpmd: make 32 bit gcc 8.1 non-debug build work
-
-32 bit gcc 8.1 non-debug build yields:
-
-xenpmd.c:354:23: error: '%02x' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Werror=format-truncation=]
-     snprintf(val, 3, "%02x",
-                       ^~~~
-xenpmd.c:354:22: note: directive argument in the range [40, 2147483778]
-     snprintf(val, 3, "%02x",
-                      ^~~~~~
-xenpmd.c:354:5: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
-     snprintf(val, 3, "%02x",
-     ^~~~~~~~~~~~~~~~~~~~~~~~
-              (unsigned int)(9*4 +
-              ~~~~~~~~~~~~~~~~~~~~
-                             strlen(info->model_number) +
-                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-                             strlen(info->serial_number) +
-                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-                             strlen(info->battery_type) +
-                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-                             strlen(info->oem_info) + 4));
-                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-All info->* used in calculation are 32 bytes long, and the parsing
-code makes sure they are null-terminated, so the end result of the
-expression won't exceed 255, which should be able to be fit into 3
-bytes in hexadecimal format.
-
-Add an assertion to make gcc happy.
-
-Signed-off-by: Wei Liu <wei.liu2@citrix.com>
-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/xen-project/xen/commit/e75c9dc85fdeeeda0b98d8cd8d784e0508c3ffb8]
----
- tools/xenpmd/xenpmd.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
-index 56412a9a81c..1c801caa712 100644
---- a/tools/xenpmd/xenpmd.c
-+++ b/tools/xenpmd/xenpmd.c
-@@ -40,6 +40,7 @@
- #include <unistd.h>
- #include <sys/stat.h>
- #include <xenstore.h>
-+#include <assert.h>
- 
- /* #define RUN_STANDALONE */
- #define RUN_IN_SIMULATE_MODE
-@@ -345,18 +346,17 @@ void write_ulong_lsb_first(char *temp_val, unsigned long val)
- void write_battery_info_to_xenstore(struct battery_info *info)
- {
-     char val[1024], string_info[256];
-+    unsigned int len;
- 
-     xs_mkdir(xs, XBT_NULL, "/pm");
-    
-     memset(val, 0, 1024);
-     memset(string_info, 0, 256);
-     /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators */
--    snprintf(val, 3, "%02x", 
--             (unsigned int)(9*4 +
--                            strlen(info->model_number) +
--                            strlen(info->serial_number) +
--                            strlen(info->battery_type) +
--                            strlen(info->oem_info) + 4));
-+    len = 9 * 4 + strlen(info->model_number) + strlen(info->serial_number) +
-+          strlen(info->battery_type) + strlen(info->oem_info) + 4;
-+    assert(len < 255);
-+    snprintf(val, 3, "%02x", len);
-     write_ulong_lsb_first(val+2, info->present);
-     write_ulong_lsb_first(val+10, info->design_capacity);
-     write_ulong_lsb_first(val+18, info->last_full_capacity);
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index d4232f592e..a15bc7d852 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3f9217f5a7cc240a06f3a03db8c29605d69a64d98330c426611ba5c2ee08b5d8 xen-4.11.2.tar.gz
+sha256 5450a85497b84167df1d229b3ab98fb24ef4d6b0510dce522798c13c1b090159 xen-4.12.1.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index bd8a39f639..b0dc2dfe4c 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.11.2
+XEN_VERSION = 4.12.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
