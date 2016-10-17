From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Oct 2016 22:01:28 +0200
Subject: [Buildroot] [PATCH v1] motion: fix postgresql support
Message-ID: <1476734488-3436-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commandline paramter to enable/disable postgresql support is
called '--with-pgsql/--without-pgsql' and not '--with-postgresql/
--without-postgresql'.

Fixes [1] in case postgresql development files are installed on the host:

  checking for PostgreSQL... testing
  checking autodect pgsql headers... yes /usr/include/postgresql
  checking autodect pgsql libs... /usr/lib64
  checking for PQconnectStart in -lpq... no
  configure: error: PostgreSQL support can't build without PostgreSQL libraries

[1] http://autobuild.buildroot.net/results/749/7497730da2affffe0e5b9b790081de10c269f416

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/motion/motion.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index de29a2a..1b80561 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -44,11 +44,11 @@ endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 MOTION_DEPENDENCIES += postgresql
 MOTION_CONF_OPTS += \
-	--with-postgresql \
+	--with-pgsql \
 	--with-pgsql-include=$(STAGING_DIR)/usr/include \
 	--with-pgsql-lib=$(STAGING_DIR)/usr/lib
 else
-MOTION_CONF_OPTS += --without-postgresql
+MOTION_CONF_OPTS += --without-pgsql
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
-- 
2.8.1
