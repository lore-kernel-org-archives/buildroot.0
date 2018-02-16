From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:08 -0800
Subject: [Buildroot] [RFC 2/6] system/Config.in: add configuration options
 for 32-bit library support
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-3-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support 32-bit shared libraries in a 64-bit root file
system, we need several configuration options that let us tell
buildroot which libraries to put where.

Specifically, we introduce the following:

BR2_ROOTFS_LIB_DIR
------------------

Tells buildroot where to put the main system libraries. On 32-bit
setups, this will mean 32-bit libraries. On 64-bit setups, this
setting will apply to 64-bit libraries. Typical values for
BR2_ROOTFS_LIB_DIR are "lib", "lib32" or "lib64".

The default value for 32-bit setups is "lib". For 64-bit setups it is
"lib64".

BR2_ROOTFS_LIB32_DIR
--------------------

This tells buildroot where to put 32-bit libraries on a 64-bit system.
Typical values for BR2_ROOTFS_LIB32_DIR are "lib" or "lib32". The
default value is "lib".

On 32-bit setups, this variable is not available. On 64-bit systems
with 32-bit support disabled, this variable will not be used.

BR2_ROOTFS_RUNTIME32
--------------------

Tells buildroot whether it should install 32-bit shared libraries into
a 64-bit root file system. If set to false, the root file system will
not be able to support 32-bit binaries.

This variable is not available on 32-bit setups.

BR2_ROOTFS_RUNTIME32_PATH
-------------------------

Points to the sys-root of a 32-bit toolchain for the current 64-bit
architecture (i.e. an ARM sys-root on AArch64 or MIPS32 on MIPS64).

This path is used to copy all 32-bit shared libraries from the 32-bit
sys-root into the buildroot staging area. From there, they will be
included into the root file system. Care is taken that 32-bit libraries
will not interfere with 64-bit libraries already in staging.

We need the ability to specify a separate sys-root for 32-bit, because
the 64-bit sys-root may not include 32-bit libraries.

This variable is not available on 32-bit setups.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 system/Config.in | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index d48cf8d8c4ed..1e9415ae6f6d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -24,6 +24,40 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 
 endchoice
 
+config BR2_ROOTFS_LIB_DIR
+	string "Name of system library directories (e.g. lib or lib64)"
+	default "lib64" if BR2_ARCH_IS_64
+	default "lib"
+	help
+	  The name of the directories where system libraries live. This will
+	  most often be "lib", "lib32" or "lib64". This name will be used in
+	  the root directory (e.g. /lib64) as well as the /usr directory (e.g.
+	  /usr/lib64).
+
+if BR2_ARCH_IS_64
+
+config BR2_ROOTFS_LIB32_DIR
+	string "Name of directory for 32-bit libraries (e.g. lib or lib32)"
+	default "lib"
+	help
+	  The name of the directories where 32-bit libraries live. This will
+	  most often be "lib" or "lib32". This name will be used in the root
+	  directory (e.g. /lib) as well as the /usr directory (e.g. /usr/lib).
+
+config BR2_ROOTFS_RUNTIME32
+	bool "Install 32-bit runtime on 64-bit system"
+	help
+	  Install 32-bit libraries and the 32-bit shared library loader on a
+	  64-bit system, so it is possible to execute 32-bit applications.
+
+config BR2_ROOTFS_RUNTIME32_PATH
+	string "Path to the 32-bit run-time"
+	help
+	  Specifies the path to the 32-bit run-time that should be copied into
+	  the root file system.
+
+endif
+
 if BR2_ROOTFS_SKELETON_CUSTOM
 
 config BR2_ROOTFS_SKELETON_CUSTOM_PATH
-- 
2.7.4
