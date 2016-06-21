From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 16:46:06 +0100
Subject: [Buildroot] [PATCH v2] efivar: disable for some incompatible
	Sourcery CodeBench toolchains
Message-ID: <1466523966-5343-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4, and we
have a patch to handle that situation. However, some Sourcery CodeBench
toolchains use 4.4 kernel headers but don't have that header file
renamed, and that is causing build failures. So, prevent this package
to be built using those toolchains.

Fixes:

  http://autobuild.buildroot.net/results/66c/66cf68261fa73c2366610f8d14bd02180ba7cd2d/
  http://autobuild.buildroot.net/results/54c/54cc7d4e3b284b35931e08f9c7f0f902df96a989/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - also disable for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 - amend the commit log and the comment in Config.in accordingly

 package/efivar/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index c507584..e9c1e95 100644
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
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS &&
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.7.3
