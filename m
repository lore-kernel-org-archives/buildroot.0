From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  5 May 2015 19:18:24 +0300
Subject: [Buildroot] [PATCH v2] arch/Config.in.xtensa: provide BR2_ENDIAN
	symbol
Message-ID: <1430842704-28771-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages get hints from the buildroot at configure time, e.g.
ac_cv_c_bigendian=yes/no. This particular hint is based on the value of
BR2_ENDIAN and when it doesn't match actual toolchain endiannes the
build may break.
Provide BR2_ENDIAN for xtensa to fix this sort of build errors.

Fixes:
  http://autobuild.buildroot.net/results/31115fe8d88f52d77ed0f2da769eb8896a1b34a2/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- add spaces between configure items;
- expand changelog.

 arch/Config.in.xtensa | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index ff71e0b..0687319 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -33,6 +33,23 @@ config BR2_XTENSA_OVERLAY_DIR
 	  configurations. They are provided by the processor vendor or
 	  directly from Tensilica.
 
+choice
+	prompt "Target Architecture Endianness"
+	depends on BR2_XTENSA_CUSTOM
+	default BR2_XTENSA_LITTLE_ENDIAN
+
+config BR2_XTENSA_LITTLE_ENDIAN
+	bool "Little endian"
+
+config BR2_XTENSA_BIG_ENDIAN
+	bool "Big endian"
+
+endchoice
+
+config BR2_ENDIAN
+	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
+	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
+
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
 
-- 
1.8.1.4
