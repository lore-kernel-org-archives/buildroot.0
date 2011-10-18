From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 12:53:15 -0300
Subject: [Buildroot] [PATCH 1/2] util-linux: fix partx build breakage
Message-ID: <1318953196-19037-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

addpart, delpart and partx are enabled by default so --disable now to
avoid build breaking when we lack libblkid.
Also select libblkid when it's enabled now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in     |    7 ++++---
 package/util-linux/util-linux.mk |    4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 816130d..43a8444 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,6 +67,10 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "build \"wall\""
 
+config BR2_PACKAGE_UTIL_LINUX_PARTX
+	bool "build \"addpart, delpart, partx\""
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+
 ############################################
 # default disabled and should be enabled by
 #  --enable-foo
@@ -86,9 +90,6 @@ config BR2_PACKAGE_UTIL_LINUX_LAST
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "build \"mesg\""
 
-config BR2_PACKAGE_UTIL_LINUX_PARTX
-	bool "build \"addpart, delpart, partx\""
-
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "build \"raw\""
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b77e326..a3d6e13 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -49,7 +49,8 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),,--disable-rename) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),,--disable-schedutils) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),,--disable-wall)
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),,--disable-wall) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx)
 
 #############################################
 #
@@ -61,7 +62,6 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
-- 
1.7.3.4
