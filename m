From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 23:50:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20090114235045.226AC7697C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 23:50:44 +0000 (Wed, 14 Jan 2009)
New Revision: 24848

Log:
Bump vpnc version and remove build of man pages, which breaks when cross compiling

Added:
   trunk/buildroot/package/vpnc/vpnc-0.5.3-nomanual.patch
   trunk/buildroot/package/vpnc/vpnc-0.5.3-susv3-legacy.patch

Modified:
   trunk/buildroot/package/vpnc/vpnc.mk


Changeset:
Added: trunk/buildroot/package/vpnc/vpnc-0.5.3-nomanual.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.5.3-nomanual.patch	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc-0.5.3-nomanual.patch	2009-01-14 23:50:44 UTC (rev 24848)
@@ -0,0 +1,15 @@
+diff -urN vpnc-0.5.3-0rig/Makefile vpnc-0.5.3/Makefile
+--- vpnc-0.5.3-0rig/Makefile	2008-11-19 21:36:12.000000000 +0100
++++ vpnc-0.5.3/Makefile	2009-01-15 00:38:36.000000000 +0100
+@@ -72,7 +72,10 @@
+ 	$(CC) -o $@ $^ $(LDFLAGS)
+ 
+ vpnc.8 : vpnc.8.template makeman.pl vpnc
+-	./makeman.pl
++	@echo "Cannot make manual when cross compiling"
++	touch $@
++
++#	./makeman.pl
+ 
+ vpnc-script : vpnc-script.in
+ 	sed -e 's,@''PREFIX''@,$(PREFIX),g' $< > $@ && chmod 755 $@

Added: trunk/buildroot/package/vpnc/vpnc-0.5.3-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.5.3-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc-0.5.3-susv3-legacy.patch	2009-01-14 23:50:44 UTC (rev 24848)
@@ -0,0 +1,12 @@
+diff -rdup vpnc-0.5.1.oorig/config.c vpnc-0.5.1/config.c
+--- vpnc-0.5.1.oorig/config.c	2007-09-10 22:39:48.000000000 +0200
++++ vpnc-0.5.1/config.c	2007-09-19 14:19:46.000000000 +0200
+@@ -538,7 +538,7 @@ static char *get_config_filename(const c
+ {
+ 	char *realname;
+ 	
+-	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
++	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
+ 	return realname;
+ }
+ 

Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2009-01-14 23:49:24 UTC (rev 24847)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2009-01-14 23:50:44 UTC (rev 24848)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VPNC_VERSION=0.5.1
+VPNC_VERSION=0.5.3
 VPNC_SOURCE=vpnc-$(VPNC_VERSION).tar.gz
 VPNC_SITE=http://www.unix-ag.uni-kl.de/~massar/vpnc
 VPNC_DIR=$(BUILD_DIR)/vpnc-$(VPNC_VERSION)
