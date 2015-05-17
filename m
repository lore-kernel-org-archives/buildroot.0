From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 16:15:38 +0200
Subject: [Buildroot] [PATCH 1/3] qt: do not allow webkit with SuperH
	Sourcery toolchain
Message-ID: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building webkit with the SuperH Sourcery toolchain fails with an
assertion in binutils, so let's not allow to select webkit with this
toolchain. We do not need to worry about reverse dependencies, since
we use the existing BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbol to add
this new dependency.

Fixes:

  http://autobuild.buildroot.net/results/508cdeb67f272b61209f331ab7b990cb56f30817/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 43f5a0f..ceab91b 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -412,8 +412,11 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
-		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
+	# The CodeSourcery SuperH toolchain fails to build Webkit,
+	# with an assertion failure in binutils.
+	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
-- 
2.1.0
