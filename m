From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:18 +0200
Subject: [Buildroot] [PATCH 22/34] High availability: add packages
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-22-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cluster-glue
corosync
heartbeat
libqb
pacemaker
---
 package/Config.in                                  |   8 ++
 package/cluster-glue/0001-fix-cross-compile.patch  |  26 +++++
 package/cluster-glue/Config.in                     |   9 ++
 package/cluster-glue/cluster-glue.hash             |   2 +
 package/cluster-glue/cluster-glue.mk               |  23 +++++
 package/corosync/Config.in                         |   8 ++
 package/corosync/corosync.hash                     |   2 +
 package/corosync/corosync.mk                       |  17 ++++
 package/heartbeat/0001-fix-cross-compilation.patch | 107 +++++++++++++++++++++
 .../heartbeat/0002-avoid-strip-perm-issue.patch    |  10 ++
 package/heartbeat/Config.in                        |  10 ++
 package/heartbeat/heartbeat.hash                   |   2 +
 package/heartbeat/heartbeat.mk                     |  37 +++++++
 package/libqb/Config.in                            |  11 +++
 package/libqb/libqb.hash                           |   2 +
 package/libqb/libqb.mk                             |  20 ++++
 package/pacemaker/Config.in                        |   9 ++
 package/pacemaker/pacemaker.hash                   |   2 +
 package/pacemaker/pacemaker.mk                     |  32 ++++++
 19 files changed, 337 insertions(+)
 create mode 100644 package/cluster-glue/0001-fix-cross-compile.patch
 create mode 100644 package/cluster-glue/Config.in
 create mode 100644 package/cluster-glue/cluster-glue.hash
 create mode 100644 package/cluster-glue/cluster-glue.mk
 create mode 100644 package/corosync/Config.in
 create mode 100644 package/corosync/corosync.hash
 create mode 100644 package/corosync/corosync.mk
 create mode 100644 package/heartbeat/0001-fix-cross-compilation.patch
 create mode 100644 package/heartbeat/0002-avoid-strip-perm-issue.patch
 create mode 100644 package/heartbeat/Config.in
 create mode 100644 package/heartbeat/heartbeat.hash
 create mode 100644 package/heartbeat/heartbeat.mk
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk
 create mode 100644 package/pacemaker/Config.in
 create mode 100644 package/pacemaker/pacemaker.hash
 create mode 100644 package/pacemaker/pacemaker.mk

diff --git a/package/Config.in b/package/Config.in
index 76665e6..e09655d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -902,6 +902,14 @@ menu "Hardware handling"
 	source "package/urg/Config.in"
 endmenu
 
+menu "High availability"
+	source "package/cluster-glue/Config.in"
+	source "package/corosync/Config.in"
+	source "package/heartbeat/Config.in"
+	source "package/libqb/Config.in"
+	source "package/pacemaker/Config.in"
+endmenu
+
 menu "Javascript"
 	source "package/angularjs/Config.in"
 	source "package/bootstrap/Config.in"
