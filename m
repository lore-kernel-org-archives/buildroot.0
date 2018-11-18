From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 22:12:33 +0100
Subject: [Buildroot] [git commit] package/xen: Bump Xen to 4.11.0 and
 backport a fix
Message-ID: <20181118211452.3E09D83A24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=906903ce4a87a57d028cce7edf62b58648d8bb72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the Xen package to the latest release and backport a fix from the
Xen master brach.

This fixes autobuilder issue:
http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6/

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch | 37 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch b/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
new file mode 100644
index 0000000000..db2bbe8363
--- /dev/null
+++ b/package/xen/0003-libxl-arm-Fix-build-on-arm64-acpi-w-gcc-8.2.patch
@@ -0,0 +1,37 @@
+From c8993743d611ed23ebded3168ac3ac6ff3e5d2fa Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Thu, 16 Aug 2018 13:22:41 -0700
+Subject: [PATCH] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
+
+Add zero-padding to #defined ACPI table strings that are copied.
+Provides sufficient characters to satisfy the length required to
+fully populate the destination and prevent array-bounds warnings.
+Add BUILD_BUG_ON sizeof checks for compile-time length checking.
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/libxl/libxl_arm_acpi.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
+index 636f724039..eeca1def06 100644
+--- a/tools/libxl/libxl_arm_acpi.c
++++ b/tools/libxl/libxl_arm_acpi.c
+@@ -48,9 +48,9 @@ extern const unsigned char dsdt_anycpu_arm[];
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
+-- 
+2.17.1
+
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 1b3fc12f94..376013eb7a 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5a944a34e47e9d52b2837f616821eb4a9514c8fd0955dcc723111dba499acd4 xen-4.10.2.tar.gz
+sha256 826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643 xen-4.11.0.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index fb34d64c3f..8d7b92eadc 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.10.2
+XEN_VERSION = 4.11.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
