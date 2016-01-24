From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 24 Jan 2016 16:55:03 +0200
Subject: [Buildroot] [PATCH v4 4/4] ypbind-mt: new package
In-Reply-To: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
Message-ID: <1453647303-3965-5-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Adds the ypbind-mt package that contains a multithreaded ypbind daemon
for Linux. Uses threads for better response and supports the ypbind
protocols version 1, 2 and 3. ypbind finds the server for a given NIS
domain and stores information about it in a binding file on the local
host.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 .../ypbind-mt/0001-Remove_man_dir_from_build.patch |   16 ++++
 package/ypbind-mt/Config.in                        |   17 ++++
 package/ypbind-mt/S70ypbind                        |   93 ++++++++++++++++++++
 package/ypbind-mt/ypbind-mt.mk                     |   24 +++++
 4 files changed, 150 insertions(+)
 create mode 100644 package/ypbind-mt/0001-Remove_man_dir_from_build.patch
 create mode 100644 package/ypbind-mt/Config.in
 create mode 100755 package/ypbind-mt/S70ypbind
 create mode 100644 package/ypbind-mt/ypbind-mt.mk

diff --git a/package/ypbind-mt/0001-Remove_man_dir_from_build.patch b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
new file mode 100644
index 0000000..10ebed7
--- /dev/null
+++ b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
@@ -0,0 +1,16 @@
+Remove the man directory from the build in order to avoid trying to build the
+commented targets ypbind.8 and ypconf.5
+
+Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
+
+--- a/Makefile.am	2014-12-04 16:27:18.000000000 +0200
++++ b/Makefile.am	2015-12-16 15:00:21.950050679 +0200
+@@ -5,7 +5,7 @@
+ #
+ AUTOMAKE_OPTIONS = 1.6 gnits dist-bzip2
+ #
+-SUBDIRS = lib src man po
++SUBDIRS = lib src po
+ 
+ CLEANFILES = *~
+ 
diff --git a/package/ypbind-mt/Config.in b/package/ypbind-mt/Config.in
new file mode 100644
index 0000000..2ac9d28
--- /dev/null
+++ b/package/ypbind-mt/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_YPBIND_MT
+	bool "ypbind-mt"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # rpcsvc/nis.h
+	select BR2_PACKAGE_YP_TOOLS
+	select BR2_PACKAGE_RPCBIND # runtime
+	help
+	  The ypbind-mt package contains a multithreaded ypbind daemon
+	  for Linux. It uses threads for better response and supports
+	  the ypbind protocols version 1, 2 and 3.
+
+	  Note: You need to select package "linux-pam" for NIS
+	  authentication.
+
+	  http://www.linux-nis.org/nis/ypbind-mt/
+
+comment "ypbind-mt needs an (e)glibc toolchain with rpcsvc/nis.h"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/ypbind-mt/S70ypbind b/package/ypbind-mt/S70ypbind
new file mode 100755
index 0000000..e73bec6
--- /dev/null
+++ b/package/ypbind-mt/S70ypbind
@@ -0,0 +1,93 @@
+#!/bin/sh
+# Based on /etc/init.d/ypbind from SuSe Linux by Thorsten Kukuk
+
+DAEMON=/usr/sbin/ypbind
+pidfile=/var/run/ypbind.pid
+
+[ -x ${DAEMON} ] || exit 0
+
+[ -f /etc/default/ypbind ] && source /etc/default/ypbind
+
+case "$1" in
+	start)
+		echo -n "Starting ypbind: "
+		# Check for preset YP domainname
+		ypdomainname &> /dev/null
+		if [ $? -ne 0 ]; then
+			if [ ! -f /etc/defaultdomain ]; then
+				# No configured YP domainname
+				echo "FAIL"
+				exit 1
+			fi
+			# Assume that /etc/defaultdomain contains
+			# a valid domainname and assume ypdomainname
+			# succeeds
+			XDOMAINNAME=$(cat /etc/defaultdomain)
+			ypdomainname "${XDOMAINNAME}"
+		fi
+
+		if [ ! -f /etc/yp.conf -a "${YPBIND_BROADCAST}" != "yes" ]; then
+			# We need a local configuration if not in broadcast mode
+			echo "FAIL"
+			exit 1
+		fi
+
+		OPTIONS=""
+		test "${YPBIND_LOCAL_ONLY}" = "yes" && \
+			OPTIONS="-local-only ${OPTIONS}"
+		test "${YPBIND_BROADCAST}" = "yes" && \
+			OPTIONS="-broadcast ${OPTIONS}"
+		test "${YPBIND_BROKEN_SERVER}" = "yes" && \
+			OPTIONS="-broken-server ${OPTIONS}"
+
+		start-stop-daemon --start --quiet --pidfile ${pidfile} \
+			--exec ${DAEMON} -- ${OPTIONS}
+
+		if [ $? -ne 0 ]; then
+			echo "FAIL"
+			exit 1
+		fi
+
+		# Make sure we have a server so that later scripts can know
+		notfound=1
+		for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
+			if ypwhich &>/dev/null; then
+				notfound=0
+				break
+			fi
+			echo -n " ."
+			sleep 1;
+		done
+
+		if [ ${notfound} -eq 1 ]; then
+			# No NIS server found
+			echo "FAIL"
+			exit 1
+		fi
+
+		echo "OK"
+		;;
+
+	stop)
+		echo "Shutting down ypbind "
+		start-stop-daemon --stop --quiet --pidfile $pidfile
+		# Remove static data, else glibc will continue to use NIS
+		rm -f /var/yp/binding/* /var/run/ypbind.pid
+		;;
+
+	restart)
+		${0} stop
+		sleep 1
+		${0} start
+		;;
+
+	reload|force-reload)
+		echo "Reloading ypbind"
+		start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
+		;;
+
+	*)
+		echo "Usage: ${0} {start|stop|restart|force-reload|reload}"
+		exit 1
+		;;
+esac
diff --git a/package/ypbind-mt/ypbind-mt.mk b/package/ypbind-mt/ypbind-mt.mk
new file mode 100644
index 0000000..08baf6e
--- /dev/null
+++ b/package/ypbind-mt/ypbind-mt.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# ypbind-mt
+#
+################################################################################
+
+# The github releases of ypbind-mt are often a release or more ahead of the
+# "Download" links on http://www.linux-nis.org/nis/ypbind-mt/
+YPBIND_MT_VERSION = ypbind-mt-2_2
+YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))
+YPBIND_MT_LICENSE = GPLv2
+YPBIND_MT_LICENSE_FILES = COPYING
+YPBIND_MT_AUTORECONF = YES
+YPBIND_MT_DEPENDENCIES = host-pkgconf yp-tools
+YPBIND_MT_CONF_ENV = \
+	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
+	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"
+
+define YPBIND_MT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(YPBIND_MT_PKGDIR)/S70ypbind \
+		$(TARGET_DIR)/etc/init.d/S70ypbind
+endef
+
+$(eval $(autotools-package))
-- 
1.7.9.5
