From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:09:01 +0200
Subject: [Buildroot] [git commit] check-package: enable for toolchain/
Message-ID: <20180401070908.15835814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc8dce467bd12e43317d5dd0f180b1bb11c0cc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain directory can benefit from this script to prevent common
mistakes when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the toolchain/ directory.
Ignore this symbol:
 - BR_LIBC: defined by the buildroot toolchain, used by gcc-final.mk.

Ignore toolchain/toolchain-external/pkg-toolchain-external.mk as it
declares a package infra and not a package itself.
Ignore toolchain/helpers.mk as it contains only helper functions.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package             | 3 +++
 utils/checkpackagelib/lib_mk.py | 1 +
 2 files changed, 4 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index a5f5dc44c0..dd3a4bb7e8 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -52,12 +52,15 @@ DO_CHECK_INTREE = re.compile("|".join([
     "linux/",
     "package/",
     "system/",
+    "toolchain/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile("|".join([
     "boot/barebox/barebox\.mk$",
     "fs/common\.mk$",
     "package/doc-asciidoc\.mk$",
     "package/pkg-\S*\.mk$",
+    "toolchain/helpers\.mk$",
+    "toolchain/toolchain-external/pkg-toolchain-external\.mk$",
     ]))
 
 
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 9989556e95..86e9aa2d97 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -159,6 +159,7 @@ class TypoInPackageVariable(_CheckFunction):
         "ACLOCAL_DIR",
         "ACLOCAL_HOST_DIR",
         "BR_CCACHE_INITIAL_SETUP",
+        "BR_LIBC",
         "BR_NO_CHECK_HASH_FOR",
         "LINUX_EXTENSIONS",
         "LINUX_POST_PATCH_HOOKS",
