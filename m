From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2019 15:37:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/sqlite: remove workaround when
 building with gcc version <= 4.9
In-Reply-To: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
References: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191217143704.51115-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gcc version 4.9 is not supported anymore by Buildroot so let's remove
the check for using a work-around.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sqlite/sqlite.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ba5b5c5d00..673d91ccd9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,14 +39,8 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
-# Building with Microblaze Gcc 4.9 makes compiling to hang.
-# Work around using -O0
-ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)
-SQLITE_CFLAGS += $(TARGET_CFLAGS) -O0
-else
 # fallback to standard -O3 when -Ofast is present to avoid -ffast-math
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
-endif
 
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
-- 
2.20.1
