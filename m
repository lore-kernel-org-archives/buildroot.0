From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 13 Apr 2018 13:22:34 -0700
Subject: [Buildroot] [PATCH] sqlite: avoid use of unsupported -Ofast CFLAGS
Message-ID: <1523650954-23449-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sqlite3 refuses to be built with -ffast-math (a side effect of -Ofast) when it
falls back to implementing its own isnan() function.

sqlite3.c: In function ?sqlite3IsNaN?:
sqlite3.c:28554:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.

To work around this, when -Ofast is used replace with -O3.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/sqlite/sqlite.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d0030d4..5ae17e1 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,7 +39,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
+# fallback to standard -O3 when -Ofast is present to avoid -ffast-math
+SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
+
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
-- 
2.7.4
