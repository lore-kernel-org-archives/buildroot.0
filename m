From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 15:26:52 +0200
Subject: [Buildroot] [git commit] time: needs mmu
Message-ID: <20130917132814.2EB209B7B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35f6c37e2d0551d6568bd42fa5e4321680782b92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/time/Config.in |    1 +
 package/time/time.mk   |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
