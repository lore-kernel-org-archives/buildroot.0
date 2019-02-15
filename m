From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Feb 2019 22:05:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/i2pd: link with libatomic when
 needed
Message-ID: <20190215210559.25660-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/515160349b11f06a090f3e13992e30da9a402c17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 3df1f9bafb..96ba6a805c 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -21,6 +21,10 @@ I2PD_CONF_OPTS += -DWITH_GUI=OFF
 # build failure when cross-compiling.
 I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 I2PD_CONF_OPTS += -DWITH_STATIC=ON
 else
-- 
2.14.1