diff --git a/package/cluster-glue/0001-fix-cross-compile.patch b/package/cluster-glue/0001-fix-cross-compile.patch
new file mode 100644
index 0000000..2f8bd47
--- /dev/null
+++ b/package/cluster-glue/0001-fix-cross-compile.patch
@@ -0,0 +1,26 @@
+--- cluster-glue-0a7add1d9996/configure.ac~	2014-10-16 19:24:17.000000000 +0200
++++ cluster-glue-0a7add1d9996/configure.ac	2016-02-26 15:39:02.732961215 +0100
+@@ -231,23 +231,6 @@ esac
+ AC_SUBST(INITDIR)
+ 
+ AC_MSG_NOTICE(Sanitizing libdir: ${libdir})
+-case $libdir in
+-  dnl For consistency with Heartbeat, map NONE->$prefix
+-  *prefix*|NONE)
+-    AC_MSG_CHECKING(which lib directory to use)
+-    for aDir in lib64 lib
+-    do
+-      trydir="${exec_prefix}/${aDir}"
+-      if
+-        test -d ${trydir}
+-      then
+-        libdir=${trydir}
+-        break
+-      fi
+-    done
+-    AC_MSG_RESULT($libdir);
+-    ;;
+-esac
+ 
+ DLOPEN_FORCE_FLAGS=""
+ AC_SUBST(DLOPEN_FORCE_FLAGS)
diff --git a/package/cluster-glue/Config.in b/package/cluster-glue/Config.in
new file mode 100644
index 0000000..8b39152
--- /dev/null
+++ b/package/cluster-glue/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CLUSTER_GLUE
+	bool "cluster-glue"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Cluster Glue is a set of libraries, tools and utilities suitable for
+	  the Heartbeat/Pacemaker cluster stack.
+
+	  http://www.linux-ha.org/wiki/Cluster_Glue
diff --git a/package/cluster-glue/cluster-glue.hash b/package/cluster-glue/cluster-glue.hash
new file mode 100644
index 0000000..abd1a74
--- /dev/null
+++ b/package/cluster-glue/cluster-glue.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c47bfffbfe11401379d5248fc7518a3de9532c02090d614f314037fc3a7c4ceb  0a7add1d9996.tar.bz2
diff --git a/package/cluster-glue/cluster-glue.mk b/package/cluster-glue/cluster-glue.mk
new file mode 100644
index 0000000..abe3697
--- /dev/null
+++ b/package/cluster-glue/cluster-glue.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cluster-glue
+#
+################################################################################
+
+CLUSTER_GLUE_VERSION = 0a7add1d9996
+CLUSTER_GLUE_SOURCE = $(CLUSTER_GLUE_VERSION).tar.bz2
+CLUSTER_GLUE_SITE =  http://hg.linux-ha.org/glue/archive
+CLUSTER_GLUE_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
+CLUSTER_GLUE_LICENSE_FILES = COPYING COPYING.LIB
+CLUSTER_GLUE_DEPENDENCIES += host-pkgconf host-python libtool util-linux bzip2 libglib2 libxml2
+
+CLUSTER_GLUE_INSTALL_STAGING = YES
+CLUSTER_GLUE_AUTORECONF = YES
+
+CLUSTER_GLUE_CONF_ENV += PYTHON=$(HOST_DIR)/usr/bin/python
+
+CLUSTER_GLUE_CONF_OPTS += \
+	--with-initdir=/etc/init.d \
+	ac_cv_path_XML2CONFIG="$(STAGING_DIR)/usr/bin/xml2-config"
+
+$(eval $(autotools-package))
diff --git a/package/corosync/Config.in b/package/corosync/Config.in
new file mode 100644
index 0000000..3855136
--- /dev/null
+++ b/package/corosync/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_COROSYNC
+	bool "corosync"
+	help
+	  The Corosync Cluster Engine is a Group Communication System with
+	  additional features for implementing high availability within
+	  applications. 
+
+	  https://corosync.github.io/corosync/
diff --git a/package/corosync/corosync.hash b/package/corosync/corosync.hash
new file mode 100644
index 0000000..dbfddd0
--- /dev/null
+++ b/package/corosync/corosync.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	64ee50f783a4bfa8a63fd576090cf7dd1810f3c60e01b4886723b87c5ff2b013  corosync-1.4.8.tar.gz
diff --git a/package/corosync/corosync.mk b/package/corosync/corosync.mk
new file mode 100644
index 0000000..7d36c75
--- /dev/null
+++ b/package/corosync/corosync.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# corosync
+#
+################################################################################
+
+COROSYNC_VERSION = 1.4.8
+COROSYNC_SOURCE = corosync-$(COROSYNC_VERSION).tar.gz
+COROSYNC_SITE = http://build.clusterlabs.org/corosync/releases
+COROSYNC_LICENSE = BSD-3c except for crypto.[ch], public domain for crypto.[ch]
+COROSYNC_LICENSE_FILES = LICENSE
+COROSYNC_INSTALL_STAGING = YES
+COROSYNC_DEPENDENCIES += host-pkgconf libnss
+
+COROSYNC_CONF_OPTS += ac_cv_func_fnmatch_works=yes
+
+$(eval $(autotools-package))
diff --git a/package/heartbeat/0001-fix-cross-compilation.patch b/package/heartbeat/0001-fix-cross-compilation.patch
new file mode 100644
index 0000000..4a653f6
--- /dev/null
+++ b/package/heartbeat/0001-fix-cross-compilation.patch
@@ -0,0 +1,107 @@
+--- Heartbeat-3-0-958e11be8686/configure.ac~	2016-02-25 19:13:54.488125586 +0100
++++ Heartbeat-3-0-958e11be8686/configure.ac	2016-02-26 12:28:12.366938641 +0100
+@@ -274,55 +274,7 @@ dnl Test to see whether library director
+ dnl ************************************************************************
+ 
+ AC_MSG_CHECKING(for proper library directory suffix)
+-tmpdir=$srcdir
+-tmpCfile=${tmpdir}/$$test.c
+-tmpOutfile=${tmpdir}/$$test
+-echo 'int main(int argc, char** argv) { return(1);}' >$tmpCfile
+-if
+-  ${CC} ${CFLAGS} ${tmpCfile} -o ${tmpOutfile}
+-then
+-  LIBC=`${LDD} ${tmpOutfile} | grep libc | sed -e 's%.*=> *%%' -e 's% .*$%%'`
+-  LibCdir=`dirname $LIBC`
+-  dirlist=`echo $LibCdir | tr '/' ' '`
+-  LibDirSuffix=unknown
+-  for dir in $dirlist
+-  do
+-    case $dir in
+-      *lib*)	LibDirSuffix=$dir; break;;
+-      *);;
+-    esac
+-  done
+-  case $LibDirSuffix in
+-    unknown)	LibDirSuffix=`basename $LibCdir`;;
+-  esac
+-  OutFileType=`file $tmpOutfile`
+-  rm -f $tmpCfile $tmpOutfile
+-else
+-  AC_MSG_ERROR([Cannot Compile trivial C program])
+-fi
+-#
+-#	The code above doesn't work right everywhere
+-#		(like Fedora and OpenBSD) 
+-#
+-case ${LibDirSuffix} in
+-	*lib*)	: Cool;;
+-	*)	: Sigh...
+-		case $OutFileType in
+-		  *64-bit*)	
+-		  	case $host_os in
+-			  openbsd*)	LibDirSuffix=lib;;
+-		  	  *)		LibDirSuffix=lib64;;
+-			esac;;
+-		  *32-bit*)	LibDirSuffix=lib;;
+-		  *)		LibDirSuffix=lib;;
+-		esac;;
+-esac
+-#
+-#	This may not yet be quite right for PPC where the default
+-#	is to produce 32-bit binaries, even though the OS is 64-bit
+-#	or for that matter for system Z, But, it's a lot better than
+-#	it used to be.
+-#
++LibDirSuffix=lib
+ AC_MSG_RESULT($LibDirSuffix)
+ 
+ case $libdir in
+@@ -386,7 +338,6 @@ else
+    AC_MSG_FAILURE(Core development headers were not found)
+ fi
+ 
+-CPPFLAGS="$CPPFLAGS -I${prefix}/include/heartbeat"
+ AC_CHECK_HEADERS(glue_config.h)
+ if test "$ac_cv_header_glue_config_h" != "yes";  then
+    AC_MSG_FAILURE(Core development headers were not found)
+@@ -2022,24 +1973,11 @@ AC_CHECK_HEADERS(bzlib.h, , [bz2_install
+ AC_CHECK_LIB(bz2, BZ2_bzBuffToBuffCompress , , [bz2_installed="no"])
+ AM_CONDITIONAL(BUILD_BZ2_COMPRESS_MODULE, test "x${bz2_installed}" = "xyes")
+ 
+-dnl check if there are getpid() inconsistency
+-dnl	Note: reduce LIBS; in particular, ltdl can cause confusion.
+-dnl	Possibly better:  move 'LIBS="$LIBS -lltdl"' from above to beyond here.
+-dnl
+-AC_MSG_CHECKING(for getpid() consistency in multi-process/threads program)
+-ac_save_LIBS=$LIBS
+-LIBS="-lpthread"
+-AC_TRY_RUN(`cat $srcdir/config/pidtest.c`, 
+-AC_MSG_RESULT(ok), 
+-[AC_MSG_RESULT(fail); AC_DEFINE(GETPID_INCONSISTENT, 1 , [pid inconsistent])],)
+-LIBS=$ac_save_LIBS
+-
+ dnl check byte order
+ AC_MSG_CHECKING(for byteorder)
+-AC_TRY_RUN(`cat $srcdir/config/byteorder_test.c`,
+-[AC_MSG_RESULT(little-endian); AC_DEFINE(CONFIG_LITTLE_ENDIAN, 1, [little-endian])],
+-[AC_MSG_RESULT(big-endian); AC_DEFINE(CONFIG_BIG_ENDIAN, 1, [big-endian])],)
+-
++AC_C_BIGENDIAN(
++	[AC_MSG_RESULT(big-endian); AC_DEFINE(CONFIG_BIG_ENDIAN, 1, [big-endian])],
++	[AC_MSG_RESULT(little-endian); AC_DEFINE(CONFIG_LITTLE_ENDIAN, 1, [little-endian])])
+ 
+ dnl
+ dnl Lex and yacc can't be trusted to produce code that won't produce
+--- heartbeat-958e11be8686/membership/ccm/Makefile.am~	2015-02-09 17:04:41.000000000 +0100
++++ heartbeat-958e11be8686/membership/ccm/Makefile.am	2016-02-26 13:06:41.678114297 +0100
+@@ -21,8 +21,7 @@ MAINTAINERCLEANFILES    = Makefile.in
+ 
+ AM_CPPFLAGS		= -I$(top_builddir)/include -I$(top_srcdir)/include \
+ 			-I$(top_builddir)/linux-ha -I$(top_srcdir)/linux-ha \
+-			-I$(top_builddir)/libltdl -I$(top_srcdir)/libltdl \
+-                        -I$(includedir)/clplumbing
++			-I$(top_builddir)/libltdl -I$(top_srcdir)/libltdl
+ 
+ halibexecdir		= $(libexecdir)/@HB_PKG@
+ ccmlibdir		= $(halibexecdir)
diff --git a/package/heartbeat/0002-avoid-strip-perm-issue.patch b/package/heartbeat/0002-avoid-strip-perm-issue.patch
new file mode 100644
index 0000000..f4e805a
--- /dev/null
+++ b/package/heartbeat/0002-avoid-strip-perm-issue.patch
@@ -0,0 +1,10 @@
+--- Heartbeat-3-0-958e11be8686/tools/Makefile.am~	2015-02-09 17:04:41.000000000 +0100
++++ Heartbeat-3-0-958e11be8686/tools/Makefile.am	2016-02-27 01:13:40.102433992 +0100
+@@ -49,6 +49,6 @@ cl_respawn_LDADD	= -lplumb	\
+ 
+ install-data-hook:    # install-exec-hook doesn't work (!)
+ 	-chgrp $(apigid) $(DESTDIR)/$(habindir)/cl_status
+-	-chmod g+s,a-w $(DESTDIR)/$(habindir)/cl_status
++	-chmod g+s,g-w,o-w $(DESTDIR)/$(habindir)/cl_status
+ 
+ .PHONY: install-exec-hook
diff --git a/package/heartbeat/Config.in b/package/heartbeat/Config.in
new file mode 100644
index 0000000..0f8ee80
--- /dev/null
+++ b/package/heartbeat/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HEARTBEAT
+	bool "heartbeat"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_IPROUTE2
+	help
+	  Heartbeat is a daemon that provides cluster infrastructure
+	  (communication and membership) services to its clients.
+
+	  http://www.linux-ha.org/wiki/Heartbeat
diff --git a/package/heartbeat/heartbeat.hash b/package/heartbeat/heartbeat.hash
new file mode 100644
index 0000000..ff85472
--- /dev/null
+++ b/package/heartbeat/heartbeat.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	851d2add2c129fef9fede764fec80229e1f6e7295e0e979950d10258648b462c  958e11be8686.tar.bz2
diff --git a/package/heartbeat/heartbeat.mk b/package/heartbeat/heartbeat.mk
new file mode 100644
index 0000000..eedf40f
--- /dev/null
+++ b/package/heartbeat/heartbeat.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# heartbeat
+#
+################################################################################
+HEARTBEAT_VERSION = 958e11be8686
+HEARTBEAT_SOURCE = $(HEARTBEAT_VERSION).tar.bz2
+HEARTBEAT_SITE =  http://hg.linux-ha.org/heartbeat-STABLE_3_0/archive
+HEARTBEAT_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
+HEARTBEAT_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
+HEARTBEAT_DEPENDENCIES += host-pkgconf host-python libtool util-linux bzip2 cluster-glue
+HEARTBEAT_INSTALL_STAGING = YES
+HEARTBEAT_AUTORECONF = YES
+
+HEARTBEAT_CONF_ENV += PYTHON=$(HOST_DIR)/usr/bin/python
+
+HEARTBEAT_CONF_OPTS += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/heartbeat -I$(STAGING_DIR)/usr/include/clplumbing" \
+	--with-initdir=/etc/init.d \
+	--with-initdefdir=/etc/sysconfig \
+	ac_cv_path_IP2UTIL=/sbin/ip
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+define HEARTBEAT_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/share/heartbeat -name '*.py' -print0 | xargs -0 rm -f
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+define HEARTBEAT_FINALIZE_TARGET
+	find $(TARGET_DIR)/usr/share/heartbeat -name '*.py[co]' -print0 | xargs -0 rm -f
+endef
+endif
+
+TARGET_FINALIZE_HOOKS += HEARTBEAT_FINALIZE_TARGET
+
+$(eval $(autotools-package))
diff --git a/package/libqb/Config.in b/package/libqb/Config.in
new file mode 100644
index 0000000..bafe166
--- /dev/null
+++ b/package/libqb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBQB
+	bool "libqb"
+	help
+	  libqb is a library with the primary purpose of providing high
+	  performance client server reusable features. It provides high
+	  performance logging, tracing, ipc, and poll.
+
+	  The initial features of libqb comes from the features of corosync that
+	  were thought to useful to other projects.
+
+	  https://github.com/ClusterLabs/libqb/wiki
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
new file mode 100644
index 0000000..34afcb3
--- /dev/null
+++ b/package/libqb/libqb.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	11d69568a3b99c841535fdeacdad92f0d95af73a73beb77a3912dd29dc434744 libqb-0.17.2.tar.gz
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
new file mode 100644
index 0000000..a300626
--- /dev/null
+++ b/package/libqb/libqb.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libqb
+#
+################################################################################
+
+LIBQB_VERSION = 0.17.2
+LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
+LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.gz
+LIBQB_LICENSE = LGPLv2.1+
+LIBQB_LICENSE_FILES = COPYING
+LIBQB_INSTALL_STAGING = YES
+LIBQB_AUTORECONF = YES
+
+define LIBQB_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+LIBQB_POST_PATCH_HOOKS += LIBQB_CREATE_M4_DIR
+
+$(eval $(autotools-package))
diff --git a/package/pacemaker/Config.in b/package/pacemaker/Config.in
new file mode 100644
index 0000000..3719bb5
--- /dev/null
+++ b/package/pacemaker/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PACEMAKER
+	bool "pacemaker"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  High-Availability cluster resource manager for Heartbeat as
+	  well as Corosync. 
+
+	  http://clusterlabs.org/
diff --git a/package/pacemaker/pacemaker.hash b/package/pacemaker/pacemaker.hash
new file mode 100644
index 0000000..f06a18c
--- /dev/null
+++ b/package/pacemaker/pacemaker.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	2f73043a5de5e66a47462d37cd68c4c6861f71a03c0ea02eb4ae2b1a550cd7b0  pacemaker-Pacemaker-1.1.14.tar.gz
diff --git a/package/pacemaker/pacemaker.mk b/package/pacemaker/pacemaker.mk
new file mode 100644
index 0000000..d987277
--- /dev/null
+++ b/package/pacemaker/pacemaker.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# pacemaker
+#
+################################################################################
+
+PACEMAKER_VERSION = Pacemaker-1.1.14
+PACEMAKER_SITE = $(call github,ClusterLabs,pacemaker,$(PACEMAKER_VERSION))
+PACEMAKER_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
+PACEMAKER_LICENSE_FILES = COPYING COPYING.LIB
+PACEMAKER_DEPENDENCIES += host-pkgconf host-python libtool util-linux bzip2 libxml2 libxslt corosync heartbeat libqb
+PACEMAKER_INSTALL_STAGING = YES
+PACEMAKER_AUTORECONF = YES
+
+PACEMAKER_CONF_ENV += PYTHON=$(HOST_DIR)/usr/bin/python
+
+# This program configure script expects the proper -I flags in CFLAGS and not
+# CPPFLAGS
+PACEMAKER_CONF_OPTS += \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/heartbeat" \
+	ac_cv_path_HTML2TXT="" \
+	ac_cv_path_HELP2MAN="" \
+	ac_cv_path_POD2MAN="" \
+	ac_cv_path_ASCIIDOC="" \
+	ac_cv_path_PUBLICAN="" \
+	ac_cv_path_INKSCAPE="" \
+	ac_cv_path_XSLTPROC="" \
+	ac_cv_path_XMLCATALOG="" \
+	ac_cv_path_FOP="" \
+	ac_cv_path_XML2CONFIG="$(STAGING_DIR)/usr/bin/xml2-config"
+
+$(eval $(autotools-package))
-- 
2.7.4
