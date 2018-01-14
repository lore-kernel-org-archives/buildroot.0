From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 15:16:58 +0100
Subject: [Buildroot] [PATCH 02/17] tests: add test for post-fakeroot script
In-Reply-To: <cover.1515939400.git.yann.morin.1998@free.fr>
References: <cover.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <878bd9ac6569877450e28861cb047a93c1550eb9.1515939400.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, only post-build and post-image scripts were tested, each with
their own test-script.

The two test-scripts only differ in the name of the log file they
create, and it is based on the name of the script, so it is easy to
share the script.

This allows us to easily re-use it for testing post-fakeroot scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/testing/tests/core/post-build.sh        |  2 +-
 support/testing/tests/core/post-fakeroot.sh     |  1 +
 support/testing/tests/core/post-image.sh        | 13 +------------
 support/testing/tests/core/test_post_scripts.py |  4 ++++
 4 files changed, 7 insertions(+), 13 deletions(-)
 create mode 120000 support/testing/tests/core/post-fakeroot.sh
 mode change 100755 => 120000 support/testing/tests/core/post-image.sh

diff --git a/support/testing/tests/core/post-build.sh b/support/testing/tests/core/post-build.sh
index b1fb834bc5..f3d0dbe511 100755
--- a/support/testing/tests/core/post-build.sh
+++ b/support/testing/tests/core/post-build.sh
@@ -9,4 +9,4 @@ printf "HOST_DIR,%s\n" "${HOST_DIR}"
 printf "STAGING_DIR,%s\n" "${STAGING_DIR}"
 printf "BINARIES_DIR,%s\n" "${BINARIES_DIR}"
 printf "BR2_CONFIG,%s\n" "${BR2_CONFIG}"
-) > ${BUILD_DIR}/post-build.log
+) > ${BUILD_DIR}/$(basename "${0}" .sh).log
diff --git a/support/testing/tests/core/post-fakeroot.sh b/support/testing/tests/core/post-fakeroot.sh
new file mode 120000
index 0000000000..d680fccafc
--- /dev/null
+++ b/support/testing/tests/core/post-fakeroot.sh
@@ -0,0 +1 @@
+post-build.sh
\ No newline at end of file
diff --git a/support/testing/tests/core/post-image.sh b/support/testing/tests/core/post-image.sh
deleted file mode 100755
index 1c2a0f2c89..0000000000
--- a/support/testing/tests/core/post-image.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-(
-printf "arg1,%s\n" "${1}"
-printf "arg2,%s\n" "${2}"
-printf "arg3,%s\n" "${3}"
-printf "TARGET_DIR,%s\n" "${TARGET_DIR}"
-printf "BUILD_DIR,%s\n" "${BUILD_DIR}"
-printf "HOST_DIR,%s\n" "${HOST_DIR}"
-printf "STAGING_DIR,%s\n" "${STAGING_DIR}"
-printf "BINARIES_DIR,%s\n" "${BINARIES_DIR}"
-printf "BR2_CONFIG,%s\n" "${BR2_CONFIG}"
-) > ${BUILD_DIR}/post-image.log
diff --git a/support/testing/tests/core/post-image.sh b/support/testing/tests/core/post-image.sh
new file mode 120000
index 0000000000..d680fccafc
--- /dev/null
+++ b/support/testing/tests/core/post-image.sh
@@ -0,0 +1 @@
+post-build.sh
\ No newline at end of file
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index 1db568b0d6..edb339d8c4 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -11,9 +11,11 @@ class TestPostScripts(infra.basetest.BRTest):
         BR2_SYSTEM_BIN_SH_NONE=y
         # BR2_PACKAGE_BUSYBOX is not set
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_FAKEROOT_SCRIPT="{}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
         """.format(infra.filepath("tests/core/post-build.sh"),
+                   infra.filepath("tests/core/post-fakeroot.sh"),
                    infra.filepath("tests/core/post-image.sh"))
 
     def check_post_log_file(self, path, what):
@@ -37,5 +39,7 @@ class TestPostScripts(infra.basetest.BRTest):
     def test_run(self):
         f = os.path.join(self.builddir, "build", "post-build.log")
         self.check_post_log_file(f, "target")
+        f = os.path.join(self.builddir, "build", "post-fakeroot.log")
+        self.check_post_log_file(f, "target")
         f = os.path.join(self.builddir, "build", "post-image.log")
         self.check_post_log_file(f, "images")
-- 
2.14.1
