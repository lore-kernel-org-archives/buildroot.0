From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:33 -0300
Subject: [Buildroot] [PATCH 08/36] check-package: enable for fs/
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The filesystem types can benefit from this script to prevent common
mistakes when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the fs/ directory.
Ignore fs/common.mk as it declares a package infra and not a package itself.
Register the ROOTFS_ as a valid prefix for variables.
Ignore these symbols:
 - PACKAGES_PERMISSIONS_TABLE: defined either by packages through
   pkg-generic or by filesystem types, used by fs/common.mk;
 - SUMTOOL: defined by package mtd, used by filesystem jffs2;
 - TARGETS_ROOTFS: defined by filesystem types, used in the main
   Makefile.
But do not ignore this symbol:
 - UBINIZE_CONFIG_FILE_PATH: it is used only inside the file that
   defines it.

Keep using loose checks that warn about common mistakes while keep the
code simple.
As a consequence the check functions do not differentiate between
packages and filesystems so the symbol PACKAGE_UBI would not generate a
warning for the ubi filesystem neither the symbol ROOTFS_MTD would
generate a warning for the mtd package. But those kind of mistakes are
not common and are obvious in the code review, unlike typos i.e.
ROOTFS_UBl or PACKAGE_MID that would be hard to see in the code review.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/check-package             | 2 ++
 utils/checkpackagelib/lib_mk.py | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 48ce956443..4c9eea0534 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -48,11 +48,13 @@ CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
 DO_CHECK_INTREE = re.compile("|".join([
     "arch/",
     "boot/",
+    "fs/",
     "package/",
     "system/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile("|".join([
     "boot/barebox/barebox\.mk$",
+    "fs/common\.mk$",
     "package/doc-asciidoc\.mk$",
     "package/pkg-\S*\.mk$",
     ]))
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 2df2e1a884..1bec67bc2b 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -165,8 +165,11 @@ class TypoInPackageVariable(_CheckFunction):
         "LUA_RUN",
         "MKFS_JFFS2",
         "MKIMAGE_ARCH",
+        "PACKAGES_PERMISSIONS_TABLE",
         "PKG_CONFIG_HOST_BINARY",
+        "SUMTOOL",
         "TARGET_FINALIZE_HOOKS",
+        "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
     PACKAGE_NAME = re.compile("/([^/]+)\.mk")
     VARIABLE = re.compile("^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
@@ -177,7 +180,7 @@ class TypoInPackageVariable(_CheckFunction):
         # linux tools do not use LINUX_TOOL_ prefix for variables
         package = package.replace("LINUX_TOOL_", "")
         self.package = package
-        self.REGEX = re.compile("^(HOST_)?({}_[A-Z0-9_]+)".format(package))
+        self.REGEX = re.compile("^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
             "^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
-- 
2.14.1
