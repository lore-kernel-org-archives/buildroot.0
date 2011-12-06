From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue,  6 Dec 2011 21:52:02 +0100
Subject: [Buildroot] [PATCH 3/4] sqlite: refactor how CFLAGS are passed to
	the configure script
In-Reply-To: <1323204723-6020-1-git-send-email-s.neumann@raumfeld.com>
References: <1323204723-6020-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1323204723-6020-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change the way the SQLITE_CONF_ENV variable is constructed in
preparation of passing other CFLAGS to the configure script.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/sqlite/sqlite.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index f587f47..0bee337 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -13,9 +13,11 @@ ifneq ($(BR2_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
 # --disable-largefile is passed, breaking the build. Work around it by
 # simply adding it to CFLAGS for configure instead
-SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DSQLITE_DISABLE_LFS"
+SQLITE_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 
+SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
+
 SQLITE_CONF_OPT = \
 	--enable-threadsafe \
 	--localstatedir=/var
-- 
1.7.5.4
