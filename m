From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:04:47 +0100
Subject: [Buildroot] [git commit branch/next] fdk-aac: refactor architecture
	dependency as a blind option
Message-ID: <20161107205049.C733A7FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b60aca590b6ea9b1ef4400b986631548195e6d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation to the addition of a fdk-aac GStreamer plugin that will
have to select the fdk-aac package (and therefore inherits its
dependencies), this commits adds a BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
blind option to avoid duplicating the architecture dependencies of
this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fdk-aac/Config.in | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 9e18d22..f51c5ab 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -1,11 +1,14 @@
+# These are the architectures supported by FDK AAC
+config BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_powerpc || BR2_sh
+
 config BR2_PACKAGE_FDK_AAC
 	bool "fdk-aac"
+	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	# These are the architectures supported by FDK AAC
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh
-
 	help
 	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
 	  is software that implements the MPEG Advanced Audio Coding ("AAC")
@@ -14,7 +17,5 @@ config BR2_PACKAGE_FDK_AAC
 	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
 
 comment "fdk-aac needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh
