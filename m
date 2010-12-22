From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 14:07:09 +0100
Subject: [Buildroot] [PATCH 2/2] qt: fix bug 2371
In-Reply-To: <cover.1293023213.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293023213.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3118ac8790972e8992f4fe4d74d68fefa56e4092.1293023213.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/qt/qt.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
1.7.0.4
