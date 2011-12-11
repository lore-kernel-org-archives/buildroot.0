From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:16:16 +0100
Subject: [Buildroot] [git commit] sqlite: refactor how CFLAGS are passed to
	the configure script
Message-ID: <20111211215606.7466B8F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2e7ec721f28a360b6bda2ed7e0f26218accc292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the way the SQLITE_CONF_ENV variable is constructed in
preparation of passing other CFLAGS to the configure script.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
