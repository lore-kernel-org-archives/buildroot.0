From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:10:24 +0200
Subject: [Buildroot] [git commit] trinity: refactor dependencies using
	BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
Message-ID: <20161022141233.775D9817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a076414af9bf81c24da11d0f1d1a5bff8b1ba94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to avoid duplicating architecture dependencies in the trinity
Config.in file, this commit introduces a
BR2_PACKAGE_TRINITY_ARCH_SUPPORTS Config.in variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/Config.in | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 02cd20a..4a31ba0 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -1,18 +1,20 @@
-config BR2_PACKAGE_TRINITY
-	bool "trinity"
+config BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
+	bool
+	default y
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_USES_MUSL # FTW_ACTIONRETVAL
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sparc || BR2_x86_64
+
+config BR2_PACKAGE_TRINITY
+	bool "trinity"
+	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # FTW_ACTIONRETVAL
 	help
 	  A Linux System call fuzz tester
 
 	  http://codemonkey.org.uk/projects/trinity/
 
 comment "trinity needs a uClibc or glibc toolchain"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_sparc || BR2_x86_64
