From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] sqlite: work around build breakage
	with !BR2_LARGEFILE
Message-ID: <20091123120644.5589C77782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e189fe1f78f5dba0f642ce146b4b227415d09337
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should get fixed properly upstream, but this is good enough for 2009.11-rc1.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/database/sqlite/sqlite.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 00e5559..3375ca9 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -11,6 +11,15 @@ SQLITE_INSTALL_STAGING = YES
 SQLITE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 SQLITE_LIBTOOL_PATCH = NO
 
+ifneq ($(BR2_LARGEFILE),y)
+# the sqlite configure script fails to define SQLITE_DISABLE_LFS when
+# --disable-largefile is passed, breaking the build. Work around it by
+# simply adding it to CFLAGS for configure instead
+SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DSQLITE_DISABLE_LFS"
+# changing CFLAGS doesn't work with config.cache
+SQLITE_USE_CONFIG_CACHE = NO
+endif
+
 SQLITE_CONF_OPT =	--enable-shared \
 			--enable-static \
 			--enable-tempstore=yes \
-- 
1.6.3.3
