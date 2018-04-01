From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:29 -0300
Subject: [Buildroot] [PATCH v2 16/37] check-package: enable for toolchain/
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-17-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - rebase after toolchain-common.in was merged to Config.in;
  - remove spurious info from commit log (I first created the series
    changing the check-package and then fixing the package files; when I
    rebased to allow partial apply of the series, the info "do not
    ignore this symbol" became obsolete since it is fixed in a previous
    patch);
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
-- 
2.14.1
