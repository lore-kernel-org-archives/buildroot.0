From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 09:50:15 +0200
Subject: [Buildroot] [PATCH] sqlite: do not assume thread support is
	available
Message-ID: <1342597816-16767-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --enable-threadsafe option was unconditionally passed, without
taking into account whether the underlying toolchain had thread
support or not. Now, we properly pass --enable-threadsafe or
--disable-threadsafe depending on the availability of thread support.

Fixes
http://autobuild.buildroot.net/results/defdc098cff293baabf2f89587476eba71f1c0d0/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5b85ecc..9e63b52 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -23,9 +23,14 @@ endif
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-	--enable-threadsafe \
 	--localstatedir=/var
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+SQLITE_CONF_OPT += --enable-threadsafe
+else
+SQLITE_CONF_OPT += --disable-threadsafe
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
 SQLITE_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
-- 
1.7.9.5
