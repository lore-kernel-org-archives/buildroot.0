From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:36 +0200
Subject: [Buildroot] [PATCH 2/8] package/sqlite: fix BUG_71124 build timeout
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522122542.84146-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking.
This is due to bug 71124:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124
Bug shows up building sqlite with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_71124=y force using -O0 passing it to
SQLITE_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sqlite/sqlite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7e97c966b7..acf759f4c0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,8 +39,12 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_71124),y)
+SQLITE_CFLAGS += -O0
+else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
+endif
 
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
-- 
2.17.1
