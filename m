From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 14:13:32 +0100
Subject: [Buildroot] [PATCH v3,
 1/1] package/i2pd: fix static build with atomic
Message-ID: <20191227131332.539681-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use HAVE_CXX_ATOMICS_WITHOUT_LIB and HAVE_CXX_ATOMICS64_WITHOUT_LIB
variables to tell i2pd to check for atomic library and add it in
$(REQUIRED_LIBRARIES) if needed

Fixes:
 - http://autobuild.buildroot.org/results/dfffe21fab65b3fc81f449004a6771fd00efbc57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Add missing backslash

Changes v1 -> v2 (after review of Thomas Petazzoni and Arnout
Vandecappelle):
 - Use i2pd variables instead of CMAKE_REQUIRED_LIBRARIES

 package/i2pd/i2pd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index de975d66a4..a064057f1f 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -22,7 +22,9 @@ I2PD_CONF_OPTS += -DWITH_GUI=OFF
 I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+I2PD_CONF_OPTS += \
+	-DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF \
+	-DHAVE_CXX_ATOMICS64_WITHOUT_LIB=OFF
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.24.0
