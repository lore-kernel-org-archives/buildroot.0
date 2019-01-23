From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:22:20 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] sqlite: fix build without
 threads
Message-ID: <20190123143025.B87E27FA2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abd02280c2bd4c85c63755693662775dcf05513e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

If threads are not available, set SQLITE_THREADSAFE to 0.
Indeed, since version 3.25.0, the following line:
THREADSAFE_FLAGS=-DSQLITE_THREADSAFE=0
has been removed from configure.ac
As a result, SQLITE_THREADSAFE will be set to a default value of 1 even
if --disable-threadsafe is set

Fixes:
 - http://autobuild.buildroot.org/results/70b1582edcb787746e4483e80b27f86ac781f0fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d3143409ac99609c160bd3d53250bcebe09fe975)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9911be6916..fa24fd01d4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -50,6 +50,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SQLITE_CONF_OPTS += --enable-threadsafe
 else
 SQLITE_CONF_OPTS += --disable-threadsafe
+SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
