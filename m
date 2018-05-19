From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:55:02 +0200
Subject: [Buildroot] [PATCH 2/2] ltrace: fix visibility of Config.in comment
In-Reply-To: <20180519205502.23746-1-thomas.petazzoni@bootlin.com>
References: <20180519205502.23746-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180519205502.23746-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_LTRACE option has some architecture dependencies, but
those architecture dependencies are not taken into account for the
Config.in comment.

To fix this, this commit introduces a BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
hidden boolean that gets used by both the BR2_PACKAGE_LTRACE option
and the Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltrace/Config.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 3a46b6a4f6..2defbe28a0 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,10 +1,20 @@
+config BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_powerpc
+	default y if BR2_sparc
+	default y if BR2_x86_64
+	default y if BR2_xtensa
+
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
-		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
+	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	select BR2_PACKAGE_ELFUTILS
 	help
 	  Debugging program which runs a specified command until it
@@ -15,5 +25,6 @@ config BR2_PACKAGE_LTRACE
 	  http://ltrace.org
 
 comment "ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-- 
2.14.3
