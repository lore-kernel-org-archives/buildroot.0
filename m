From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 09:12:30 -0300
Subject: [Buildroot] [PATCH] time: needs mmu
Message-ID: <1379419950-2305-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/time/Config.in | 1 +
 package/time/time.mk   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/time/Config.in b/package/time/Config.in
index 634d41a..0ec3be3 100644
--- a/package/time/Config.in
+++ b/package/time/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TIME
 	bool "time"
+	depends on BR2_USE_MMU # fork()
 	help
 	  The GNU time utility.
 
diff --git a/package/time/time.mk b/package/time/time.mk
index b7ee40c..56f28ff 100644
--- a/package/time/time.mk
+++ b/package/time/time.mk
@@ -7,11 +7,13 @@
 TIME_VERSION = 1.7
 TIME_SITE = $(BR2_GNU_MIRROR)/time
 TIME_CONF_ENV = ac_cv_func_wait3=yes
+TIME_LICENSE = GPLv2+
+TIME_LICENSE_FILES = COPYING
 
 # time uses an old version of automake that does not support
 # installing in DESTDIR.
 define TIME_INSTALL_TARGET_CMDS
-	install -D -m 755  $(@D)/time $(TARGET_DIR)/usr/bin/time
+	$(INSTALL) -D -m 755  $(@D)/time $(TARGET_DIR)/usr/bin/time
 endef
 
 $(eval $(autotools-package))
-- 
1.8.1.5
