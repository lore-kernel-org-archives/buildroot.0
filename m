From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 21 Dec 2015 16:18:57 +0200
Subject: [Buildroot] [PATCH 1/1] new packages: yp-tools, ypbind-mt
In-Reply-To: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
Message-ID: <1450707537-30154-3-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Adds the yp-tools and ypbind-mt packages required to use NIS and to
use NFS autofs-mounted partitions.

Note that to rebuild ypbind-mt you must rebuild nfs-utils, libtirpc,
yp-tools and ypbind-mt together.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in                                  |    2 +
 ...nge-do_ypcall_tr-param-resp-to-ypresp_val.patch |  130 ++++++++++++++++++++
 package/yp-tools/Config.in                         |   17 +++
 package/yp-tools/mapv4v6addr.h                     |   69 +++++++++++
 package/yp-tools/yp-tools.mk                       |   32 +++++
 .../ypbind-mt/0001-Remove_man_dir_from_build.patch |   14 +++
 package/ypbind-mt/Config.in                        |   14 +++
 package/ypbind-mt/ypbind-mt.mk                     |   21 ++++
 package/ypbind-mt/ypbind.rc                        |   99 +++++++++++++++
 9 files changed, 398 insertions(+)
 create mode 100644 package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch
 create mode 100644 package/yp-tools/Config.in
 create mode 100644 package/yp-tools/mapv4v6addr.h
 create mode 100644 package/yp-tools/yp-tools.mk
 create mode 100644 package/ypbind-mt/0001-Remove_man_dir_from_build.patch
 create mode 100644 package/ypbind-mt/Config.in
 create mode 100644 package/ypbind-mt/ypbind-mt.mk
 create mode 100755 package/ypbind-mt/ypbind.rc

diff --git a/package/Config.in b/package/Config.in
index db62c82..1395170 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -185,6 +185,8 @@ menu "Filesystem and flash utilities"
 	source "package/sunxi-tools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
+	source "package/yp-tools/Config.in"
+	source "package/ypbind-mt/Config.in"
 endmenu
 
 menu "Fonts, cursors, icons, sounds and themes"
