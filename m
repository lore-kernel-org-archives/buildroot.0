From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Aug 2018 18:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: link with libatomic when needed
Message-ID: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
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
 - http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cutelyst/cutelyst.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index e8695a7b3a..1f1a5249be 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -16,6 +16,10 @@ CUTELYST_CONF_OPTS += \
 	-DPLUGIN_CSRFPROTECTION=ON \
 	-DPLUGIN_VIEW_GRANTLEE=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CUTELYST_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
 CUTELYST_DEPENDENCIES += libpwquality
-- 
2.14.1
