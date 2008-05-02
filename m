From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri,  2 May 2008 04:20:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
Message-ID: <20080502112001.0FD603C732@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-02 04:20:00 -0700 (Fri, 02 May 2008)
New Revision: 21919

Log:
pkgconfig fix for docker

Added:
   trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch

Modified:
   trunk/buildroot/package/docker/docker.mk


Changeset:
Added: trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch
===================================================================
--- trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch	                        (rev 0)
+++ trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch	2008-05-02 11:20:00 UTC (rev 21919)
@@ -0,0 +1,23 @@
+--- a/Makefile	2002-11-20 05:20:49.000000000 -0500
++++ b/Makefile	2008-04-28 12:36:23.000000000 -0400
+@@ -20,7 +20,6 @@ CFLAGS=-pedantic -Wall -W -O
+ 
+ PACKAGE=docker
+ VERSION=1.5
+-
+ target=docker
+ sources=docker.c kde.c icons.c xproperty.c net.c
+ headers=docker.h kde.h icons.h xproperty.h net.h version.h
+@@ -31,10 +30,10 @@ all: $(target) $(sources) $(headers)
+ 
+ $(target): $(sources:.c=.o)
+ 	$(CC) $(CFLAGS) -L$(XLIBPATH) -lX11 \
+-		`pkg-config --libs glib-2.0` $^ -o $@
++		`$(PKGCONFIG) --libs glib-2.0` $^ -o $@
+ 
+ %.o: %.c
+-	$(CC) -c $(CFLAGS) `pkg-config --cflags glib-2.0` $<
++	$(CC) -c $(CFLAGS) `$(PKGCONFIG) --cflags glib-2.0` $<
+ 
+ version.h: version.h.in Makefile
+ 	sed -e "s/@VERSION@/$(VERSION)/" version.h.in > $@

Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-05-02 09:39:09 UTC (rev 21918)
+++ trunk/buildroot/package/docker/docker.mk	2008-05-02 11:20:00 UTC (rev 21919)
@@ -12,7 +12,9 @@
 
 DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 					CFLAGS="-I$(STAGING_DIR)/usr/include" \
-					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
+					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
+					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+					PKG_CONFIG_SYSROOT="$(STAGING_DIR)"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
