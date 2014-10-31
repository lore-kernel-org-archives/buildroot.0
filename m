From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 31 Oct 2014 16:19:09 +0100
Subject: [Buildroot] [PATCH v2 3/3] mysql: use /etc/ld.so.conf.d instead of
	/etc/ld.so.conf
In-Reply-To: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
Message-ID: <1414768749-15134-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/mysql/ld.so.conf.d-mysql.conf | 1 +
 package/mysql/mysql.mk                | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/mysql/ld.so.conf.d-mysql.conf

diff --git a/package/mysql/ld.so.conf.d-mysql.conf b/package/mysql/ld.so.conf.d-mysql.conf
new file mode 100644
index 0000000..33d9ace
--- /dev/null
+++ b/package/mysql/ld.so.conf.d-mysql.conf
@@ -0,0 +1 @@
+/usr/lib/mysql
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 945ca18..1a35378 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -114,7 +114,10 @@ define MYSQL_REMOVE_TEST_PROGS
 endef
 
 define MYSQL_ADD_MYSQL_LIB_PATH
-	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
+	$(INSTALL) -d $(TARGET_DIR)/etc/ld.so.conf.d
+	$(INSTALL) -m 644 \
+		package/mysql g/ld.so.conf.d-mysql.conf \
+		$(TARGET_DIR)/etc/ld.so.conf.d
 endef
 
 MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
-- 
1.9.1
