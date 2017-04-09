From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 09:57:44 +0200
Subject: [Buildroot] [git commit] pkg-stats: also parse toolchain packages
Message-ID: <20170409075804.C7869821DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0274ae8b56e95206a5c3e62686a8c809d08dd01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index aab49d1..4cf1f82 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -91,7 +91,7 @@ packages_without_hash_file=0
 total_patch_count=0
 cnt=0
 
-for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
+for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
 
     if test \
 	$i = "boot/common.mk" -o \
@@ -121,7 +121,12 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/pkg-generic.mk" -o \
 	$i = "package/pkg-waf.mk" -o \
 	$i = "package/pkg-kernel-module.mk" -o \
-	$i = "package/pkg-utils.mk" ; then
+	$i = "package/pkg-utils.mk" -o \
+	$i = "toolchain/toolchain-external/pkg-toolchain-external.mk" -o \
+	$i = "toolchain/toolchain-external/toolchain-external.mk" -o \
+	$i = "toolchain/toolchain.mk" -o \
+	$i = "toolchain/helpers.mk" -o \
+	$i = "toolchain/toolchain-wrapper.mk" ; then
 	echo "skipping $i" 1>&2
 	continue
     fi
@@ -218,6 +223,11 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hastarget=1
     fi
 
+    if grep -E "\(toolchain-external-package\)" $i > /dev/null ; then
+	infratype="toolchain-external"
+	hastarget=1
+    fi
+
     pkg=$(basename $i)
     dir=$(dirname $i)
     pkg=${pkg%.mk}
