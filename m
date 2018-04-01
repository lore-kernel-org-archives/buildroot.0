From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:54:07 +0200
Subject: [Buildroot] [git commit] check-package: enable for linux/
Message-ID: <20180401070907.E20677F8E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d39f5876deac7c8406db69585e0dd69e85222c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This directory can benefit from this script to prevent common mistakes
when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the linux/ directory.
Ignore missing LINUX_EXT_ prefix as the variables for linux extensions
do not use it.
Ignore this symbol:
 - LINUX_EXTENSIONS: defined by each linux extension, used by
   linux/linux.mk.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package             | 1 +
 utils/checkpackagelib/lib_mk.py | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 4c9eea0534..a5f5dc44c0 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -49,6 +49,7 @@ DO_CHECK_INTREE = re.compile("|".join([
     "arch/",
     "boot/",
     "fs/",
+    "linux/",
     "package/",
     "system/",
     ]))
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 58de4fd3cb..9989556e95 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -160,6 +160,7 @@ class TypoInPackageVariable(_CheckFunction):
         "ACLOCAL_HOST_DIR",
         "BR_CCACHE_INITIAL_SETUP",
         "BR_NO_CHECK_HASH_FOR",
+        "LINUX_EXTENSIONS",
         "LINUX_POST_PATCH_HOOKS",
         "LINUX_TOOLS",
         "LUA_RUN",
@@ -179,6 +180,8 @@ class TypoInPackageVariable(_CheckFunction):
         package = package.replace("-", "_").upper()
         # linux tools do not use LINUX_TOOL_ prefix for variables
         package = package.replace("LINUX_TOOL_", "")
+        # linux extensions do not use LINUX_EXT_ prefix for variables
+        package = package.replace("LINUX_EXT_", "")
         self.package = package
         self.REGEX = re.compile("^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
