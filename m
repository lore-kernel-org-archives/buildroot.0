From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:13:37 +0200
Subject: [Buildroot] [git commit] sqlite: avoid use of unsupported -Ofast
 CFLAGS
Message-ID: <20180415201345.692D38849C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83781f11dce6d4ef8da052253454cafcbec80dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sqlite3 refuses to be built with -ffast-math (a side effect of -Ofast) when it
falls back to implementing its own isnan() function.

sqlite3.c: In function ???sqlite3IsNaN???:
sqlite3.c:28554:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.

To work around this, when -Ofast is used replace with -O3.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d0030d43ab..5ae17e17f6 100644
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
