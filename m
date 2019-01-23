From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:21:23 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] sqlite: avoid use of
 unsupported -Ofast CFLAGS
Message-ID: <20190123143025.9809F814C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f232cb356fdca03911e6d01e1bdae28b30999adf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

sqlite3 refuses to be built with -ffast-math (a side effect of -Ofast) when it
falls back to implementing its own isnan() function.

sqlite3.c: In function ???sqlite3IsNaN???:
sqlite3.c:28554:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.

To work around this, when -Ofast is used replace with -O3.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 83781f11dce6d4ef8da052253454cafcbec80dbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e8ce92df56..d917cca8f2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -35,7 +35,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
 SQLITE_CFLAGS += -DSQLITE_NO_SYNC
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
+# fallback to standard -O3 when -Ofast is present to avoid -ffast-math
+SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
+
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
