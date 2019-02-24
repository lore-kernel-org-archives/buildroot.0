From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 22:02:32 +0100
Subject: [Buildroot] [git commit] package/i2pd: link with libatomic when
 needed
Message-ID: <20190224210032.DE68A8E1CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88bf61b2934c00aeff12346c2d7dc45b9ab9cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/515160349b11f06a090f3e13992e30da9a402c17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/i2pd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index a92d513159..3ce5f97fb8 100644
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
