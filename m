From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 22:22:54 +0100
Subject: [Buildroot] [git commit] glibc: add 2.19 as a supported version
Message-ID: <20140228133412.149309BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6762e427dbf0e17177211dfcf72034cdc70f663d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.19 has been released recently
(https://sourceware.org/ml/libc-alpha/2014-02/msg00224.html). This
commit allows to build a toolchain with this new version. In order to
allow this, we add a version selection that did not exist for
glibc. We default to 2.18, which was the only supported version until
now, and add an option for 2.19.

For microblaze, which uses a specific glibc version, the version
selection choice is not displayed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in                 |   21 +++++++++++++++++++++
 package/glibc/glibc.mk                  |    2 +-
 toolchain/toolchain-buildroot/Config.in |    2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
new file mode 100644
index 0000000..a92b5ea
--- /dev/null
+++ b/package/glibc/Config.in
@@ -0,0 +1,21 @@
+if BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+choice
+	prompt "glibc version"
+	default BR2_GLIBC_VERSION_2_18
+	# Architectures supported in mainline glibc
+	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
+		   BR2_x86_64
+
+config BR2_GLIBC_VERSION_2_18
+       bool "2.18"
+
+config BR2_GLIBC_VERSION_2_19
+       bool "2.19"
+
+endchoice
+
+endif
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 96de02a..89eaaf6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -21,7 +21,7 @@ GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
 else
-GLIBC_VERSION = 2.18
+GLIBC_VERSION = $(if $(BR2_GLIBC_VERSION_2_19),2.19,2.18)
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cd88889..eb5ee46 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -70,7 +70,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 source "package/uclibc/Config.in"
-
+source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
 source "package/elf2flt/Config.in.host"
