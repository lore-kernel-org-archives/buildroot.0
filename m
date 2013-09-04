From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:52 -0500
Subject: [Buildroot] [PATCH 13/17] audit: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-14-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                                  |    1 +
 package/audit/Config.in                            |   26 +
 package/audit/S14auditd                            |  172 +++
 ...audit-2.3.1-crossCompileHeaderCreationFix.patch | 1388 ++++++++++++++++++++
 package/audit/audit-2.3.1-remove-zos-plugin.patch  |   31 +
 package/audit/audit.mk                             |   61 +
 6 files changed, 1679 insertions(+), 0 deletions(-)
 create mode 100644 package/audit/Config.in
 create mode 100755 package/audit/S14auditd
 create mode 100644 package/audit/audit-2.3.1-crossCompileHeaderCreationFix.patch
 create mode 100644 package/audit/audit-2.3.1-remove-zos-plugin.patch
 create mode 100644 package/audit/audit.mk

diff --git a/package/Config.in b/package/Config.in
index 560e38e..a032e5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -913,6 +913,7 @@ endmenu
 menu "System tools"
 source "package/acl/Config.in"
 source "package/attr/Config.in"
+source "package/audit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
diff --git a/package/audit/Config.in b/package/audit/Config.in
new file mode 100644
index 0000000..8c7b318
--- /dev/null
+++ b/package/audit/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_AUDIT
+	bool "audit"
+	help
+	  The audit package contains the user space utilities for
+	  storing and searching the audit records generate by
+	  the audit subsystem in the Linux 2.6 kernel
+	  
+	  Note: The z/OS remote plugin is disabled in this package
+	  
+	  http://people.redhat.com/sgrubb/audit/
+
+if BR2_PACKAGE_AUDIT
+
+config BR2_PACKAGE_AUDIT_PYTHON_BINDINGS
+	select BR2_PACKAGE_PYTHON
+	bool "python bindings"
+	help
+	  enable building python bindings
+
+config BR2_PACKAGE_AUDIT_LIBCAP_NG
+	select BR2_PACKAGE_LIBCAP_NG
+	bool "libcap-ng support"
+	help
+	  Add Libcap-ng support
+
+endif
diff --git a/package/audit/S14auditd b/package/audit/S14auditd
new file mode 100755
index 0000000..74a6249
--- /dev/null
+++ b/package/audit/S14auditd
@@ -0,0 +1,172 @@
+#!/bin/bash
+#
+# auditd        This starts and stops auditd
+#
+# description: This starts the Linux Auditing System Daemon, \
+#              which collects security related events in a dedicated \
+#              audit log. If this daemon is turned off, audit events \
+#              will be sent to syslog.
+#
+# processname: /sbin/auditd
+# config: /etc/sysconfig/auditd
+# config: /etc/audit/auditd.conf
+# pidfile: /var/run/auditd.pid
+#
+# Return values according to LSB for all commands but status:
+# 0 - success
+# 1 - generic or unspecified error
+# 3 - unimplemented feature (e.g. "reload")
+# 4 - insufficient privilege
+# 5 - program is not installed
+# 6 - program is not configured
+# 7 - program is not running
+#
+prog="auditd"
+
+# Check that we are root ... so non-root users stop here
+test $EUID=0  ||  exit 4
+
+# Check config
+test -f /etc/sysconfig/auditd && . /etc/sysconfig/auditd
+
+RETVAL=0
+LOCK=/var/lock/subsys/auditd
+
+start(){
+   echo -n "Initializing $prog: "
+
+   if [ ! -e $LOCK ]; then
+      test -x /sbin/auditd  || exit 5
+      test -f /etc/audit/auditd.conf  || exit 6
+   
+      # Create dir to store log files in if one doesn't exist
+      test -d /var/log/audit || mkdir -p /var/log/audit && /sbin/restorecon /var/log/audit
+   
+      # Run audit daemon executable
+      $prog
+      RETVAL=$?
+      if test $RETVAL = 0 ; then
+         test -d /var/lock/subsys || mkdir -p /var/lock/subsys
+         touch $LOCK
+         # Load the default rules
+         test -f /etc/audit/audit.rules && /sbin/auditctl -R /etc/audit/audit.rules >/dev/null
+         echo "OK"
+      else
+         echo "FAILED: auditd failed to start"
+      fi
+   else
+      echo "FAILED: auditd already started, stop first"
+      RETVAL=1
+   fi
+   return $RETVAL
+}
+
+stop(){
+   echo -n "Uninitializing $prog: "
+   if [ -e $LOCK ]; then
+      killall -TERM $prog
+      RETVAL=$?
+      if [ $RETVAL ]; then
+         rm -f $LOCK
+         # Remove watches so shutdown works cleanly
+         if test x"$AUDITD_CLEAN_STOP" != "x" ; then
+            if test "`echo $AUDITD_CLEAN_STOP | tr 'NO' 'no'`" != "no"
+            then
+               /sbin/auditctl -D >/dev/null
+            fi
+         fi
+         if test x"$AUDITD_STOP_DISABLE" != "x" ; then
+            if test "`echo $AUDITD_STOP_DISABLE | tr 'NO' 'no'`" != "no"
+            then
+               /sbin/auditctl -e 0 >/dev/null
+            fi
+         fi
+         echo "OK"
+      else
+         echo "FAILED: auditd not stopped"
+      fi
+   else
+      echo "FAILED: auditd not started"
+      RETVAL=1
+   fi
+   return $RETVAL
+}
+
+reload(){
+   echo -n "Reloading auditd configuration: "
+   if [ -e $LOCK ]; then
+      test -f /etc/audit/auditd.conf  || exit 6
+      echo -n "Reloading configuration: " 
+      killall -HUP $prog
+      RETVAL=$?
+      if [ $RETVAL ]; then
+         echo "OK"
+      else
+         echo "FAILED"
+      fi
+   else
+      echo "FAILED: auditd not started"
+      RETVAL=1
+   fi
+   return $RETVAL
+}
+
+rotate(){
+   echo -n "Rotating auditd logs: "  
+   if [ -e $LOCK ]; then
+      killall -USR1 $prog
+      RETVAL=$?
+      if [ $RETVAL ]; then
+         echo "OK"
+      else
+         echo "FAILED"
+      fi
+   else
+      echo "FAILED: auditd not started"
+      RETVAL=1
+   fi
+   return $RETVAL
+}
+
+restart(){
+   test -f /etc/audit/auditd.conf  || exit 6
+   stop
+   start
+   return $RETVAL
+}
+
+condrestart(){
+   [ -e $LOCK ] && restart
+   return 0
+}
+
+# See how we were called.
+case "$1" in
+   start)
+      start
+      ;;
+   stop)
+      stop
+      ;;
+   restart)
+      restart
+      ;;
+   reload)
+      reload
+      ;;
+   rotate)
+      rotate
+      ;;
+   resume)
+      resume
+      ;;
+   condrestart)
+      condrestart
+      ;;
+   *)
+      echo "Usage: $0 {start|stop|restart|condrestart|reload|rotate}"
+      RETVAL=3
+      ;;
+esac
+
+exit $RETVAL
diff --git a/package/audit/audit-2.3.1-crossCompileHeaderCreationFix.patch b/package/audit/audit-2.3.1-crossCompileHeaderCreationFix.patch
new file mode 100644
index 0000000..7e3b6ed
--- /dev/null
+++ b/package/audit/audit-2.3.1-crossCompileHeaderCreationFix.patch
@@ -0,0 +1,1388 @@
+diff -urN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-07-29 16:37:01.000000000 -0500
++++ b/configure.ac	2013-08-21 13:29:55.760585744 -0500
+@@ -51,6 +51,8 @@
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_AWK
++AM_PATH_PYTHON(2.7)
++AC_PYTHON_MODULE(pyparsing, 1)
+ 
+ echo .
+ echo Checking for header files
+@@ -89,8 +91,7 @@
+ 	AC_MSG_RESULT(no)
+ else
+ AC_MSG_RESULT(testing)
+-AM_PATH_PYTHON
+-if test -f /usr/include/python${am_cv_python_version}/Python.h ; then
++if test x$ax_python_header != x ; then
+ 	python_found="yes"
+ 	AC_MSG_NOTICE(Python bindings will be built)
+ else
+diff -urN /dev/null b/m4/ax_python_module.m4
+--- /dev/null	2013-06-19 11:25:31.230442052 -0500
++++ b/m4/ax_python_module.m4	2013-08-21 12:43:56.829882655 -0500
+@@ -0,0 +1,49 @@
++# ===========================================================================
++#     http://www.gnu.org/software/autoconf-archive/ax_python_module.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PYTHON_MODULE(modname[, fatal])
++#
++# DESCRIPTION
++#
++#   Checks for Python module.
++#
++#   If fatal is non-empty then absence of a module will trigger an error.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Andrew Collier
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 6
++
++AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
++AC_DEFUN([AX_PYTHON_MODULE],[
++    if test -z $PYTHON;
++    then
++        PYTHON="python"
++    fi
++    PYTHON_NAME=`basename $PYTHON`
++    AC_MSG_CHECKING($PYTHON_NAME module: $1)
++	$PYTHON -c "import $1" 2>/dev/null
++	if test $? -eq 0;
++	then
++		AC_MSG_RESULT(yes)
++		eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
++	else
++		AC_MSG_RESULT(no)
++		eval AS_TR_CPP(HAVE_PYMOD_$1)=no
++		#
++		if test -n "$2"
++		then
++			AC_MSG_ERROR(failed to find required module $1)
++			exit 1
++		fi
++	fi
++])
+diff -urN a/auparse/Makefile.am b/auparse/Makefile.am
+--- a/auparse/Makefile.am	2013-07-29 16:37:01.000000000 -0500
++++ b/auparse/Makefile.am	2013-08-19 14:37:31.230510790 -0500
+@@ -52,8 +52,8 @@
+ 	rlimittabs.h recvtabs.h schedtabs.h seccomptabs.h \
+ 	seektabs.h shm_modetabs.h signaltabs.h sockoptnametabs.h \
+ 	socktabs.h sockleveltabs.h socktypetabs.h \
+-	tcpoptnametabs.h typetabs.h umounttabs.h
+-noinst_PROGRAMS = gen_accesstabs_h gen_captabs_h gen_clock_h \
++	tcpoptnametabs.h typetabs.h umounttabs.h \
++	gen_accesstabs_h gen_captabs_h gen_clock_h \
+ 	gen_clone-flagtabs_h \
+ 	gen_epoll_ctls_h gen_famtabs_h \
+ 	gen_fcntl-cmdtabs_h gen_flagtabs_h \
+@@ -69,187 +69,184 @@
+ 	gen_socktypetabs_h gen_tcpoptnametabs_h gen_typetabs_h \
+ 	gen_umounttabs_h
+ 
+-gen_accesstabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
+-gen_accesstabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="accesstab.h"'
++gen_accesstabs_h: ../lib/gen_tables.c ../lib/gen_tables.h accesstab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"accesstab.h\" -E -o $@ ../lib/gen_tables.c
+ accesstabs.h: gen_accesstabs_h Makefile
+-	./gen_accesstabs_h --i2s-transtab access > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab access gen_accesstabs_h $@
+ 
+-gen_captabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h captab.h
+-gen_captabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="captab.h"'
++gen_captabs_h: ../lib/gen_tables.c ../lib/gen_tables.h captab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"captab.h\" -E -o $@ ../lib/gen_tables.c
+ captabs.h: gen_captabs_h Makefile
+-	./gen_captabs_h --i2s cap > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s cap gen_captabs_h $@
+ 
+-gen_clock_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
+-gen_clock_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clocktab.h"'
++gen_clock_h: ../lib/gen_tables.c ../lib/gen_tables.h clocktab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"clocktab.h\" -E -o $@ ../lib/gen_tables.c
+ clocktabs.h: gen_clock_h Makefile
+-	./gen_clock_h --i2s clock > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s clock gen_clock_h $@
+ 
+-gen_clone_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+-	clone-flagtab.h
+-gen_clone_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="clone-flagtab.h"'
++gen_clone-flagtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h clone-flagtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"clone-flagtab.h\" -E -o $@ ../lib/gen_tables.c
+ clone-flagtabs.h: gen_clone-flagtabs_h Makefile
+-	./gen_clone-flagtabs_h --i2s-transtab clone_flag > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab clone_flag gen_clone-flagtabs_h $@
+ 
+-gen_epoll_ctls_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
+-gen_epoll_ctls_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="epoll_ctl.h"'
++gen_epoll_ctls_h: ../lib/gen_tables.c ../lib/gen_tables.h epoll_ctl.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"epoll_ctl.h\" -E -o $@ ../lib/gen_tables.c
+ epoll_ctls.h: gen_epoll_ctls_h Makefile
+-	./gen_epoll_ctls_h --i2s epoll_ctl > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s epoll_ctl gen_epoll_ctls_h $@
+ 
+-gen_famtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
+-gen_famtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="famtab.h"'
++gen_famtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h famtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"famtab.h\" -E -o $@ ../lib/gen_tables.c
+ famtabs.h: gen_famtabs_h Makefile
+-	./gen_famtabs_h --i2s fam > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s fam gen_famtabs_h $@
+ 
+-gen_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h flagtab.h
+ # ../auparse/ is used to avoid using ../lib/flagtab.h
+-gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="../auparse/flagtab.h"'
++gen_flagtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ../auparse/flagtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"../auparse/flagtab.h\" -E -o $@ ../lib/gen_tables.c
+ flagtabs.h: gen_flagtabs_h Makefile
+-	./gen_flagtabs_h --i2s-transtab flag > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab flag gen_flagtabs_h $@
+ 
+-gen_fcntl_cmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+-	fcntl-cmdtab.h
+-gen_fcntl_cmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fcntl-cmdtab.h"'
++gen_fcntl-cmdtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h fcntl-cmdtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"fcntl-cmdtab.h\" -E -o $@ ../lib/gen_tables.c
+ fcntl-cmdtabs.h: gen_fcntl-cmdtabs_h Makefile
+-	./gen_fcntl-cmdtabs_h --i2s fcntl > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s fcntl gen_fcntl-cmdtabs_h $@
+ 
+-gen_icmptypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
+-gen_icmptypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="icmptypetab.h"'
++gen_icmptypetabs_h: ../lib/gen_tables.c ../lib/gen_tables.h icmptypetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"icmptypetab.h\" -E -o $@ ../lib/gen_tables.c
+ icmptypetabs.h: gen_icmptypetabs_h Makefile
+-	./gen_icmptypetabs_h --i2s icmptype > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s icmptype gen_icmptypetabs_h $@
+ 
+-gen_ipctabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
+-gen_ipctabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipctab.h"'
++gen_ipctabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ipctab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ipctab.h\" -E -o $@ ../lib/gen_tables.c
+ ipctabs.h: gen_ipctabs_h Makefile
+-	./gen_ipctabs_h --i2s ipc > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s ipc gen_ipctabs_h $@
+ 
+-gen_ipccmdtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
+-gen_ipccmdtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipccmdtab.h"'
++gen_ipccmdtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ipccmdtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ipccmdtab.h\" -E -o $@ ../lib/gen_tables.c
+ ipccmdtabs.h: gen_ipccmdtabs_h Makefile
+-	./gen_ipccmdtabs_h --i2s-transtab ipccmd > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab ipccmd gen_ipccmdtabs_h $@
+ 
+-gen_ipoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
+-gen_ipoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ipoptnametab.h"'
++gen_ipoptnametabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ipoptnametab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ipoptnametab.h\" -E -o $@ ../lib/gen_tables.c
+ ipoptnametabs.h: gen_ipoptnametabs_h Makefile
+-	./gen_ipoptnametabs_h --i2s ipoptname > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s ipoptname gen_ipoptnametabs_h $@
+ 
+-gen_ip6optnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
+-gen_ip6optnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ip6optnametab.h"'
++gen_ip6optnametabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ip6optnametab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ip6optnametab.h\" -E -o $@ ../lib/gen_tables.c
+ ip6optnametabs.h: gen_ip6optnametabs_h Makefile
+-	./gen_ip6optnametabs_h --i2s ip6optname > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s ip6optname gen_ip6optnametabs_h $@
+ 
+-gen_mmaptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
+-gen_mmaptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mmaptab.h"'
++gen_mmaptabs_h: ../lib/gen_tables.c ../lib/gen_tables.h mmaptab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"mmaptab.h\" -E -o $@ ../lib/gen_tables.c
+ mmaptabs.h: gen_mmaptabs_h Makefile
+-	./gen_mmaptabs_h --i2s-transtab mmap > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab mmap gen_mmaptabs_h $@
+ 
+-gen_mounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
+-gen_mounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="mounttab.h"'
++gen_mounttabs_h: ../lib/gen_tables.c ../lib/gen_tables.h mounttab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"mounttab.h\" -E -o $@ ../lib/gen_tables.c
+ mounttabs.h: gen_mounttabs_h Makefile
+-	./gen_mounttabs_h --i2s-transtab mount > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab mount gen_mounttabs_h $@
+ 
+-gen_nfprototabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
+-gen_nfprototabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="nfprototab.h"'
++gen_nfprototabs_h: ../lib/gen_tables.c ../lib/gen_tables.h nfprototab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"nfprototab.h\" -E -o $@ ../lib/gen_tables.c
+ nfprototabs.h: gen_nfprototabs_h Makefile
+-	./gen_nfprototabs_h --i2s nfproto > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s nfproto gen_nfprototabs_h $@
+ 
+-gen_open_flagtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h \
+-	open-flagtab.h
+-gen_open_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="open-flagtab.h"'
++gen_open-flagtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h open-flagtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"open-flagtab.h\" -E -o $@ ../lib/gen_tables.c
+ open-flagtabs.h: gen_open-flagtabs_h Makefile
+-	./gen_open-flagtabs_h --i2s-transtab open_flag > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab open_flag gen_open-flagtabs_h $@
+ 
+-gen_persontabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
+-gen_persontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="persontab.h"'
++gen_persontabs_h: ../lib/gen_tables.c ../lib/gen_tables.h persontab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"persontab.h\" -E -o $@ ../lib/gen_tables.c
+ persontabs.h: gen_persontabs_h Makefile
+-	./gen_persontabs_h --i2s person > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s person gen_persontabs_h $@
+ 
+-gen_ptracetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
+-gen_ptracetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ptracetab.h"'
++gen_ptracetabs_h: ../lib/gen_tables.c ../lib/gen_tables.h ptracetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ptracetab.h\" -E -o $@ ../lib/gen_tables.c
+ ptracetabs.h: gen_ptracetabs_h Makefile
+-	./gen_ptracetabs_h --i2s ptrace > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s ptrace gen_ptracetabs_h $@
+ 
+-gen_prctl_opttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
+-gen_prctl_opttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prctl-opt-tab.h"'
++gen_prctl_opttabs_h: ../lib/gen_tables.c ../lib/gen_tables.h prctl-opt-tab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"prctl-opt-tab.h\" -E -o $@ ../lib/gen_tables.c
+ prctl_opttabs.h: gen_prctl_opttabs_h Makefile
+-	./gen_prctl_opttabs_h --i2s prctl_opt > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s prctl_opt gen_prctl_opttabs_h $@
+ 
+-gen_pktoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
+-gen_pktoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="pktoptnametab.h"'
++gen_pktoptnametabs_h: ../lib/gen_tables.c ../lib/gen_tables.h pktoptnametab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"pktoptnametab.h\" -E -o $@ ../lib/gen_tables.c
+ pktoptnametabs.h: gen_pktoptnametabs_h Makefile
+-	./gen_pktoptnametabs_h --i2s pktoptname > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s pktoptname gen_pktoptnametabs_h $@
+ 
+-gen_prottabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
+-gen_prottabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="prottab.h"'
++gen_prottabs_h: ../lib/gen_tables.c ../lib/gen_tables.h prottab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"prottab.h\" -E -o $@ ../lib/gen_tables.c
+ prottabs.h: gen_prottabs_h Makefile
+-	./gen_prottabs_h --i2s-transtab prot > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab prot gen_prottabs_h $@
+ 
+-gen_recvtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
+-gen_recvtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="recvtab.h"'
++gen_recvtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h recvtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"recvtab.h\" -E -o $@ ../lib/gen_tables.c
+ recvtabs.h: gen_recvtabs_h Makefile
+-	./gen_recvtabs_h --i2s-transtab recv > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab recv gen_recvtabs_h $@
+ 
+-gen_rlimit_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
+-gen_rlimit_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="rlimittab.h"'
++gen_rlimit_h: ../lib/gen_tables.c ../lib/gen_tables.h rlimittab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"rlimittab.h\" -E -o $@ ../lib/gen_tables.c
+ rlimittabs.h: gen_rlimit_h Makefile
+-	./gen_rlimit_h --i2s rlimit > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s rlimit gen_rlimit_h $@
+ 
+-gen_schedtabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
+-gen_schedtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="schedtab.h"'
++gen_schedtabs_h: ../lib/gen_tables.c ../lib/gen_tables.h schedtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"schedtab.h\" -E -o $@ ../lib/gen_tables.c
+ schedtabs.h: gen_schedtabs_h Makefile
+-	./gen_schedtabs_h --i2s sched > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s sched gen_schedtabs_h $@
+ 
+-gen_seccomptabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
+-gen_seccomptabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seccomptab.h"'
++gen_seccomptabs_h: ../lib/gen_tables.c ../lib/gen_tables.h seccomptab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"seccomptab.h\" -E -o $@ ../lib/gen_tables.c
+ seccomptabs.h: gen_seccomptabs_h Makefile
+-	./gen_seccomptabs_h --i2s seccomp > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s seccomp gen_seccomptabs_h $@
+ 
+-gen_seektabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
+-gen_seektabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="seektab.h"'
++gen_seektabs_h: ../lib/gen_tables.c ../lib/gen_tables.h seektab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"seektab.h\" -E -o $@ ../lib/gen_tables.c
+ seektabs.h: gen_seektabs_h Makefile
+-	./gen_seektabs_h --i2s seek > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s seek gen_seektabs_h $@
+ 
+-gen_shm_modetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
+-gen_shm_modetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="shm_modetab.h"'
++gen_shm_modetabs_h: ../lib/gen_tables.c ../lib/gen_tables.h shm_modetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"shm_modetab.h\" -E -o $@ ../lib/gen_tables.c
+ shm_modetabs.h: gen_shm_modetabs_h Makefile
+-	./gen_shm_modetabs_h --i2s-transtab shm_mode > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab shm_mode gen_shm_modetabs_h $@
+ 
+-gen_signals_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
+-gen_signals_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="signaltab.h"'
++gen_signals_h: ../lib/gen_tables.c ../lib/gen_tables.h signaltab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"signaltab.h\" -E -o $@ ../lib/gen_tables.c
+ signaltabs.h: gen_signals_h Makefile
+-	./gen_signals_h --i2s signal > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s signal gen_signals_h $@
+ 
+-gen_sockleveltabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
+-gen_sockleveltabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockleveltab.h"'
++gen_sockleveltabs_h: ../lib/gen_tables.c ../lib/gen_tables.h sockleveltab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"sockleveltab.h\" -E -o $@ ../lib/gen_tables.c
+ sockleveltabs.h: gen_sockleveltabs_h Makefile
+-	./gen_sockleveltabs_h --i2s socklevel > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s socklevel gen_sockleveltabs_h $@
+ 
+-gen_sockoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
+-gen_sockoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="sockoptnametab.h"'
++gen_sockoptnametabs_h: ../lib/gen_tables.c ../lib/gen_tables.h sockoptnametab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"sockoptnametab.h\" -E -o $@ ../lib/gen_tables.c
+ sockoptnametabs.h: gen_sockoptnametabs_h Makefile
+-	./gen_sockoptnametabs_h --i2s sockoptname > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s sockoptname gen_sockoptnametabs_h $@
+ 
+-gen_socktabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
+-gen_socktabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktab.h"'
++gen_socktabs_h: ../lib/gen_tables.c ../lib/gen_tables.h socktab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"socktab.h\" -E -o $@ ../lib/gen_tables.c
+ socktabs.h: gen_socktabs_h Makefile
+-	./gen_socktabs_h --i2s sock > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s sock gen_socktabs_h $@
+ 
+-gen_socktypetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
+-gen_socktypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="socktypetab.h"'
++gen_socktypetabs_h: ../lib/gen_tables.c ../lib/gen_tables.h socktypetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"socktypetab.h\" -E -o $@ ../lib/gen_tables.c
+ socktypetabs.h: gen_socktypetabs_h Makefile
+-	./gen_socktypetabs_h --i2s sock_type > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s sock_type gen_socktypetabs_h $@
+ 
+-gen_tcpoptnametabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
+-gen_tcpoptnametabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="tcpoptnametab.h"'
++gen_tcpoptnametabs_h: ../lib/gen_tables.c ../lib/gen_tables.h tcpoptnametab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"tcpoptnametab.h\" -E -o $@ ../lib/gen_tables.c
+ tcpoptnametabs.h: gen_tcpoptnametabs_h Makefile
+-	./gen_tcpoptnametabs_h --i2s tcpoptname > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s tcpoptname gen_tcpoptnametabs_h $@
+ 
+-gen_typetabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
+-gen_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="typetab.h"'
++gen_typetabs_h: ../lib/gen_tables.c ../lib/gen_tables.h typetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"typetab.h\" -E -o $@ ../lib/gen_tables.c
+ typetabs.h: gen_typetabs_h Makefile
+-	./gen_typetabs_h --s2i type > $@
++	$(PYTHON) ../lib/gen_tables.py --s2i type gen_typetabs_h $@
+ 
+-gen_umounttabs_h_SOURCES = ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
+-gen_umounttabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="umounttab.h"'
++gen_umounttabs_h: ../lib/gen_tables.c ../lib/gen_tables.h umounttab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"umounttab.h\" -E -o $@ ../lib/gen_tables.c
+ umounttabs.h: gen_umounttabs_h Makefile
+-	./gen_umounttabs_h --i2s-transtab umount > $@
++	$(PYTHON) ../lib/gen_tables.py --i2s-transtab umount gen_umounttabs_h $@
+ 
+diff -urN a/lib/gen_tables.c b/lib/gen_tables.c
+--- a/lib/gen_tables.c	2013-07-29 16:37:01.000000000 -0500
++++ b/lib/gen_tables.c	2013-08-19 10:09:03.060041420 -0500
+@@ -54,19 +54,6 @@
+ #define SHMGET          23
+ #define SHMCTL          24
+ 
+-
+-/* The ratio of table size to number of non-empty elements allowed for a
+-   "direct" s2i table; if the ratio would be bigger, bsearch tables are used
+-   instead.
+-
+-   2 looks like a lot at a first glance, but the bsearch tables need twice as
+-   much space per element, so with the ratio equal to 2 the direct table uses
+-   no more memory and is faster. */
+-#define DIRECT_THRESHOLD 2
+-
+-/* Allow more than one string defined for a single integer value */
+-static bool allow_duplicate_ints; /* = false; */
+-
+ struct value {
+ 	int val;
+ 	const char *s;
+@@ -83,335 +70,11 @@
+ 
+ #define NUM_VALUES (sizeof(values) / sizeof(*values))
+ 
+-/* Compare two "struct value" members by name. */
+-static int
+-cmp_value_strings(const void *xa, const void *xb)
+-{
+-	const struct value *a, *b;
+-
+-	a = xa;
+-	b = xb;
+-	return strcmp(a->s, b->s);
+-}
+-
+-/* Compare two "struct value" members by value. */
+-static int
+-cmp_value_vals(const void *xa, const void *xb)
+-{
+-	const struct value *a, *b;
+-
+-	a = xa;
+-	b = xb;
+-	if (a->val > b->val)
+-		return 1;
+-	if (a->val < b->val)
+-		return -1;
+-	/* Preserve the original order if there is an ambiguity, to always use
+-	   the first specified value. */
+-	if (a->orig_index > b->orig_index)
+-		return 1;
+-	if (a->orig_index < b->orig_index)
+-		return -1;
+-	return 0;
+-}
+-
+-/* Compare two "struct value" members by orig_index. */
+-static int
+-cmp_value_orig_index(const void *xa, const void *xb)
+-{
+-	const struct value *a, *b;
+-
+-	a = xa;
+-	b = xb;
+-	if (a->orig_index > b->orig_index)
+-		return 1;
+-	if (a->orig_index < b->orig_index)
+-		return -1;
+-	return 0;
+-}
+-
+-/* Output the string table, initialize values[*]->s_offset. */
+-static void
+-output_strings(const char *prefix)
+-{
+-	size_t i, offset;
+-
+-	offset = 0;
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		values[i].s_offset = offset;
+-		offset += strlen(values[i].s) + 1;
+-	}
+-	printf("static const char %s_strings[] = \"", prefix);
+-	assert(NUM_VALUES > 0);
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		const char *c;
+-
+-		if (i != 0 && i % 10 == 0)
+-			fputs("\"\n"
+-			      "\t\"", stdout);
+-		for (c = values[i].s; *c != '\0'; c++) {
+-			assert(*c != '"' && *c != '\\'
+-			       && isprint((unsigned char)*c));
+-			putc(*c, stdout);
+-		}
+-		if (i != NUM_VALUES - 1)
+-			fputs("\\0", stdout);
+-	}
+-	fputs("\";\n", stdout);
+-}
+-
+-/* Output the string to integer mapping code.
+-   Assume strings are all uppsercase or all lowercase if specified by
+-   parameters; in that case, make the search case-insensitive.
+-   values must be sorted by strings. */
+-static void
+-output_s2i(const char *prefix, bool uppercase, bool lowercase)
+-{
+-	size_t i;
+-
+-	for (i = 0; i < NUM_VALUES - 1; i++) {
+-		assert(strcmp(values[i].s, values[i + 1].s) <= 0);
+-		if (strcmp(values[i].s, values[i + 1].s) == 0) {
+-			fprintf(stderr, "Duplicate value `%s': %d, %d\n",
+-				values[i].s, values[i].val, values[i + 1].val);
+-			abort();
+-		}
+-	}
+-	printf("static const unsigned %s_s2i_s[] = {", prefix);
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		if (i % 10 == 0)
+-			fputs("\n\t", stdout);
+-		assert(values[i].s_offset <= UINT_MAX);
+-		printf("%zu,", values[i].s_offset);
+-	}
+-	printf("\n"
+-	       "};\n"
+-	       "static const int %s_s2i_i[] = {", prefix);
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		if (i % 10 == 0)
+-			fputs("\n\t", stdout);
+-		printf("%d,", values[i].val);
+-	}
+-	fputs("\n"
+-	      "};\n", stdout);
+-	assert(!(uppercase && lowercase));
+-	if (uppercase) {
+-		for (i = 0; i < NUM_VALUES; i++) {
+-			const char *c;
+-
+-			for (c = values[i].s; *c != '\0'; c++)
+-				assert(isascii((unsigned char)*c)
+-				       && !GT_ISLOWER(*c));
+-		}
+-	} else if (lowercase) {
+-		for (i = 0; i < NUM_VALUES; i++) {
+-			const char *c;
+-
+-			for (c = values[i].s; *c != '\0'; c++)
+-				assert(isascii((unsigned char)*c)
+-				       && !GT_ISUPPER(*c));
+-		}
+-	}
+-	if (uppercase || lowercase) {
+-		printf("static int %s_s2i(const char *s, int *value) {\n"
+-		       "\tsize_t len, i;\n"
+-		       "\tlen = strlen(s);\n"
+-		       "\t{ char copy[len + 1];\n"
+-		       "\tfor (i = 0; i < len; i++) {\n"
+-		       "\t\tchar c = s[i];\n", prefix);
+-		if (uppercase)
+-			fputs("\t\tcopy[i] = GT_ISLOWER(c) ? c - 'a' + 'A' "
+-							  ": c;\n", stdout);
+-		else
+-			fputs("\t\tcopy[i] = GT_ISUPPER(c) ? c - 'A' + 'a' "
+-							  ": c;\n", stdout);
+-		printf("\t}\n"
+-		       "\tcopy[i] = 0;\n"
+-		       "\treturn s2i__(%s_strings, %s_s2i_s, %s_s2i_i, %zu, "
+-				      "copy, value);\n"
+-		       "\t}\n"
+-		       "}\n", prefix, prefix, prefix, NUM_VALUES);
+-	} else
+-		printf("static int %s_s2i(const char *s, int *value) {\n"
+-		       "\treturn s2i__(%s_strings, %s_s2i_s, %s_s2i_i, %zu, s, "
+-				      "value);\n"
+-		       "}\n", prefix, prefix, prefix, prefix, NUM_VALUES);
+-}
+-
+-/* Output the string to integer mapping table.
+-   values must be sorted by strings. */
+-static void
+-output_i2s(const char *prefix)
+-{
+-	struct value *unique_values;
+-	int min_val, max_val;
+-	size_t i, n;
+-
+-	assert(NUM_VALUES > 0);
+-	for (i = 0; i < NUM_VALUES - 1; i++) {
+-		assert(values[i].val <= values[i + 1].val);
+-		if (!allow_duplicate_ints
+-		    && values[i].val == values[i + 1].val) {
+-			fprintf(stderr, "Duplicate value %d: `%s', `%s'\n",
+-				values[i].val, values[i].s, values[i + 1].s);
+-			abort();
+-		}
+-	}
+-
+-	unique_values = malloc(NUM_VALUES * sizeof(*unique_values));
+-	assert(unique_values != NULL);
+-	n = 0;
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		if (n == 0 || unique_values[n - 1].val != values[i].val) {
+-			unique_values[n] = values[i];
+-			n++;
+-		}
+-	}
+-
+-	min_val = unique_values[0].val;
+-	max_val = unique_values[n - 1].val;
+-	if (((double)max_val - (double)min_val) / n <= DIRECT_THRESHOLD) {
+-		int next_index;
+-
+-		printf("static const unsigned %s_i2s_direct[] = {", prefix);
+-		next_index = min_val;
+-		i = 0;
+-		for (;;) {
+-			if ((next_index - min_val) % 10 == 0)
+-				fputs("\n\t", stdout);
+-			while (unique_values[i].val < next_index)
+-				/* This can happen if (allow_duplicate_ints) */
+-				i++;
+-			if (unique_values[i].val == next_index) {
+-				assert(unique_values[i].s_offset <= UINT_MAX);
+-				printf("%zu,", unique_values[i].s_offset);
+-			} else
+-				fputs("-1u,", stdout);
+-			if (next_index == max_val)
+-				/* Done like this to avoid integer overflow */
+-				break;
+-			next_index++;
+-		}
+-		printf("\n"
+-		       "};\n"
+-		       "static const char *%s_i2s(int v) {\n"
+-		       "\treturn i2s_direct__(%s_strings, %s_i2s_direct, %d, "
+-					     "%d, v);\n"
+-		       "}\n", prefix, prefix, prefix, min_val, max_val);
+-	} else {
+-		printf("static const int %s_i2s_i[] = {", prefix);
+-		for (i = 0; i < n; i++) {
+-			if (i % 10 == 0)
+-				fputs("\n\t", stdout);
+-			printf("%d,", unique_values[i].val);
+-		}
+-		printf("\n"
+-		       "};\n"
+-		       "static const unsigned %s_i2s_s[] = {", prefix);
+-		for (i = 0; i < n; i++) {
+-			if (i % 10 == 0)
+-				fputs("\n\t", stdout);
+-			assert(unique_values[i].s_offset <= UINT_MAX);
+-			printf("%zu,", unique_values[i].s_offset);
+-		}
+-		printf("\n"
+-		       "};\n"
+-		       "static const char *%s_i2s(int v) {\n"
+-		       "\treturn i2s_bsearch__(%s_strings, %s_i2s_i, %s_i2s_s, "
+-			      "%zu, v);\n"
+-		       "}\n", prefix, prefix, prefix, prefix, n);
+-	}
+-	free(unique_values);
+-}
+-
+-/* Output the string to integer mapping table as a transtab[].
+-   values must be sorted in the desired order. */
+-static void
+-output_i2s_transtab(const char *prefix)
+-{
+-	size_t i;
+-	char *uc_prefix;
+-
+-	printf("static const struct transtab %s_table[] = {", prefix);
+-	for (i = 0; i < NUM_VALUES; i++) {
+-		if (i % 10 == 0)
+-			fputs("\n\t", stdout);
+-		printf("{%d,%zu},", values[i].val, values[i].s_offset);
+-	}
+-	uc_prefix = strdup(prefix);
+-	assert(uc_prefix != NULL);
+-	for (i = 0; uc_prefix[i] != '\0'; i++)
+-		uc_prefix[i] = toupper((unsigned char)uc_prefix[i]);
+-	printf("\n"
+-	       "};\n"
+-	       "#define %s_NUM_ENTRIES "
+-	       "(sizeof(%s_table) / sizeof(*%s_table))\n", uc_prefix, prefix,
+-	       prefix);
+-	free(uc_prefix);
+-}
+-
+ int
+ main(int argc, char **argv)
+ {
+-	bool gen_i2s, gen_i2s_transtab, gen_s2i, uppercase, lowercase;
+-	char *prefix;
+-	size_t i;
+-
+ 	/* This is required by gen_tables.h */
+ 	assert(NUM_VALUES <= (SSIZE_MAX / 2 + 1));
+ 
+-	/* To make sure GT_ISUPPER and GT_ISLOWER work. */
+-	assert('Z' == 'A' + 25 && 'z' == 'a' + 25);
+-	gen_i2s = false;
+-	gen_i2s_transtab = false;
+-	gen_s2i = false;
+-	uppercase = false;
+-	lowercase = false;
+-	prefix = NULL;
+-	assert (argc > 1);
+-	for (i = 1; i < (size_t)argc; i++) {
+-		if (strcmp(argv[i], "--i2s") == 0)
+-			gen_i2s = true;
+-		else if (strcmp(argv[i], "--i2s-transtab") == 0)
+-			gen_i2s_transtab = true;
+-		else if (strcmp(argv[i], "--s2i") == 0)
+-			gen_s2i = true;
+-		else if (strcmp(argv[i], "--uppercase") == 0)
+-			uppercase = true;
+-		else if (strcmp(argv[i], "--lowercase") == 0)
+-			lowercase = true;
+-		else if (strcmp(argv[i], "--duplicate-ints") == 0)
+-			allow_duplicate_ints = true;
+-		else {
+-			assert(*argv[i] != '-');
+-			assert(prefix == NULL);
+-			prefix = argv[i];
+-		}
+-	}
+-	assert(prefix != NULL);
+-	assert(!(uppercase && lowercase));
+-
+-	printf("/* This is a generated file, see Makefile.am for its "
+-	       "inputs. */\n");
+-	for (i = 0; i < NUM_VALUES; i++)
+-		values[i].orig_index = i;
+-	qsort(values, NUM_VALUES, sizeof(*values), cmp_value_strings);
+-	/* FIXME? if (gen_s2i), sort the strings in some other order
+-	   (e.g. "first 4 nodes in BFS of the bsearch tree first") to use the
+-	   cache better. */
+-	/* FIXME? If the only thing generated is a transtab, keep the strings
+-	   in the original order to use the cache better. */
+-	output_strings(prefix);
+-	if (gen_s2i)
+-		output_s2i(prefix, uppercase, lowercase);
+-	if (gen_i2s) {
+-		qsort(values, NUM_VALUES, sizeof(*values), cmp_value_vals);
+-		output_i2s(prefix);
+-	}
+-	if (gen_i2s_transtab) {
+-		qsort(values, NUM_VALUES, sizeof(*values),
+-		      cmp_value_orig_index);
+-		output_i2s_transtab(prefix);
+-	}
+ 	return EXIT_SUCCESS;
+ }
+diff -urN /dev/null b/lib/gen_tables.py
+--- /dev/null	2013-06-19 11:25:31.230442052 -0500
++++ b/lib/gen_tables.py	2013-08-19 14:27:55.639872141 -0500
+@@ -0,0 +1,458 @@
++#!/usr/bin/python
++################################################################################
++# Copyright 2013, Rockwell Collins.  All rights reserved.
++# 
++# This library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++# 
++# This library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++# 
++# You should have received a copy of the GNU Lesser General Public
++# License along with this library; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++# 
++# Authors:
++#      Clayton Shotwell <clshotwe@rockwellcollins.com>
++#
++# Description:
++#      Generator of lookup tables to replace the gen_tables.c method developed
++#      Miloslav Trmac <mitr@redhat.com> to make audit package cross compilable.
++#      The logic in this script mimics the logic in gen_tables.c before the last
++#      modification.
++#
++# Usage: gen_tables.py [-h] [--i2s] [--i2s-transtab] [--s2i]
++#                             [--uppercase | --lowercase] [--duplicate-ints]
++#                             prefix header source output
++#
++#        Generate tables header files.
++#
++#        positional arguments:
++#          prefix            The prefix of the output file to use
++#          header            The header file to parse table values from
++#          source            The source of the preprocessor from the compiler
++#          output            The output header file
++#
++#        optional arguments:
++#          -h, --help        show this help message and exit
++#          --i2s             Generate i2s tables
++#          --i2s-transtab    Generate transtab tables
++#          --s2i             Generate s2i tables
++#          --uppercase       All characters are uppercase
++#          --lowercase       All characters are lowercase
++#          --duplicate-ints  Allow duplicate integers
++
++import argparse
++import ctypes
++import os
++import re
++import sys
++from operator import attrgetter
++from pyparsing import Group, Word, Suppress, alphas, alphanums, nums, cppStyleComment, \
++		Optional, ZeroOrMore
++
++# Number of entries to print per line
++NUM_ENTIRES_IN_LINE = 10
++
++# Global table entries variable that is used everywhere
++ENTRIES = []
++
++# The ratio of table size to number of non-empty elements allowed for a
++# "direct" s2i table; if the ratio would be bigger, bsearch tables are used
++# instead.
++# 
++# 2 looks like a lot at a first glance, but the bsearch tables need twice as
++# much space per element, so with the ratio equal to 2 the direct table uses
++# no more memory and is faster.
++DIRECT_THRESHOLD = 2
++
++# Set to True to enable some debug output
++DEBUG = False
++
++class Entry:
++	def __init__(self, new_s, val):
++		self.st = new_s
++		self.val = val
++		self.offset = 0
++		self.orig_index = 0
++	
++	def set_position(self, offset):
++		self.offset = offset
++	
++	def set_orig_index(self, orig_index):
++		self.orig_index = orig_index
++	
++	def get_str(self):
++		return self.st
++	
++	def __repr__(self):
++		return "<Entry st=%s val=%s>" % (self.st, self.val)
++	
++	def __str__(self):
++		return "Entry of st=%s, val=%s, offset=%d, orig_index=%d" % \
++				(self.st, self.val, self.offset, self.orig_index)
++
++def output_strings(prefix, outfile):
++	try:
++		# Calculate the position each entry will be in the string
++		index = 0
++		for i in range(len(ENTRIES)):
++			ENTRIES[i].set_position(index)
++			# Increment the index by the length of the name plus 1 for the null
++			# character at the end.
++			index += len(ENTRIES[i].get_str()) + 1
++		# Write out the strings
++		outfile.write("static const char %s_strings[] = \"" % prefix)
++		for i in range(len(ENTRIES)):
++			if (i != 0) and (i % NUM_ENTIRES_IN_LINE == 0):
++				outfile.write('"\n\t"')
++			outfile.write(ENTRIES[i].get_str())
++			if (i != (len(ENTRIES) - 1)):
++				outfile.write('\\0')
++		outfile.write('";\n')
++	except:
++		# If an error is found, raise the exception so the main function can close
++		# and delete the outfile
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error in output_strings:", exc_type, fname, exc_tb.tb_lineno)
++		raise
++
++def output_s2i(prefix, outfile, uppercase, lowercase):
++	try:
++		# Check for duplicate values
++		for i in range(len(ENTRIES) - 1):
++			assert (ENTRIES[i].get_str() <= ENTRIES[i + 1].get_str()), "Entries not in the correct order"
++			if (ENTRIES[i].get_str() == ENTRIES[i + 1].get_str()):
++				print("Duplicate value %s: %d, %d" % \
++						(ENTRIES[i].get_str(), ENTRIES[i].val, ENTRIES[i + 1].val))
++				raise
++		
++		# Write out the index to value index values
++		outfile.write("static const unsigned %s_s2i_s[] = {" % prefix)
++		for i in range(len(ENTRIES)):
++			if (i % NUM_ENTIRES_IN_LINE == 0):
++				outfile.write('\n\t')
++			outfile.write("%i," % ENTRIES[i].offset)
++		outfile.write('\n};\n')
++		
++		# Write out the string to value actual values
++		outfile.write("static const int %s_s2i_i[] = {" % prefix)
++		for i in range(len(ENTRIES)):
++			if (i % NUM_ENTIRES_IN_LINE == 0):
++				outfile.write('\n\t')
++			outfile.write("%i," % ENTRIES[i].val)
++		outfile.write('\n};\n')
++		
++		# Verify the strings are all uppercase or lowercase depending on the arguments
++		# passed in
++		if uppercase:
++			for i in range(len(ENTRIES)):
++				assert (all(ord(c) < 128 for c in ENTRIES[i].get_str()) and \
++						ENTRIES[i].get_str().isupper()), "String %s is not uppercase" % ENTRIES[i].get_str()
++		if lowercase:
++			for i in range(len(ENTRIES)):
++				assert (all(ord(c) < 128 for c in ENTRIES[i].get_str()) and \
++						ENTRIES[i].get_str().islower()), "String %s is not lowercase" % ENTRIES[i].get_str()
++		if uppercase or lowercase:
++			outfile.write("static int %s_s2i(const char *s, int *value) {\n" \
++					"\tsize_t len, i;\n" \
++					"\tlen = strlen(s);\n" \
++					"\t{ char copy[len + 1];\n" \
++					"\tfor (i = 0; i < len; i++) {\n" \
++					"\t\tchar c = s[i];\n" % prefix)
++			if uppercase:
++				outfile.write("\t\tcopy[i] = GT_ISLOWER(c) ? c - 'a' + 'A' : c;\n")
++			else:
++				outfile.write("\t\tcopy[i] = GT_ISUPPER(c) ? c - 'A' + 'a' : c;\n")
++			outfile.write("\t}\n" \
++					"\tcopy[i] = 0;\n" \
++					"\treturn s2i__(%s_strings, %s_s2i_s, %s_s2i_i, %d, copy, value);\n" \
++					"\t}\n" \
++					"}\n" % (prefix, prefix, prefix, len(ENTRIES)))
++		else:
++			outfile.write("static int %s_s2i(const char *s, int *value) {\n" \
++					"\treturn s2i__(%s_strings, %s_s2i_s, %s_s2i_i, %d, s, value);\n" \
++					"}\n" % (prefix, prefix, prefix, prefix, len(ENTRIES)))
++	except:
++		# If an error is found, raise the exception so the main function can close
++		# and delete the outfile
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error in output_s2i:", exc_type, fname, exc_tb.tb_lineno)
++		raise
++
++def output_i2s(prefix, outfile, allow_duplicate_ints):
++	try:
++		# Check for duplicate values
++		for i in range(len(ENTRIES) - 1):
++			assert (ENTRIES[i].val <= ENTRIES[i + 1].val), "Entries not in the correct order"
++			if (not allow_duplicate_ints) and (ENTRIES[i].val == ENTRIES[i + 1].val):
++				print("Duplicate value %d: %s, %s" % (ENTRIES[i].val, ENTRIES[i].get_str(), \
++						ENTRIES[i + 1].get_str()))
++				raise
++		
++		# Find all of the unique values
++		unique_entries = []
++		for i in range(len(ENTRIES)):
++			# If the unique_entries is empty or the last unique_entries entry is different from the 
++			# entry being compared, append the entry
++			if (len(unique_entries) == 0) or (unique_entries[-1].val != ENTRIES[i].val):
++				unique_entries.append(ENTRIES[i])
++		
++		# Determine which mapping to use based on the treshold
++		max_val = unique_entries[-1].val
++		min_val = unique_entries[0].val
++		if ((float(max_val - min_val)/len(unique_entries)) <= DIRECT_THRESHOLD):
++			outfile.write("static const unsigned %s_i2s_direct[] = {" % prefix)
++			next_index = min_val
++			i = 0
++			while True:
++				if (((next_index - min_val) % 10) == 0):
++					outfile.write("\n\t")
++				while (unique_entries[i].val < next_index):
++					# This can happen if (allow_duplicate_ints)
++					i += 1
++				if (unique_entries[i].val == next_index):
++					assert(unique_entries[i].offset <= sys.maxint)
++					outfile.write("%i," % unique_entries[i].offset)
++				else:
++					outfile.write("-1u,")
++				if (next_index == max_val):
++					break
++				next_index += 1
++			outfile.write("\n};\nstatic const char *%s_i2s(int v) {\n" \
++					"\treturn i2s_direct__(%s_strings, %s_i2s_direct, %d, %d, v);\n" \
++					"}\n" % (prefix, prefix, prefix, min_val, max_val))
++		else:
++			outfile.write("static const int %s_i2s_i[] = {" % prefix)
++			for i in range(len(unique_entries)):
++				if (i % 10 == 0):
++					outfile.write("\n\t")
++				outfile.write("%i," % unique_entries[i].val)
++			outfile.write("\n};\nstatic const unsigned %s_i2s_s[] = {" % prefix)
++			for i in range(len(unique_entries)):
++				if (i % 10 == 0):
++					outfile.write("\n\t")
++				assert(unique_entries[i].offset <= sys.maxint)
++				outfile.write("%i," % unique_entries[i].offset)
++			outfile.write("\n };\n static const char *%s_i2s(int v) {\n" \
++					"\treturn i2s_bsearch__(%s_strings, %s_i2s_i, %s_i2s_s, %u, v);\n" \
++					"}\n" % (prefix, prefix, prefix, prefix, len(unique_entries)))
++	except:
++		# If an error is found, raise the exception so the main function can close
++		# and delete the outfile
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error in output_i2s:", exc_type, fname, exc_tb.tb_lineno)
++		raise
++
++def output_i2s_transtab(prefix, outfile):
++	"""
++		Output the string to integer mapping table as a transtab[].
++		values must be sorted in the desired order. 
++	"""
++	try:
++		outfile.write("static const struct transtab %s_table[] = {" % prefix)
++		for i in range(len(ENTRIES)):
++			if (i % NUM_ENTIRES_IN_LINE == 0):
++				outfile.write('\n\t')
++			outfile.write("{%i,%u}," % (ENTRIES[i].val, ENTRIES[i].offset))
++		outfile.write("\n};\n#define %s_NUM_ENTRIES (sizeof(%s_table) / sizeof(*%s_table))\n" % \
++				(prefix.upper(), prefix, prefix))
++	except:
++		# If an error is found, raise the exception so the main function can close
++		# and delete the outfile
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error in output_i2s_transtab:", exc_type, fname, exc_tb.tb_lineno)
++		raise
++
++def lookup_enum(look_str, buf):
++	try:
++		# Pull all of the enums out of the preprocessor output out only once
++		# to help speed up all of the lookups
++		if not hasattr(lookup_enum, "enums"):
++			if DEBUG:
++				print("Pulling out the enums from the preprocessor output")
++			# Regex pattern to parse out the enums from the preprocessor output
++			enum_regex = "enum.*?{(?P<s>.*?)}"
++			lookup_enum.enums = re.findall(enum_regex, buf, flags=(re.M | re.S))
++		
++		# find which enum contains the string we are looking for
++		for i in range(len(lookup_enum.enums)):
++			if look_str in lookup_enum.enums[i]:
++				# Determine the value of the variable in the enum
++				enum_string = "enum preproc { " + lookup_enum.enums[i] + " }"
++				enum_string = "".join([line.strip() for line in enum_string])
++				if DEBUG:
++					print("Found %s in %s" % (look_str, enum_string))
++				
++				identifier = Word(alphas, alphanums+'_')
++				opt_value = Word(nums, nums+'x+<>/*')
++				
++				enum_value = Group(identifier('name') + Optional(Suppress('=') + opt_value('value')))
++				enum_list = Group(enum_value + ZeroOrMore(Suppress(',') + enum_value))
++				enum = Suppress('enum') + identifier('enum') + Suppress('{') + enum_list('list') + \
++						Suppress('}')
++				enum.ignore(cppStyleComment)
++				
++				for item, start, stop in enum.scanString(enum_string):
++					temp = 0
++					for entry in item.list:
++						if DEBUG:
++							print("Checking %s against %s" % (look_str, entry.name))
++						if entry.name == look_str:
++							if entry.value != '':
++								# Need to call eval becuase some enums have math in them
++								try:
++									value = eval(entry.value)
++								except:
++									print("Found invalid value %s" % entry.value)
++							else:
++								value = temp
++							if DEBUG:
++								print("Matched the enum name to value %d" % value)
++							return value
++						temp += 1
++	except:
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error in output_i2s_transtab:", exc_type, fname, exc_tb.tb_lineno)
++	print("Unable to find enum value")
++	return None
++
++def evaluate_string(eval_str, buf):
++	if DEBUG:
++		print("Evaluating string %s" % eval_str)
++	
++	# Regex expression for pulling apart the values in the preprocessor output
++	eval_regex = "(?P<val>\w+)"
++	# Since the string can be anything, it must be parsed into individual parts
++	# and evaluated separately to find any enum values
++	matches = re.findall(eval_regex, eval_str)
++	if len(matches) <= 0:
++		print("Could not find any matches")
++	
++	local_s = eval_str
++	value = None
++	i = 0
++	for i in range(len(matches)):
++		try:
++			# If the current item is abled to evaled, there is nothing to do
++			val = eval(matches[i])
++		except:
++			try:
++				# Need to check to see if the last character is a "U" and remove it
++				# if this does not except, a valid number was found
++				if matches[i][-1] == 'U':
++					val = eval(matches[i][:-1])
++					local_s = local_s.replace(matches[i], "%d" % val)
++				else:
++					# Need to do a enum look up for anything that doesnt translate into a number
++					val = lookup_enum(matches[i], buf)
++					if val is not None:
++						local_s = local_s.replace(matches[i], "%d" % val)
++			except:
++				# This case will be hit if the "U" removal fails
++				val = lookup_enum(matches[i], buf)
++				if val is not None:
++					local_s = local_s.replace(matches[i], "%d" % val)
++	try:
++		# This will fail if all of the enums were not found rather
++		# than handling the failues in the above steps
++		# Also, need to convert to a signed 32 bit int for the output value
++		value = ctypes.c_int32(eval(local_s)).value
++		if DEBUG:
++			print("Found value %d for %s" % (value, matches[i]))
++	except:
++		print("Could not parse string %s" % local_s)
++	
++	# Verify the mess above resulted in a number being found
++	if value is None:
++		print("Failed to find value for %s" % eval_str)
++		raise
++	return value
++	
++def remove_output(outfile):
++	path = outfile.name
++	outfile.close()
++	os.remove(path)
++	sys.exit(1)
++
++def main():
++	
++	# Setup the argument parser and parse the arguments given
++	parser = argparse.ArgumentParser(description='Generate tables header files.')
++	parser.add_argument('--i2s', dest='gen_i2s', action='store_true', 
++			help='Generate i2s tables')
++	parser.add_argument('--i2s-transtab', dest='gen_i2s_transtab', action='store_true', 
++			help='Generate transtab tables')
++	parser.add_argument('--s2i', dest='gen_s2i', action='store_true', 
++			help='Generate s2i tables')
++	# Make sure uppercase and lowercase are mutually exclusive
++	group = parser.add_mutually_exclusive_group()
++	group.add_argument('--uppercase', dest='uppercase', action='store_true', 
++			help='All characters are uppercase')
++	group.add_argument('--lowercase', dest='lowercase', action='store_true', 
++			help='All characters are lowercase')
++	parser.add_argument('--duplicate-ints', dest='allow_duplicate_ints', action='store_true', 
++			help='Allow duplicate integers')
++	parser.add_argument('prefix', help='The prefix of the output file to use')
++	parser.add_argument('source', type=argparse.FileType('r'), 
++			help='The source of the preprocessor from the compiler')
++	parser.add_argument('output', type=argparse.FileType('w'), 
++			help='The output header file')
++	args = parser.parse_args()
++	
++	# Regex pattern to parse out the macro and string from the _S calls
++	source_regex = "{ \((?P<val>.*?)\), \(\"(?P<s>\S+)\"\), 0, 0 }"
++	
++	# First parse the header file for all of the preprocessor source that need to
++	# be looked up
++	buf = args.source.read()
++	matches = re.findall(source_regex, buf, flags=re.MULTILINE)
++	
++	# Check to make sure we have matches
++	if (len(matches) <= 0):
++		print("Failed to find valid source")
++		remove_output(args.output)
++		sys.exit(1)
++	
++	try:
++		# Create all of the entry structures
++		global ENTRIES
++		for i in range(len(matches)):
++			ENTRIES.append(Entry(matches[i][1], evaluate_string(matches[i][0], buf)))
++			ENTRIES[i].set_orig_index(i)
++			if DEBUG:
++				print(ENTRIES[i])
++		
++		# Sort the entries alphabetically
++		ENTRIES = sorted(ENTRIES, key=attrgetter('st'))
++		# Print out the output header
++		args.output.write("/* This is a generated file, see Makefile.am for its inputs. */\n")
++		output_strings(args.prefix, args.output)
++		if args.gen_s2i:
++			output_s2i(args.prefix, args.output, args.uppercase, args.lowercase)
++		if args.gen_i2s:
++			ENTRIES = sorted(ENTRIES, key=attrgetter('val'))
++			output_i2s(args.prefix, args.output, args.allow_duplicate_ints)
++		if args.gen_i2s_transtab:
++			ENTRIES = sorted(ENTRIES, key=attrgetter('orig_index'))
++			output_i2s_transtab(args.prefix, args.output)
++	except:
++		# On an error, close and remove the file before returning an error
++		print("Failed to write the output file correctly")
++		exc_type, exc_obj, exc_tb = sys.exc_info()
++		fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
++		print("Unexpected error:", exc_type, fname, exc_tb.tb_lineno)
++		remove_output(args.output)
++		sys.exit(1)
++
++if __name__ == '__main__':
++	main()
+diff -urN a/lib/Makefile.am b/lib/Makefile.am
+--- a/lib/Makefile.am	2013-07-29 16:37:01.000000000 -0500
++++ b/lib/Makefile.am	2013-08-19 14:39:58.280509378 -0500
+@@ -40,119 +40,109 @@
+ BUILT_SOURCES = actiontabs.h errtabs.h fieldtabs.h flagtabs.h \
+ 	ftypetabs.h i386_tables.h ia64_tables.h machinetabs.h \
+ 	msg_typetabs.h optabs.h ppc_tables.h s390_tables.h \
+-	s390x_tables.h x86_64_tables.h
+-if USE_ALPHA
+-BUILT_SOURCES += alpha_tables.h
+-endif
+-if USE_ARMEB
+-BUILT_SOURCES += armeb_tables.h
+-endif
+-if USE_AARCH64
+-BUILT_SOURCES += aarch64_tables.h
+-endif
+-noinst_PROGRAMS = gen_actiontabs_h gen_errtabs_h gen_fieldtabs_h \
++	s390x_tables.h x86_64_tables.h \
++	gen_actiontabs_h gen_errtabs_h gen_fieldtabs_h \
+ 	gen_flagtabs_h gen_ftypetabs_h gen_i386_tables_h \
+ 	gen_ia64_tables_h gen_machinetabs_h gen_msg_typetabs_h \
+ 	gen_optabs_h gen_ppc_tables_h gen_s390_tables_h \
+-	gen_s390x_tables_h gen_x86_64_tables_h
++	gen_s390x_tables_h gen_x86_64_tables_h 
+ if USE_ALPHA
+-noinst_PROGRAMS += gen_alpha_tables_h
++BUILT_SOURCES += alpha_tables.h gen_alpha_tables_h
+ endif
+ if USE_ARMEB
+-noinst_PROGRAMS += gen_armeb_tables_h
++BUILT_SOURCES += armeb_tables.h gen_armeb_tables_h
+ endif
+ if USE_AARCH64
+-noinst_PROGRAMS += gen_aarch64_tables_h
++BUILT_SOURCES += aarch64_tables.h gen_aarch64_tables_h
+ endif
+-gen_actiontabs_h_SOURCES = gen_tables.c gen_tables.h actiontab.h
+-gen_actiontabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="actiontab.h"'
++
++gen_actiontabs_h: gen_tables.c gen_tables.h actiontab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"actiontab.h\" -E -o $@ gen_tables.c
+ actiontabs.h: gen_actiontabs_h Makefile
+-	./gen_actiontabs_h --lowercase --i2s --s2i action > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i action gen_actiontabs_h $@
+ 
+ if USE_ALPHA
+-gen_alpha_tables_h_SOURCES = gen_tables.c gen_tables.h alpha_table.h
+-gen_alpha_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="alpha_table.h"'
++gen_alpha_tables_h: gen_tables.c gen_tables.h alpha_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"alpha_table.h\" -E -o $@ gen_tables.c
+ alpha_tables.h: gen_alpha_tables_h Makefile
+-	./gen_alpha_tables_h --lowercase --i2s --s2i alpha_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i alpha_syscall gen_alpha_tables_h $@
+ endif
+ 
+ if USE_ARMEB
+-gen_armeb_tables_h_SOURCES = gen_tables.c gen_tables.h armeb_table.h
+-gen_armeb_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="armeb_table.h"'
+-armeb_tables.h: gen_armeb_tables_h Makefile
+-	./gen_armeb_tables_h --lowercase --i2s --s2i armeb_syscall > $@
++gen_armeb_tables_h: gen_tables.c gen_tables.h armeb_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"armeb_table.h\" -E -o $@ gen_tables.c
++armeb_tables.h: gen_armeb_tables_h Makefile
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i armeb_syscall gen_armeb_tables_h $@
+ endif
+ 
+ if USE_AARCH64
+-gen_aarch64_tables_h_SOURCES = gen_tables.c gen_tables.h aarch64_table.h
+-gen_aarch64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="aarch64_table.h"'
++gen_aarch64_tables_h: gen_tables.c gen_tables.h aarch64_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"aarch64_table.h\" -E -o $@ gen_tables.c
+ aarch64_tables.h: gen_aarch64_tables_h Makefile
+-	./gen_aarch64_tables_h --lowercase --i2s --s2i aarch64_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i aarch64_syscall gen_aarch64_tables_h $@
+ endif
+ 
+-gen_errtabs_h_SOURCES = gen_tables.c gen_tables.h errtab.h
+-gen_errtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="errtab.h"'
++gen_errtabs_h: gen_tables.c gen_tables.h errtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"errtab.h\" -E -o $@ gen_tables.c
+ errtabs.h: gen_errtabs_h Makefile
+-	./gen_errtabs_h --duplicate-ints --uppercase --i2s --s2i err > $@
++	$(PYTHON) gen_tables.py --duplicate-ints --uppercase --i2s --s2i err gen_errtabs_h $@
+ 
+-gen_fieldtabs_h_SOURCES = gen_tables.c gen_tables.h fieldtab.h
+-gen_fieldtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="fieldtab.h"'
++gen_fieldtabs_h: gen_tables.c gen_tables.h fieldtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"fieldtab.h\" -E -o $@ gen_tables.c
+ fieldtabs.h: gen_fieldtabs_h Makefile
+-	./gen_fieldtabs_h --duplicate-ints --lowercase --i2s --s2i field > $@
++	$(PYTHON) gen_tables.py --duplicate-ints --lowercase --i2s --s2i field gen_fieldtabs_h $@
+ 
+-gen_flagtabs_h_SOURCES = gen_tables.c gen_tables.h flagtab.h
+-gen_flagtabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="flagtab.h"'
++gen_flagtabs_h: gen_tables.c gen_tables.h flagtab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"flagtab.h\" -E -o $@ gen_tables.c
+ flagtabs.h: gen_flagtabs_h Makefile
+-	./gen_flagtabs_h --lowercase --i2s --s2i flag > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i flag gen_flagtabs_h $@
+ 
+-gen_ftypetabs_h_SOURCES = gen_tables.c gen_tables.h ftypetab.h
+-gen_ftypetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ftypetab.h"'
++gen_ftypetabs_h: gen_tables.c gen_tables.h ftypetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ftypetab.h\" -E -o $@ gen_tables.c
+ ftypetabs.h: gen_ftypetabs_h Makefile
+-	./gen_ftypetabs_h --lowercase --i2s --s2i ftype > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i ftype gen_ftypetabs_h $@
+ 
+-gen_i386_tables_h_SOURCES = gen_tables.c gen_tables.h i386_table.h
+-gen_i386_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="i386_table.h"'
++gen_i386_tables_h: gen_tables.c gen_tables.h i386_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"i386_table.h\" -E -o $@ gen_tables.c
+ i386_tables.h: gen_i386_tables_h Makefile
+-	./gen_i386_tables_h --duplicate-ints --lowercase --i2s --s2i \
+-		i386_syscall > $@
++	$(PYTHON) gen_tables.py --duplicate-ints --lowercase --i2s --s2i i386_syscall gen_i386_tables_h $@
+ 
+-gen_ia64_tables_h_SOURCES = gen_tables.c gen_tables.h ia64_table.h
+-gen_ia64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ia64_table.h"'
++gen_ia64_tables_h: gen_tables.c gen_tables.h ia64_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ia64_table.h\" -E -o $@ gen_tables.c
+ ia64_tables.h: gen_ia64_tables_h Makefile
+-	./gen_ia64_tables_h --lowercase --i2s --s2i ia64_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i ia64_syscall gen_ia64_tables_h $@
+ 
+-gen_machinetabs_h_SOURCES = gen_tables.c gen_tables.h machinetab.h
+-gen_machinetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="machinetab.h"'
++gen_machinetabs_h: gen_tables.c gen_tables.h machinetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"machinetab.h\" -E -o $@ gen_tables.c
+ machinetabs.h: gen_machinetabs_h Makefile
+-	./gen_machinetabs_h --duplicate-ints --lowercase --i2s --s2i machine \
+-		> $@
++	$(PYTHON) gen_tables.py --duplicate-ints --lowercase --i2s --s2i machine gen_machinetabs_h $@
+ 
+-gen_msg_typetabs_h_SOURCES = gen_tables.c gen_tables.h msg_typetab.h
+-gen_msg_typetabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="msg_typetab.h"'
++gen_msg_typetabs_h: gen_tables.c gen_tables.h msg_typetab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"msg_typetab.h\" -E -o $@ gen_tables.c
+ msg_typetabs.h: gen_msg_typetabs_h Makefile
+-	./gen_msg_typetabs_h --uppercase --i2s --s2i msg_type > $@
++	$(PYTHON) gen_tables.py --uppercase --i2s --s2i msg_type gen_msg_typetabs_h $@
+ 
+-gen_optabs_h_SOURCES = gen_tables.c gen_tables.h optab.h
+-gen_optabs_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="optab.h"'
++gen_optabs_h: gen_tables.c gen_tables.h optab.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"optab.h\" -E -o $@ gen_tables.c
+ optabs.h: gen_optabs_h Makefile
+-	./gen_optabs_h --i2s op > $@
++	$(PYTHON) gen_tables.py --i2s op gen_optabs_h $@
+ 
+-gen_ppc_tables_h_SOURCES = gen_tables.c gen_tables.h ppc_table.h
+-gen_ppc_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="ppc_table.h"'
++gen_ppc_tables_h: gen_tables.c gen_tables.h ppc_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"ppc_table.h\" -E -o $@ gen_tables.c
+ ppc_tables.h: gen_ppc_tables_h Makefile
+-	./gen_ppc_tables_h --lowercase --i2s --s2i ppc_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i ppc_syscall gen_ppc_tables_h $@
+ 
+-gen_s390_tables_h_SOURCES = gen_tables.c gen_tables.h s390_table.h
+-gen_s390_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390_table.h"'
++gen_s390_tables_h: gen_tables.c gen_tables.h s390_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"s390_table.h\" -E -o $@ gen_tables.c
+ s390_tables.h: gen_s390_tables_h Makefile
+-	./gen_s390_tables_h --lowercase --i2s --s2i s390_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i s390_syscall gen_s390_tables_h $@
+ 
+-gen_s390x_tables_h_SOURCES = gen_tables.c gen_tables.h s390x_table.h
+-gen_s390x_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="s390x_table.h"'
++gen_s390x_tables_h: gen_tables.c gen_tables.h s390x_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"s390x_table.h\" -E -o $@ gen_tables.c
+ s390x_tables.h: gen_s390x_tables_h Makefile
+-	./gen_s390x_tables_h --lowercase --i2s --s2i s390x_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i s390x_syscall gen_s390x_tables_h $@
+ 
+-gen_x86_64_tables_h_SOURCES = gen_tables.c gen_tables.h x86_64_table.h
+-gen_x86_64_tables_h_CFLAGS = $(AM_CFLAGS) '-DTABLE_H="x86_64_table.h"'
++gen_x86_64_tables_h: gen_tables.c gen_tables.h x86_64_table.h
++	$(CC) $(INCLUDES) $(AM_CFLAGS) $(CFLAGS) -DTABLE_H=\"x86_64_table.h\" -E -o $@ gen_tables.c
+ x86_64_tables.h: gen_x86_64_tables_h Makefile
+-	./gen_x86_64_tables_h --lowercase --i2s --s2i x86_64_syscall > $@
++	$(PYTHON) gen_tables.py --lowercase --i2s --s2i x86_64_syscall gen_x86_64_tables_h $@
diff --git a/package/audit/audit-2.3.1-remove-zos-plugin.patch b/package/audit/audit-2.3.1-remove-zos-plugin.patch
new file mode 100644
index 0000000..6c07402
--- /dev/null
+++ b/package/audit/audit-2.3.1-remove-zos-plugin.patch
@@ -0,0 +1,31 @@
+--- a/audisp/plugins/Makefile.am	2012-08-28 10:33:03.582396601 -0500
++++ b/audisp/plugins/Makefile.am	2012-08-28 10:33:14.162399662 -0500
+@@ -22,7 +22,7 @@
+ 
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ 
+-SUBDIRS = builtins zos-remote remote
++SUBDIRS = builtins remote
+ #SUBDIRS = builtins zos-remote
+ if HAVE_PRELUDE
+ SUBDIRS += prelude
+--- a/audisp/plugins/Makefile.in	2012-08-28 10:33:03.592380390 -0500
++++ b/audisp/plugins/Makefile.in	2012-08-28 10:35:38.482397668 -0500
+@@ -84,7 +84,7 @@
+ 	distdir
+ ETAGS = etags
+ CTAGS = ctags
+-DIST_SUBDIRS = builtins zos-remote remote prelude
++DIST_SUBDIRS = builtins remote prelude
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ am__relativize = \
+   dir0=`pwd`; \
+@@ -242,7 +242,7 @@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+-SUBDIRS = builtins zos-remote remote $(am__append_1)
++SUBDIRS = builtins remote $(am__append_1)
+ all: all-recursive
+ 
+ .SUFFIXES:
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
new file mode 100644
index 0000000..08f3100
--- /dev/null
+++ b/package/audit/audit.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# audit
+#
+#############################################################
+
+AUDIT_VERSION:=2.3.2
+AUDIT_SOURCE:=audit-$(AUDIT_VERSION).tar.gz
+AUDIT_SITE:=http://people.redhat.com/sgrubb/audit/
+AUDIT_DEPENDENCIES = host-python-pyparsing
+AUDIT_LICENSE       = GPLv2
+AUDIT_LICENSE_FILES = COPYING
+
+AUDIT_INSTALL_STAGING = YES
+AUDIT_INSTALL_TARGET = YES
+
+AUDIT_AUTORECONF = YES
+AUDIT_AUTORECONF_OPT = -i -s -I m4
+
+# Audit will be looking for applications to be in the root
+# /sbin folder rather than in /usr/sbin folder
+AUDIT_CONF_OPT += --sbindir=/sbin
+
+ifeq ($(BR2_PACKAGE_AUDIT_PYTHON_BINDINGS),y)
+	AUDIT_DEPENDENCIES += python
+	AUDIT_CONF_OPT += --with-python=yes
+else
+	AUDIT_CONF_OPT += --with-python=no
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT_LIBCAP_NG),y)
+	AUDIT_DEPENDENCIES += libcap-ng
+	AUDIT_CONF_OPT += --with-libcap-ng=yes
+else
+	AUDIT_CONF_OPT += --with-libcap-ng=no
+endif
+
+ifeq ($(BR2_armeb),y)
+	AUDIT_CONF_OPT += --with-armeb
+endif
+ifeq ($(BR2_arm),y)
+	AUDIT_CONF_OPT += --with-armeb
+endif
+ifeq ($(BR2_aarch64),y)
+	AUDIT_CONF_OPT += --with-aarch64
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	AUDIT_CONF_OPT += --enable-shared=no
+else
+	AUDIT_CONF_OPT += --enable-static=no
+endif
+
+define AUDIT_REPLACE_STARTUP_SCRIPT
+	$(INSTALL) -m 755 package/audit/S14auditd $(TARGET_DIR)/etc/init.d/
+	rm -rf $(TARGET_DIR)/etc/rc.d/
+endef
+
+AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_REPLACE_STARTUP_SCRIPT
+
+$(eval $(autotools-package))
-- 
1.7.1
