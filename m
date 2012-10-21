From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Oct 2012 21:10:17 +0200
Subject: [Buildroot] [git commit] New package liblog4c-localtime
Message-ID: <20121021191348.02FFF9709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d4cdb081020bafa7062c6a8cf052b3d5000635c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor fixes]
Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                |    1 +
 package/liblog4c-localtime/Config.in             |   11 +++++++++++
 package/liblog4c-localtime/liblog4c-localtime.mk |   18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b78d980..2ba68cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -485,6 +485,7 @@ source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
+source "package/liblog4c-localtime/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/liblog4c-localtime/Config.in b/package/liblog4c-localtime/Config.in
new file mode 100644
index 0000000..a2b7a84
--- /dev/null
+++ b/package/liblog4c-localtime/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBLOG4C_LOCALTIME
+	bool "liblog4c-localtime"
+	select BR2_PACKAGE_EXPAT
+	help
+	  Log4c is a library of C for flexible logging to files, syslog
+	  and other destinations.
+	  This version is with localtime patch, to make lib show times in
+	  local timezone.
+
+	  https://github.com/rcmadruga/log4c-localtime
+	  http://log4c.sourceforge.net/
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
new file mode 100644
index 0000000..3b1642c
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -0,0 +1,18 @@
+ #############################################################
+ #
+ # liblog4c
+ #
+ #############################################################
+ LIBLOG4C_LOCALTIME_VERSION = 1.0
+ LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
+ LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
+ LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
+ LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
+
+define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
+	chmod +x $(@D)/configure
+endef
+
+LIBLOG4C_LOCALTIME_PRE_CONFIGURE_HOOKS += LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
+
+ $(eval $(autotools-package))
