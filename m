From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:59:00 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building sqlite with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
SQLITE_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
* use BUG_85180 instead of BUG_71124 since they are the same bug

 package/sqlite/sqlite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7e97c966b7..fa5dab6b57 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,8 +39,12 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+SQLITE_CFLAGS += -O0
+else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
+endif
 
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
-- 
2.17.1
