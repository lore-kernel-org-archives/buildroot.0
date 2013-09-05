From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:44 +0200
Subject: [Buildroot] [RFCv1 06/11] toolchain-buildroot: convert to the
	package infrastructure
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit converts the toolchain-buildroot logic to the package
infrastructure. The package is fairly simple as it only defines
BUILDROOT_LIBC, and depends on host-gcc-final to get the overall
internal toolchain build logic started.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot.mk                     |  9 ---------
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)
 delete mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-buildroot/toolchain-buildroot.mk

diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
deleted file mode 100644
index 3a05800..0000000
--- a/toolchain/toolchain-buildroot.mk
+++ /dev/null
@@ -1,9 +0,0 @@
-# Triggerring the build of the host-gcc-final will automaticaly do the
-# build of binutils, uClibc, kernel headers and all the intermediate
-# gcc steps.
-
-include toolchain/helpers.mk
-
-BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
-
-toolchain-buildroot: host-gcc-final
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
new file mode 100644
index 0000000..096a196
--- /dev/null
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# toolchain-buildroot
+#
+################################################################################
+
+TOOLCHAIN_BUILDROOT_SOURCE =
+
+BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
+
+# Triggerring the build of the host-gcc-final will automaticaly do the
+# build of binutils, uClibc, kernel headers and all the intermediate
+# gcc steps.
+
+TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
+
+$(eval $(generic-package))
-- 
1.8.1.2
