From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 12:02:43 +0100
Subject: [Buildroot] [git commit] package/sqlite: Dynamically link
	libsqlite.so to bin/sqlite3
Message-ID: <20160123110527.EF3387FB27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58e931989fb23df55334a17aa5d4ee0d8dc45355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=8621#c1
Lonnie Abelbeck wrote:
"recently sqlite changed it's default behavior wrt the sqlite CLI tool,
 previously it was dynamically linked with libsqlite3.so.0 by default,
 now it is statically linked by default.

The old behavior can be signaled with: --disable-static-shell"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
