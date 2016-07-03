From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  3 Jul 2016 16:20:36 +0200
Subject: [Buildroot] [PACH v3] efivar: disable for some incompatible
	Sourcery CodeBench toolchains
Message-ID: <1467555636-17085-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4, and we
have a patch to handle that situation. However, some Sourcery CodeBench
toolchains use 4.4 kernel headers but don't have that header file
renamed, and that is causing build failures. So, prevent this package
to be built using those toolchains.

Fixes:

  http://autobuild.buildroot.net/results/66c/66cf68261fa73c2366610f8d14bd02180ba7cd2d/
  http://autobuild.buildroot.net/results/54c/54cc7d4e3b284b35931e08f9c7f0f902df96a989/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Romain:
  - add back slash on line breaks
  - propagate efivar dependencies to efibootmgr
  - add comments dependencies]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efibootmgr/Config.in |  4 ++++
 package/efivar/Config.in     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 9e501f6..2c5c07f 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # efivar
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # efivar
 	select BR2_PACKAGE_EFIVAR
 	help
 	  A Linux user-space application to modify the Intel Extensible
@@ -16,3 +18,5 @@ comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \\
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 5342fa4..d595107 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,6 +1,14 @@
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
+	# and we have a patch to handle that situation. However, some
+	# Sourcery CodeBench toolchains use 4.4 kernel headers but they
+	# don't have that header file renamed, and that is causing build
+	# failures. So, prevent this package to be built using those
+	# toolchains.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -15,3 +23,5 @@ comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-- 
2.5.5
