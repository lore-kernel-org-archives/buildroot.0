From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:24:58 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/sdbusplus: needs
 C++17
Message-ID: <20200407181139.41D58825FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a62d51f7e61e72c7633f97a303ccfb21c879208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

sdbusplus needs C++17 since
https://github.com/openbmc/sdbusplus/commit/ca46b9d2e958d1e4b392265f656f782899c2de1d

This is not needed for host-sdbusplus as libsdbusplus is disabled on
host through --disable-libsdbusplus

Fixes:
 - http://autobuild.buildroot.org/results/65a4652e5b419f03ace109c4b3738e9b997cdabe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: John Faith <jfaith@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d127c5e4eafe828160b980f79630040bae7c9b95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdbusplus/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sdbusplus/Config.in b/package/sdbusplus/Config.in
index e278d17156..c66203c463 100644
--- a/package/sdbusplus/Config.in
+++ b/package/sdbusplus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SDBUSPLUS
 	bool "sdbusplus"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  A C++ library for sd-bus with a bindings and doc generator.
 
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SDBUSPLUS
 
 	  https://github.com/openbmc/sdbusplus
 
-comment "sdbusplus needs systemd and a toolchain w/ C++"
-	depends on !BR2_PACKAGE_SYSTEMD || !BR2_INSTALL_LIBSTDCPP
+comment "sdbusplus needs systemd and a toolchain w/ C++, gcc >= 7"
+	depends on !BR2_PACKAGE_SYSTEMD || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
