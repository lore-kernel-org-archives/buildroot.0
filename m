From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:22:52 +0100
Subject: [Buildroot] [git commit] systemd: enable build for supported
	architectures.
Message-ID: <20140329092307.02B349C415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db7ad00586bd1c9b9d98396dda9c428d7b5c1dd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd only supports the architectures defined in
src/shared/architecture.h. So via a new parameter named
BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS, we enable the build of this package
only for those architectures.

Fixes http://autobuild.buildroot.net/results/bcc/bcce95eb0748505c0d62db21a6e420aae3c3181b/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in |    9 ++++++++-
 system/Config.in          |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 838e13e..095fee0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,7 +1,14 @@
+config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	bool
+	# see src/shared/architecture.h
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
+		BR2_aarch64 || BR2_m68k
+
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_INET_IPV6
diff --git a/system/Config.in b/system/Config.in
index e8f1ed6..8ff8d49 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -87,7 +87,7 @@ config BR2_INIT_SYSV
 
 config BR2_INIT_SYSTEMD
 	bool "systemd"
-	depends on !BR2_avr32 # no epoll_create1
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
