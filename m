From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 22:08:42 +0100
Subject: [Buildroot] [git commit master 1/1] qt: fix mysql module build
Message-ID: <20101222211005.4CD6D8E218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4c31d75ca447c9d27cd57233caffedef1c36ee4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2371

Bug 2371 was a Qt compilation issue when MySQL support was enabled,
because the Qt configuration tests were looking at host MySQL
libraries.

Even though I couldn't reproduce the bug with MySQL libraries
installed on my host, there was clearly a problem since
-I/usr/include/mysql and -L/usr/lib/mysql were part of the compilation
flags when building those tests.

This was caused by the fact that /usr/bin/mysql_config was used
instead of $(STAGING_DIR)/usr/bin/mysql_config. We fix this by passing
the path to the correct mysql_config script using the -mysql_config Qt
./configure argument. Since this mysql_config script returns the
correct flags for libraries and headers path, the hardcoded -I and -L
flag in qt.mk are no longer needed.

With this in place, Qt is no longer compiled with -I/usr/include/mysql
and -L/usr/lib/mysql, which presumably should fix the problem reported
in bug 2371.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    1 +
 package/qt/qt.mk |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 26cda06..4fef0eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,6 +22,7 @@
 	#561:  ltp-testsuite failed to install
 	#1651: Build fail caused by ccache in module-init-tools
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
+	#2371: QT MYSQL Module does not build when MySQL installed on the host
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 2b5b31b..6eb31bc 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -283,8 +283,7 @@ ifeq ($(BR2_PACKAGE_QT_IBASE),y)
 QT_CONFIGURE+= -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
-QT_CONFIGURE+= -qt-sql-mysql -I $(STAGING_DIR)/usr/include/mysql -L $(STAGING_DIR)/usr/lib/mysql
-
+QT_CONFIGURE+= -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
 QT_DEP_LIBS+=mysql_client
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
-- 
1.7.2.2
