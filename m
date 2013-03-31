From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 31 Mar 2013 21:52:44 +0200
Subject: [Buildroot] [git commit] linknx: new package
Message-ID: <20130331195240.564C89B3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4deba5c3d91d97de80b45241bcdc67e25f6e92e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add patch to fix build issue with gcc 4.7+]
[Thomas: various fixes/improvements]
Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/linknx/Config.in                   |   12 +++++++++++
 package/linknx/linknx-missing-unistd.patch |   22 ++++++++++++++++++++
 package/linknx/linknx.mk                   |   30 ++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 463d1b9..69d87f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -680,6 +680,7 @@ source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
+source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
new file mode 100644
index 0000000..18e9867
--- /dev/null
+++ b/package/linknx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LINKNX
+	bool "linknx"
+	select BR2_PACKAGE_LIBPTHSEM
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Linknx is an automation platform providing high level functionalities
+	  to EIB/KNX installation.
+
+	  http://linknx.sourceforge.net/
+
+comment "linknx requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/linknx/linknx-missing-unistd.patch b/package/linknx/linknx-missing-unistd.patch
new file mode 100644
index 0000000..04b088f
--- /dev/null
+++ b/package/linknx/linknx-missing-unistd.patch
@@ -0,0 +1,22 @@
+[PATCH]: ioport.cpp: close(2) needs unistd.h
+
+Fixed in upstream CVS:
+http://linknx.cvs.sourceforge.net/viewvc/linknx/linknx/linknx/src/ioport.cpp?revision=1.20&view=markup
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/ioport.cpp |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: linknx-0.0.1.30/src/ioport.cpp
+===================================================================
+--- linknx-0.0.1.30.orig/src/ioport.cpp
++++ linknx-0.0.1.30/src/ioport.cpp
+@@ -21,6 +21,7 @@
+ #include <iomanip>
+ #include "ioport.h"
+ #include <fcntl.h>
++#include <unistd.h>
+ 
+ Logger& IOPort::logger_m(Logger::getInstance("IOPort"));
+ Logger& RxThread::logger_m(Logger::getInstance("RxThread"));
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
new file mode 100644
index 0000000..42700a7
--- /dev/null
+++ b/package/linknx/linknx.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# linknx
+#
+#############################################################
+
+LINKNX_VERSION = 0.0.1.30
+LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
+LINKNX_LICENSE = GPLv2+
+LINKNX_INSTALL_STAGING = YES
+LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
+		  --with-pth=$(STAGING_DIR)/usr
+
+LINKNX_DEPENDENCIES = libpthsem
+
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+LINKNX_DEPENDENCIES = mysql_client
+else
+LINKNX_CONF_OPT += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LINKNX_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+LINKNX_DEPENDENCIES += libcurl
+else
+LINKNX_CONF_OPT += --without-libcurl
+endif
+
+$(eval $(autotools-package))
