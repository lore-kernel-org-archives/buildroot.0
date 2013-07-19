From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Jul 2013 16:41:20 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.6-ESV-R9-P1
Message-ID: <1374262880-15194-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-3919

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/{bind.sysvinit => S81named}               |  2 +-
 package/bind/bind-01-disable-tests.patch               | 16 ++++++++++++++++
 package/bind/{bind-cross.patch => bind-02-cross.patch} | 10 +++++++---
 package/bind/bind-susv3-legacy.patch                   | 12 ------------
 package/bind/bind.mk                                   | 12 ++++++++----
 5 files changed, 32 insertions(+), 20 deletions(-)
 rename package/bind/{bind.sysvinit => S81named} (99%)
 create mode 100644 package/bind/bind-01-disable-tests.patch
 rename package/bind/{bind-cross.patch => bind-02-cross.patch} (81%)
 delete mode 100644 package/bind/bind-susv3-legacy.patch

diff --git a/package/bind/bind.sysvinit b/package/bind/S81named
similarity index 99%
rename from package/bind/bind.sysvinit
rename to package/bind/S81named
index 171d320..0160c11 100644
--- a/package/bind/bind.sysvinit
+++ b/package/bind/S81named
@@ -50,7 +50,7 @@ case "$1" in
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
-		exit 1 
+		exit 1
 esac
 
 exit 0
diff --git a/package/bind/bind-01-disable-tests.patch b/package/bind/bind-01-disable-tests.patch
new file mode 100644
index 0000000..9c3d52e
--- /dev/null
+++ b/package/bind/bind-01-disable-tests.patch
@@ -0,0 +1,16 @@
+Disable tests to avoid cross-compilation issues (tries to run genrandom).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura bind-9.6-ESV-R9-P1.orig/bin/Makefile.in bind-9.6-ESV-R9-P1/bin/Makefile.in
+--- bind-9.6-ESV-R9-P1.orig/bin/Makefile.in	2013-06-04 15:30:48.000000000 -0300
++++ bind-9.6-ESV-R9-P1/bin/Makefile.in	2013-07-19 15:32:19.018287733 -0300
+@@ -19,7 +19,7 @@
+ VPATH =		@srcdir@
+ top_srcdir =	@top_srcdir@
+
+-SUBDIRS =	named rndc dig dnssec tests nsupdate check
++SUBDIRS =	named rndc dig dnssec nsupdate check
+ TARGETS =
+
+ @BIND9_MAKE_RULES@
diff --git a/package/bind/bind-cross.patch b/package/bind/bind-02-cross.patch
similarity index 81%
rename from package/bind/bind-cross.patch
rename to package/bind/bind-02-cross.patch
index cdbf4cb..5b4b1cd 100644
--- a/package/bind/bind-cross.patch
+++ b/package/bind/bind-02-cross.patch
@@ -1,14 +1,18 @@
+Use host compiler to build 'gen' since it's run when building.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
 diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Makefile.in
 --- bind-9.5.1-P1/lib/dns/Makefile.in	2007-09-11 22:09:08.000000000 -0300
 +++ bind-9.5.1-P1.gencross/lib/dns/Makefile.in	2009-03-04 16:35:23.000000000 -0200
 @@ -160,8 +160,8 @@
  	./gen -s ${srcdir} > code.h
- 
+
  gen: gen.c
 -	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
 -	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c ${BUILD_LIBS}
 +	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
 +	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
- 
+
  rbtdb64. at O@: rbtdb.c
- 
+
diff --git a/package/bind/bind-susv3-legacy.patch b/package/bind/bind-susv3-legacy.patch
deleted file mode 100644
index 99be15c..0000000
--- a/package/bind/bind-susv3-legacy.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nura bind-9.5.2-P1/lib/isc/unix/ifiter_ioctl.c bind-9.5.2-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c
---- bind-9.5.2-P1/lib/isc/unix/ifiter_ioctl.c	2009-02-15 22:53:58.000000000 -0200
-+++ bind-9.5.2-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c	2009-12-03 13:12:56.000000000 -0300
-@@ -17,6 +17,8 @@
- 
- /* $Id: ifiter_ioctl.c,v 1.58.90.3 2009/02/16 00:53:58 marka Exp $ */
- 
-+#include <string.h>
-+
- /*! \file
-  * \brief
-  * Obtain the list of network interfaces using the SIOCGLIFCONF ioctl.
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 973981a..4137093 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -1,10 +1,10 @@
-################################################################################
+###############################################################################
 #
 # bind
 #
 ################################################################################
 
-BIND_VERSION = 9.6-ESV-R8
+BIND_VERSION = 9.6-ESV-R9-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_LICENSE = ISC
@@ -35,9 +35,13 @@ else
 	BIND_CONF_OPT += --with-openssl=no
 endif
 
+define BIND_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/bind/S81named \
+		$(TARGET_DIR)/etc/init.d/S81named
+endef
+
 define BIND_TARGET_INSTALL_FIXES
 	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
-	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
 endef
 
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES
@@ -61,8 +65,8 @@ endif
 define BIND_UNINSTALL_TARGET_CMDS
 	$(BIND_TARGET_REMOVE_SERVER)
 	$(BIND_TARGET_REMOVE_TOOLS)
-	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
 endef
 
 $(eval $(autotools-package))
-- 
1.8.1.5
