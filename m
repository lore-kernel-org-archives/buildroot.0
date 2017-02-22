From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 22 Feb 2017 19:31:05 +0100
Subject: [Buildroot] [PATCH v2] qt5: disable qt-5.8.0 support for arc,
	nios2 and xtensa
Message-ID: <20170222183105.27503-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1], [2], [3]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/ce6/ce6f506f610434dff1d0eb64644be0200d7c52f6
[2] http://autobuild.buildroot.net/results/fda/fda8a5165cc599adfa4b3cb012916fa4dc38aeca
[3] http://autobuild.buildroot.net/results/779/779fd562c28f3a47f9caea7d0e0cb1dcda7fe489

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - optimized arc test !BR2_arc (suggested by Thomas Petazzoni)
---
 package/qt5/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8de248139..4bcbc6ef5 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -39,6 +39,8 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
+	# no built-in double-conversion support
+	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
 	  This option builds Qt 5.8, which is licensed under
 	  (L)GPLv3+.
@@ -46,6 +48,7 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 
 config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "LTS (5.6)"
-- 
2.11.0
