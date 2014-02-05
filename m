From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Feb 2014 22:09:22 +0100
Subject: [Buildroot] [PATCH] open2300: fix build failure
Message-ID: <1391634562-1680-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the open2300's build-system, which is a handwritten
Makefile, by removing the hard-coded include and library locations and
making them pointing to the systroot.

Fixes:
  http://autobuild.buildroot.org/results/072/0724ffa1355f5564b1fcd9d6e3c9ff2162d20f44/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/open2300/open2300-0001-fix-makefile.patch | 52 +++++++++++++++++++++++
 package/open2300/open2300.mk                      |  7 ++-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 package/open2300/open2300-0001-fix-makefile.patch

diff --git a/package/open2300/open2300-0001-fix-makefile.patch b/package/open2300/open2300-0001-fix-makefile.patch
new file mode 100644
index 0000000..5398d08
--- /dev/null
+++ b/package/open2300/open2300-0001-fix-makefile.patch
@@ -0,0 +1,52 @@
+From faca6c375cbb528f3f34333b3858492f4564da81 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 5 Feb 2014 21:52:20 +0100
+Subject: [PATCH] fix makefile
+
+- allow to extend CFLAGS and CC_LDFLAGS
+- remove hard-coded include dirs. and lib. dirs. (which pointed to some
+  location in the host system)
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ Makefile | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 92a2cc0..6b461ef 100755
+--- a/Makefile
++++ b/Makefile
+@@ -37,9 +37,9 @@ MYSQLHISTLOGOBJ = mysqlhistlog2300.o rw2300.o linux2300.o win2300.o
+ 
+ VERSION = 1.11
+ 
+-CFLAGS = -Wall -O3 -DVERSION=\"$(VERSION)\"
+-CC_LDFLAGS = -lm
+-CC_WINFLAG = 
++CFLAGS += -Wall -O3 -DVERSION=\"$(VERSION)\"
++CC_LDFLAGS += -lm
++CC_WINFLAG =
+ # For Windows - comment the two line above and un-comment the two lines below.
+ #CC_LDFLAGS = -lm -lwsock32
+ #CC_WINFLAG = -mwindows
+@@ -80,7 +80,7 @@ xml2300 : $(XMLOBJ)
+ 	$(CC) $(CFLAGS) -o $@ $(XMLOBJ) $(CC_LDFLAGS) $(CC_WINFLAG)
+ 
+ mysql2300:
+-	$(CC) $(CFLAGS) -o mysql2300 mysql2300.c rw2300.c linux2300.c $(CC_LDFLAGS) $(CC_WINFLAG) -I/usr/include/mysql -L/usr/lib/mysql -lmysqlclient
++	$(CC) $(CFLAGS) -o mysql2300 mysql2300.c rw2300.c linux2300.c $(CC_LDFLAGS) $(CC_WINFLAG)
+ 
+ pgsql2300: $(PGSQLOBJ)
+ 	$(CC) $(CFLAGS) -o $@ $(PGSQLOBJ) $(CC_LDFLAGS) $(CC_WINFLAG) -I/usr/include/pgsql -L/usr/lib/pgsql -lpq
+@@ -95,7 +95,7 @@ minmax2300: $(MINMAXOBJ)
+ 	$(CC) $(CFLAGS) -o $@ $(MINMAXOBJ) $(CC_LDFLAGS) $(CC_WINFLAG)
+ 	
+ mysqlhistlog2300 :
+-	$(CC) $(CFLAGS) -o mysqlhistlog2300 mysqlhistlog2300.c rw2300.c linux2300.c $(CC_LDFLAGS) $(CC_WINFLAG) -I/usr/include/mysql -L/usr/lib/mysql -lmysqlclient
++	$(CC) $(CFLAGS) -o mysqlhistlog2300 mysqlhistlog2300.c rw2300.c linux2300.c $(CC_LDFLAGS) $(CC_WINFLAG)
+ 
+ 
+ install:
+-- 
+1.8.5.3
+
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index e9f1cf5..3e718d9 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -10,14 +10,19 @@ OPEN2300_VERSION     = 12
 
 OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
 		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
+OPEN2300_CFLAGS = $(TARGET_CFLAGS)
+OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 	OPEN2300_DEPENDENCIES += mysql
 	OPEN2300_BINS         += mysql2300 mysqlhistlog2300
+	OPEN2300_CFLAGS       += -I$(STAGING_DIR)/usr/include/mysql
+	OPEN2300_LDFLAGS      += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
 endif
 
 define OPEN2300_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(OPEN2300_BINS)
+	CFLAGS="$(OPEN2300_CFLAGS)" CC_LDFLAGS="$(OPEN2300_LDFLAGS)" \
+		$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(OPEN2300_BINS)
 endef
 
 define OPEN2300_INSTALL_TARGET_CMDS
-- 
1.8.5.3
