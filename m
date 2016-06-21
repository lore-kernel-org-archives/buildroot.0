From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 15:28:51 +0100
Subject: [Buildroot] [PATCH] efivar: disable for MIPS Sourcery CodeBench
	toolchain
Message-ID: <1466519331-42289-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4, and we
have a patch to handle that situation. However, MIPS Sourcery CodeBench
toolchain uses 4.4 kernel headers but doesn't have that header file
renamed, and that is causing a build failure. So, prevent this package
to be built using that toolchain.

Fixes:

  http://autobuild.buildroot.net/results/66c/66cf68261fa73c2366610f8d14bd02180ba7cd2d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/efivar/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index c507584..7cf2c14 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,6 +1,13 @@
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
+	# and we have a patch to handle that situation. However, MIPS
+	# Sourcery CodeBench toolchain uses 4.4 kernel headers but
+	# doesn't have that header file renamed, and that is causing a
+	# build failure. So, prevent this package to be built using that
+	# toolchain.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.7.3
