From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 22:16:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/open2300: link with -lz only if
 needed
Message-ID: <20200714201630.1407071-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oracle-mysql won't built its own bundled zlib since commit
6fed83a03047535d4a9c849352f8c21b30177fcd so don't unconditionally link
with zlib

It should be noted that oracle-mysql has a pkg-config file since version
5.7.22 and
https://github.com/mysql/mysql-server/commit/f701787602583464fce4f44d44f67471a06c9b70
but we're stuck in version 5.1.x and can't easily import this commit
because upstream switched to cmake

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open2300/open2300.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 589d344b97..a9087279eb 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -21,7 +21,7 @@ OPEN2300_DEPENDENCIES += mysql
 OPEN2300_BINS += mysql2300 mysqlhistlog2300
 OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
 OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
-ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_PACKAGE_ZLIB)$(BR2_STATIC_LIBS),yy)
 # mysql needs -lz, so we need to specify it for static builds
 OPEN2300_LDFLAGS += -lz
 endif
-- 
2.27.0
