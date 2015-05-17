From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 20:43:47 +0200
Subject: [Buildroot] [git commit] qt: do not allow webkit with SuperH
	Sourcery toolchain
Message-ID: <20150517190414.B5A3080E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68167055154d9a550cb1de85456ecd47d0c6c529
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building webkit with the SuperH Sourcery toolchain fails with an
assertion in binutils, so let's not allow to select webkit with this
toolchain. We do not need to worry about reverse dependencies, since
we use the existing BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbol to add
this new dependency.

Fixes:

  http://autobuild.buildroot.net/results/508cdeb67f272b61209f331ab7b990cb56f30817/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 67d5561..306fe1f 100644
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
