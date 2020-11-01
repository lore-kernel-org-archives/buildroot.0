From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2020 10:52:43 +0100
Subject: [Buildroot] [git commit] package/uhd: fix build with ARM without
 NEON
Message-ID: <20201101094102.BEAFD86968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b07de37540ee34e4e5fa8586ecc40da1586cd940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UHD has two issues with ARM:
1/ NEON_SIMD_ENABLE is always enabled when architecture is ARM. But NEON isn't
   necessarily support in the CPU
2/ when NEON is supported -mfpu=neon must be passed to the compiler (not
   automatically done by UHD)

Fixes:
- http://autobuild.buildroot.net/results/2519bd075b8c021b440677297b32f16b1c3cc3dd/
- http://autobuild.buildroot.net/results/99d9979be4f37c42390c87b1afd4cd33bac07f5e/
- http://autobuild.buildroot.net/results/cabc7a87ee869d6bac7d092c1a4fcfcdac22a96e/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uhd/uhd.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index ec0ec03e9f..adb7579019 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -38,6 +38,17 @@ UHD_CONF_OPTS = \
 	-DENABLE_UTILS=OFF \
 	-DENABLE_X300=OFF
 
+# As soon as architecture is ARM, uhd will try to use NEON.
+# But not all ARM cores have NEON support.
+# When CPU support NEON -mfpu=neon must be added to CXX_FLAGS
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+UHD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -mfpu=neon"
+UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=ON
+else
+UHD_CONF_OPTS += -Dhave_mfpu_neon=0
+UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 UHD_DEPENDENCIES += orc
 endif
