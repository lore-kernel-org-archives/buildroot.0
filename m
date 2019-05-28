From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 May 2019 14:27:19 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/sqlite: work around build timeout
Message-ID: <20190528122720.43203-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version 4.9 build hangs due to a bug discovered for
Gcc 4.9 only. Since Gcc 4.9 is not maintaned anymore it doesn't make
sense to report this bug in Gcc bugzilla and use
BR2_TOOLCHAIN_HAS_GCC_BUG_. So let's check if we're building for
Microblaze with Gcc version < 5.x and work around the bug forcing the
use of -O0.

To reproduce this bug build with following defconfig:
'
BR2_microblazeel=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_2=y
BR2_KERNEL_HEADERS_5_0=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_GCC_ENABLE_LTO=y
BR2_PACKAGE_SQLITE=y
'

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes:
V1->V2:
* work around for the right bug, not 85180
* improve commit log


 package/sqlite/sqlite.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7e97c966b7..8cfe0af0ed 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,8 +39,14 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
+# Building with Microblaze Gcc 4.9 makes compiling to hang.
+# Work around using -O0
+ifeq ($(BR2_microblaze)$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
+SQLITE_CFLAGS += -O0
+else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
+endif
 
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
-- 
2.17.1
