From: Chris Zankel <chris@zankel.net>
Date: Tue, 22 Jan 2013 12:33:19 -0800
Subject: [Buildroot] [PATCH 1] xtensa: sqlite requires special compiler
	option
Message-ID: <50fef791.c587440a.325a.2b65@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the generated object files are too large for PC-relative addressing,
so use the --test-section-literals to move symbols closer to the code.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/sqlite/sqlite.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index bf4b921..8eb6b2f 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
 
+ifeq ($(BR2_xtensa),y)
+SQLITE_CFLAGS += -mtext-section-literals
+endif
+
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-- 
1.7.10.4
