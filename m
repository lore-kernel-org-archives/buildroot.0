From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:31 +0200
Subject: [Buildroot] [PATCH 4/8] external toolchain: more documentation
	about the principles
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0afd2103f0dab1b86896890446e8999c72cef465.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |   31 ++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 4cd4f2d..0e1deb6 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -1,4 +1,35 @@
 #
+# This file implements the support for external toolchains, i.e
+# toolchains that have not been produced by Buildroot itself and that
+# are already available on the system on which Buildroot runs.
+#
+# The basic principle is the following
+#
+#  1. Perform some checks on the conformity between the toolchain
+#  configuration described in the Buildroot menuconfig system, and the
+#  real configuration of the external toolchain. This is for example
+#  important to make sure that the Buildroot configuration system
+#  knows whether the toolchain supports RPC, IPv6, locales, large
+#  files, etc. Unfortunately, these things cannot be detected
+#  automatically, since the value of these options (such as
+#  BR2_INET_RPC) are needed at configuration time because these
+#  options are used as dependencies for other options. And at
+#  configuration time, we are not able to retrieve the external
+#  toolchain configuration.
+#
+#  2. Copy the libraries needed at runtime to the target directory,
+#  $(TARGET_DIR). Obviously, things such as the C library, the dynamic
+#  loader and a few other utility libraries are needed if dynamic
+#  applications are to be executed on the target system.
+#
+#  3. Copy the libraries and headers to the staging directory. This
+#  will allow all further calls to gcc to be made using --sysroot
+#  $(STAGING_DIR), which greatly simplifies the compilation of the
+#  packages when using external toolchains. So in the end, only the
+#  cross-compiler binaries remains external, all libraries and headers
+#  are imported into the Buildroot tree.
+
+#
 # Copy a toolchain library and its symbolic links from the sysroot
 # directory to the target directory. Also optionaly strips the
 # library.
-- 
1.6.0.4
