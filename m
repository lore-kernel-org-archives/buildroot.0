From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:49:15 +0200
Subject: [Buildroot] [git commit] package/open2300: use mysql_config to
 retrieve cflags and libs
Message-ID: <20200714214641.482DC86D0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efffb3ea45fccf5926be52ffa12c0acb0c234d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

oracle-mysql won't built its own bundled zlib since commit
6fed83a03047535d4a9c849352f8c21b30177fcd so don't unconditionally link
with zlib instead use mysql_config to retrieve cflags and libs as
suggested by Thomas Petazzoni in review of first iteration

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open2300/open2300.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 589d344b97..0ffb8b5046 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -19,12 +19,8 @@ OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 OPEN2300_DEPENDENCIES += mysql
 OPEN2300_BINS += mysql2300 mysqlhistlog2300
-OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
-OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
-ifeq ($(BR2_STATIC_LIBS),y)
-# mysql needs -lz, so we need to specify it for static builds
-OPEN2300_LDFLAGS += -lz
-endif
+OPEN2300_CFLAGS += $(shell $(STAGING_DIR)/usr/bin/mysql_config --cflags)
+OPEN2300_LDFLAGS += $(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)
 endif
 
 define OPEN2300_BUILD_CMDS