diff --git a/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch b/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch
new file mode 100644
index 0000000..8f71900
--- /dev/null
+++ b/package/yp-tools/0001-Change-do_ypcall_tr-param-resp-to-ypresp_val.patch
@@ -0,0 +1,130 @@
+From 5041c0f037a2bc9ae593f943894652ac9e3b567f Mon Sep 17 00:00:00 2001
+From: Jonathan Ben Avraham <yba@tkos.co.il>
+Date: Wed, 16 Dec 2015 13:03:05 +0200
+Subject: [PATCH 1/1] Change do_ypcall_tr param resp to ypresp_val *
+
+The do_ypcall_tr "resp" parameter is type caddr_t. This necessitates a cast to
+ypresp_val * to reference resp->status for use as an argument to ypprot_err
+which provides the return value for do_ypcall_tr.
+
+Since caddr_t and ypresp_val * can have different alignments on some archs such
+as arm, GCC -Wcast-align will issue a warning which yp-tools is configured to
+treat as an error.
+
+This commit changes the type of the resp parameter of do_ypcall_tr from caddr_t
+to ypresp_val * in order to avoid the posibility of an unaligned cast.
+
+Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
+---
+ lib/do_ypcall.c  |   10 +++-------
+ lib/internal.h   |    2 +-
+ lib/yp_maplist.c |    2 +-
+ lib/yp_master.c  |    2 +-
+ lib/yp_match.c   |    2 +-
+ lib/yp_next.c    |    2 +-
+ lib/yp_order.c   |    2 +-
+ 7 files changed, 9 insertions(+), 13 deletions(-)
+
+diff --git a/lib/do_ypcall.c b/lib/do_ypcall.c
+index 37d7060..17db14a 100644
+--- a/lib/do_ypcall.c
++++ b/lib/do_ypcall.c
+@@ -450,15 +450,11 @@ do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
+ /* Like do_ypcall, but translate the status value if necessary.  */
+ int
+ do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
+-	      caddr_t req, xdrproc_t xres, caddr_t resp)
++	      caddr_t req, xdrproc_t xres, ypresp_val *resp)
+ {
+-  int status = do_ypcall (domain, prog, xargs, req, xres, resp);
++  int status = do_ypcall (domain, prog, xargs, req, xres, (caddr_t)resp);
+   if (status == YPERR_SUCCESS)
+-    /* We cast to ypresp_val although the pointer could also be of
+-       type ypresp_key_val or ypresp_master or ypresp_order or
+-       ypresp_maplist.  But the stat element is in a common prefix so
+-       this does not matter.  */
+-    status = ypprot_err (((struct ypresp_val *) resp)->status);
++    status = ypprot_err (resp->status);
+   return status;
+ }
+ 
+diff --git a/lib/internal.h b/lib/internal.h
+index c882b84..68236f6 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -19,6 +19,6 @@
+ extern int do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
+ 		      caddr_t req, xdrproc_t xres, caddr_t resp);
+ extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
+-			 caddr_t req, xdrproc_t xres, caddr_t resp);
++			 caddr_t req, xdrproc_t xres, struct ypresp_val *resp);
+ extern int yp_maplist (const char *, struct ypmaplist **);
+ #endif
+diff --git a/lib/yp_maplist.c b/lib/yp_maplist.c
+index f5980bb..9a1e180 100644
+--- a/lib/yp_maplist.c
++++ b/lib/yp_maplist.c
+@@ -35,7 +35,7 @@ yp_maplist (const char *indomain, struct ypmaplist **outmaplist)
+ 
+   result = do_ypcall_tr (indomain, YPPROC_MAPLIST, (xdrproc_t) xdr_domainname,
+                          (caddr_t) &indomain, (xdrproc_t) xdr_ypresp_maplist,
+-                         (caddr_t) &resp);
++                         (ypresp_val *) &resp);
+ 
+   if (result == YPERR_SUCCESS)
+     {
+diff --git a/lib/yp_master.c b/lib/yp_master.c
+index 6571ec4..d12a146 100644
+--- a/lib/yp_master.c
++++ b/lib/yp_master.c
+@@ -41,7 +41,7 @@ yp_master (const char *indomain, const char *inmap, char **outname)
+ 
+   result = do_ypcall_tr (indomain, YPPROC_MASTER, (xdrproc_t) xdr_ypreq_nokey,
+                          (caddr_t) &req, (xdrproc_t) xdr_ypresp_master,
+-                         (caddr_t) &resp);
++                         (ypresp_val *) &resp);
+ 
+   if (result != YPERR_SUCCESS)
+     return result;
+diff --git a/lib/yp_match.c b/lib/yp_match.c
+index b373111..c06cbe7 100644
+--- a/lib/yp_match.c
++++ b/lib/yp_match.c
+@@ -46,7 +46,7 @@ yp_match (const char *indomain, const char *inmap, const char *inkey,
+ 
+   result = do_ypcall_tr (indomain, YPPROC_MATCH, (xdrproc_t) xdr_ypreq_key,
+                          (caddr_t) &req, (xdrproc_t) xdr_ypresp_val,
+-                         (caddr_t) &resp);
++                         (ypresp_val *) &resp);
+ 
+   if (result != YPERR_SUCCESS)
+     return result;
+diff --git a/lib/yp_next.c b/lib/yp_next.c
+index 9520ed0..f45e21d 100644
+--- a/lib/yp_next.c
++++ b/lib/yp_next.c
+@@ -48,7 +48,7 @@ yp_next (const char *indomain, const char *inmap, const char *inkey,
+ 
+   result = do_ypcall_tr (indomain, YPPROC_NEXT, (xdrproc_t) xdr_ypreq_key,
+                          (caddr_t) &req, (xdrproc_t) xdr_ypresp_key_val,
+-                         (caddr_t) &resp);
++                         (ypresp_val *) &resp);
+ 
+   if (result != YPERR_SUCCESS)
+     return result;
+diff --git a/lib/yp_order.c b/lib/yp_order.c
+index 98ed990..44b1a9c 100644
+--- a/lib/yp_order.c
++++ b/lib/yp_order.c
+@@ -39,7 +39,7 @@ yp_order (const char *indomain, const char *inmap, unsigned int *outorder)
+   memset (&resp, '\0', sizeof (resp));
+   result = do_ypcall_tr (indomain, YPPROC_ORDER, (xdrproc_t) xdr_ypreq_nokey,
+                          (caddr_t) &req, (xdrproc_t) xdr_ypresp_order,
+-                         (caddr_t) &resp);
++                         (ypresp_val *) &resp);
+ 
+   if (result != YPERR_SUCCESS)
+     return result;
+-- 
+1.7.9.5
+
diff --git a/package/yp-tools/Config.in b/package/yp-tools/Config.in
new file mode 100644
index 0000000..437aebe
--- /dev/null
+++ b/package/yp-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_YP_TOOLS
+	bool "yp-tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC # needs rpcsvc/nis.h
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_RPCBIND # runtime
+	help
+	  The yp-tools package contains the programs domainname,
+	  nisdomainname, ypcat, ypchfn, ypchsh, ypdomainname, ypmatch,
+	  yppoll, ypset, ypwhich and yppasswd. yp-tools 3.x is a port of
+	  yp-tools 2.x to support IPv6. For this reason, it is now
+	  linked against TI-RPC. Additional, it contians a nss_nis6
+	  plugin for glibc to enable NIS lookups on clients for passwd,
+	  group, etc.
+
+	  https://github.com/thkukuk/yp-tools
diff --git a/package/yp-tools/mapv4v6addr.h b/package/yp-tools/mapv4v6addr.h
new file mode 100644
index 0000000..7f85f7d
--- /dev/null
+++ b/package/yp-tools/mapv4v6addr.h
@@ -0,0 +1,69 @@
+/*
+ * ++Copyright++ 1985, 1988, 1993
+ * -
+ * Copyright (c) 1985, 1988, 1993
+ *    The Regents of the University of California.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 4. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ * -
+ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies, and that
+ * the name of Digital Equipment Corporation not be used in advertising or
+ * publicity pertaining to distribution of the document or software without
+ * specific, written prior permission.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
+ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
+ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
+ * SOFTWARE.
+ * -
+ * --Copyright--
+ */
+
+#include <string.h>
+#include <arpa/nameser.h>
+
+static void
+map_v4v6_address (const char *src, char *dst)
+{
+  u_char *p = (u_char *) dst;
+  int i;
+
+  /* Move the IPv4 part to the right position.  */
+  memcpy (dst + 12, src, INADDRSZ);
+
+  /* Mark this ipv6 addr as a mapped ipv4. */
+  for (i = 0; i < 10; i++)
+    *p++ = 0x00;
+  *p++ = 0xff;
+  *p = 0xff;
+}
diff --git a/package/yp-tools/yp-tools.mk b/package/yp-tools/yp-tools.mk
new file mode 100644
index 0000000..707da49
--- /dev/null
+++ b/package/yp-tools/yp-tools.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# yp-tools
+#
+################################################################################
+
+YP_TOOLS_VERSION = yp-tools-3_4
+YP_TOOLS_SITE = $(call github,thkukuk,yp-tools,$(YP_TOOLS_VERSION))
+YP_TOOLS_LICENSE = GPLv2+
+YP_TOOLS_LICENSE_FILES = COPYING
+YP_TOOLS_AUTORECONF = YES
+YP_TOOLS_DEPENDENCIES = host-pkgconf
+YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H
+
+# From: Joe MacDonald <joe_macdonald@mentor.com>
+# +Date: Fri, 27 Feb 2015 12:04:10 -0500
+# +Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
+# +
+# +mapv4v6addr.h isn't always available, depending on your build, but
+# +nis-hosts.c only needs it for a single, inline function.  So drop a copy
+# +here rather than playing games with the include path that would
+# +potentially lead to cross-compilation issues.
+# +
+# +Upstream-status: Inappropriate [embedded specific]
+# +
+# +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+define YP_TOOLS_LOCAL_MAPV4V6ADDR_H
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/yp-tools/mapv4v6addr.h \
+		$(STAGING_DIR)/usr/include/resolv/mapv4v6addr.h
+endef
+
+$(eval $(autotools-package))
diff --git a/package/ypbind-mt/0001-Remove_man_dir_from_build.patch b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
new file mode 100644
index 0000000..3bd9b9f
--- /dev/null
+++ b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
@@ -0,0 +1,14 @@
+Remove the man directory from the build in order to avoid trying to build the
+commented targets ypbind.8 and ypconf.5
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
index 0000000..46d2b23
--- /dev/null
+++ b/package/ypbind-mt/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_YPBIND_MT
+	bool "ypbind-mt"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_YP_TOOLS
+	select BR2_PACKAGE_RPCBIND # runtime
+	help
+	  The ypbind-mt package contains a multithreaded ypbind daemon
+	  for Linux. It uses threads for better response and supports
+	  the ypbind protocols version 1, 2 and 3.
+
+	  Note: You need to add package "pam" for NIS authentication.
+
+	  https://github.com/thkukuk/ypbind-mt
diff --git a/package/ypbind-mt/ypbind-mt.mk b/package/ypbind-mt/ypbind-mt.mk
new file mode 100644
index 0000000..4d809e5
--- /dev/null
+++ b/package/ypbind-mt/ypbind-mt.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ypbind-mt
+#
+################################################################################
+
+YPBIND_MT_VERSION = ypbind-mt-2_2
+YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))
+YPBIND_MT_LICENSE = GPLv2+
+YPBIND_MT_LICENSE_FILES = COPYING
+YPBIND_MT_AUTORECONF = YES
+YPBIND_MT_DEPENDENCIES = host-pkgconf
+YPBIND_MT_CONF_ENV = \
+	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
+	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"
+
+define YPBIND_MT_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 755 package/ypbind-mt/ypbind.rc $(TARGET_DIR)/etc/init.d/S70ypbind
+endef
+
+$(eval $(autotools-package))
diff --git a/package/ypbind-mt/ypbind.rc b/package/ypbind-mt/ypbind.rc
new file mode 100755
index 0000000..08df322
--- /dev/null
+++ b/package/ypbind-mt/ypbind.rc
@@ -0,0 +1,99 @@
+#! /bin/sh
+# Copyright (c) 2004 Author: Thorsten Kukuk <kukuk@suse.de>
+#
+# /etc/init.d/ypbind
+#
+#   and symbolic its link
+#
+# /usr/sbin/rcypbind
+#
+# System startup script for the ypbind daemon
+#
+### BEGIN INIT INFO
+# Provides: ypbind
+# Required-Start: $remote_fs $portmap
+# Should-Start: ypserv slpd
+# Required-Stop: portmap
+# Default-Start: 3 5
+# Default-Stop: 0 1 2 6
+# Short-Description: Start ypbind (necessary for a NIS client)
+# Description: ypbind finds the server for NIS domains and maintains
+#	the NIS binding information.
+### END INIT INFO
+
+YPBIND_BIN=/usr/sbin/ypbind
+pidfile=/var/run/ypbind.pid
+
+[ -f /etc/default/ypbind ] && . /etc/default/ypbind
+
+case "$1" in
+    start)
+	echo -n "Starting ypbind"
+	## If the domainname is not set, skip starting of ypbind
+	## and return with "program not configured"
+        /usr/bin/ypdomainname &> /dev/null
+        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           if [ -f /etc/defaultdomain ]; then
+             XDOMAINNAME=`cat /etc/defaultdomain`
+             /usr/bin/ypdomainname "$XDOMAINNAME"
+	   fi
+           /usr/bin/ypdomainname &> /dev/null
+           if [ $? -ne 0 -o -z "`/usr/bin/ypdomainname 2>/dev/null`" ]; then
+	     # Tell the user this has skipped
+	     echo -n " . . . . . . . . . . No domainname set"
+             # service is not configured
+	     exit 1
+           fi
+        fi
+
+	## If we don't have a /etc/yp.conf file, skip starting of
+        ## ypbind and return with "program not configured"
+        ## if you add the -broadcast Option later, comment this out.
+	if [ ! -f /etc/yp.conf -a "$YPBIND_BROADCAST" != "yes" ] ; then
+	  # Tell the user this has skipped
+	  echo -n " . . . . . . . . . . ${attn}/etc/yp.conf not found${norm}"
+          # service is not configured
+	  exit 1
+        fi
+
+	# evaluate the OPTIONS for ypbind-mt
+	OPTIONS=""
+	test "$YPBIND_LOCAL_ONLY" = "yes" && OPTIONS="-local-only $OPTIONS"
+	test "$YPBIND_BROADCAST" = "yes" && OPTIONS="-broadcast $OPTIONS"
+	test "$YPBIND_BROKEN_SERVER" = "yes" && OPTIONS="-broken-server $OPTIONS"
+
+	start-stop-daemon --start --quiet --pidfile $pidfile --exec $YPBIND_BIN -- $YPBIND_OPTIONS $OPTIONS
+        if [ $? -eq 0 ]; then
+            notfound=1
+            for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
+                ypwhich &>/dev/null && { notfound=0 ; break; };
+                echo -n " ."
+                sleep 1;
+            done
+            if [ $notfound -eq 1 ]; then
+                echo -n " ${warn}No NIS server found${norm}";
+	    fi
+        else
+            exit 1
+        fi
+	;;
+    stop)
+	echo -n "Shutting down ypbind"
+	start-stop-daemon --stop --quiet --pidfile $pidfile
+	# Remove static data, else glibc will continue to use NIS
+        rm -f /var/yp/binding/* /var/run/ypbind.pid
+	;;
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+    reload | force-reload)
+	echo -n "Reload service ypbind"
+	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
+	;;
+    *)
+	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
+	exit 1
+	;;
+esac
-- 
1.7.9.5
