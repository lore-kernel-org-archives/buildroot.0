From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:06:51 +0200
Subject: [Buildroot] [git commit] package/systemd-bootchart: add
 BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
Message-ID: <20190415220247.F0E8D8E9AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c3089c8a7fdd0e39a990ba6bb8de48e06682863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit f93596d8ba82354efb545fe91449627e6c896ce1, systemd is
enabled on arc however systemd-bootchart is not available on this
architecture so add a BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS from
the information retrieved in src/architecture.h

Fixes:
 - http://autobuild.buildroot.org/results/84fb51212abf99faa2b7a46b8c44c42a3ca1201c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd-bootchart/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
index 8deb6b9b7b..9af13db1f4 100644
--- a/package/systemd-bootchart/Config.in
+++ b/package/systemd-bootchart/Config.in
@@ -1,5 +1,18 @@
+config BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
+	bool
+	# see src/architecture.h
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
+
 config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	bool "systemd-bootchart"
+	depends on BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
 	depends on BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	help
@@ -22,5 +35,6 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
 
 comment "systemd-bootchart needs a toolchain w/ headers >= 3.17"
+	depends on BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
