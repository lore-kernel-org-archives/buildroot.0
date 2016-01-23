From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 11:23:43 +0100
Subject: [Buildroot] [PATCH 2/4] package/sqlite: Dynamically link
	libsqlite.so to bin/sqlite3
In-Reply-To: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453544625-30597-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.busybox.net/show_bug.cgi?id=8621#c1
Lonnie Abelbeck wrote:
"recently sqlite changed it's default behavior wrt the sqlite CLI tool,
 previously it was dynamically linked with libsqlite3.so.0 by default,
 now it is statically linked by default.

The old behavior can be signaled with: --disable-static-shell"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 27dad12..46acbf8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -35,6 +35,8 @@ SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
+else
+SQLITE_CONF_OPTS += --disable-static-shell
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.7.0.rc3
