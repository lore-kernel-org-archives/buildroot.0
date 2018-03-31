From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:40 -0300
Subject: [Buildroot] [PATCH 15/36] check-package: enable for toolchain/
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-16-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain directory can benefit from this script to prevent common
mistakes when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the toolchain/ directory.
Accept toolchain-common.in as a valid Config.in name.
Ignore this symbol:
 - BR_LIBC: defined by the buildroot toolchain, used by gcc-final.mk.
But do not ignore this symbol:
 - GCONV_LIBS: it is used only inside the file that defines it.

Ignore toolchain/toolchain-external/pkg-toolchain-external.mk as it
declares a package infra and not a package itself.
Ignore toolchain/helpers.mk as it contains only helper functions.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 utils/check-package             | 5 ++++-
 utils/checkpackagelib/lib_mk.py | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index a5f5dc44c0..35a4a70858 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -44,7 +44,7 @@ def parse_args():
     return parser.parse_args()
 
 
-CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
+CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")
 DO_CHECK_INTREE = re.compile("|".join([
     "arch/",
     "boot/",
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
index 1248457ef2..25e0b65c7f 100644
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
