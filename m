From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:51:36 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/mariadb: add
 option to disable build of embedded server
Message-ID: <20181024154954.1F7CD88D37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8b91b25d027b6fcf85ff8c99282c04130550ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Size of output/target/usr:

with embedded: 1,7G
without embedded: 648M

This config option saves space on the target if the embedded server
is not used by any other package:

https://mariadb.com/kb/en/library/embedded-mariadb-interface/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Ryan Coe <bluemrp9@gmail.com>
[Peter: make Config.in option depend on _MARIADB_SERVER]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 19df27ed03b33cd86c971afb355091161972851f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 4 ++++
 package/mysql/Config.in    | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 23822187c3..e8ccf7a2a9 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -48,8 +48,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
+ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
 else
+MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=OFF
+endif
+else
 MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
 endif
 
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 2abf5daecb..66bd0faa57 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -54,6 +54,12 @@ config BR2_PACKAGE_MARIADB_SERVER
 	help
 	  Install the mariadb server on the target.
 
+config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
+	depends on BR2_PACKAGE_MARIADB_SERVER
+	bool "mariadb embedded server"
+	help
+	  Install the mariadb embedded server on the target.
+
 endif
 
 if BR2_PACKAGE_ORACLE_MYSQL
