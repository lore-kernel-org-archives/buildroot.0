From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 28 Mar 2014 17:31:06 +0100
Subject: [Buildroot] [PATCH] systemd: enable build for supported
	architectures.
In-Reply-To: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1396024266-6662-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd only supports the architectures defined in
src/shared/architecture.h. So via a new parameter named
BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS, we enable the build of this package
only for those architectures.

Fixes http://autobuild.buildroot.net/results/bcc/bcce95eb0748505c0d62db21a6e420aae3c3181b/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
index 54aac11..0a00188 100644
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
-- 
1.7.9.5
