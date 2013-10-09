From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 14:29:38 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: convert to the
	package infrastructure
Message-ID: <20131009143428.8771A9B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9934630fae4c4649eeb15a8235a810cb9d18038c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit converts the toolchain-buildroot logic to the package
infrastructure. The package is fairly simple as it only defines
BUILDROOT_LIBC, and depends on host-gcc-final to get the overall
internal toolchain build logic started.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot.mk                   |    9 ---------
 .../toolchain-buildroot/toolchain-buildroot.mk     |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

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
index 0000000..ced430e
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
+# Trigerring the build of the host-gcc-final will automatically do the
+# build of binutils, uClibc, kernel headers and all the intermediate
+# gcc steps.
+
+TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
+
+$(eval $(generic-package))
