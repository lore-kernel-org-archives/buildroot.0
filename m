From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 10:23:58 +0200
Subject: [Buildroot] [PATCH] libnl: bump to version 2.0
Message-ID: <4DB7D29E.5000101@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/libnl/libnl.mk
===================================================================
--- a/package/libnl/libnl.mk	2011-04-26 02:04:14.206276675 -0700
+++ b/package/libnl/libnl.mk	2011-04-26 03:29:21.934275959 -0700
@@ -4,10 +4,11 @@
 #
 #############################################################
 
-LIBNL_VERSION = 1.1
+LIBNL_VERSION = 2.0
 LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
-LIBNL_SITE = http://distfiles.gentoo.org/distfiles
+LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
+LIBNL_AUTORECONF = YES
 
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
Index: b/package/libnl/libnl-1.1-flags.patch
===================================================================
--- a/package/libnl/libnl-1.1-flags.patch	2011-04-27 01:06:20.486285299 -0700
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,36 +0,0 @@
-From f124a6ff6a19d5c6b6709d38dd2ffa8275abbd5f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 18 Oct 2010 12:16:27 -0300
-Subject: [PATCH] Make libnl.so mode 0755 when installing, and respect LDFLAGS
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 0bf8af7..0098906 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -48,7 +48,7 @@ all:
- 
- $(OUT_SLIB): ../Makefile.opts $(OBJ)
- 	@echo "  LD $(OUT_SLIB)"; \
--	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
-+	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
- 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
- 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
- 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
-@@ -65,7 +65,7 @@ distclean:
- 
- install:
- 	mkdir -p $(DESTDIR)$(libdir)/
--	install -m 0644 $(OUT_SLIB) $(DESTDIR)$(libdir)
-+	install -m 0755 $(OUT_SLIB) $(DESTDIR)$(libdir)
- 	rm -f $(DESTDIR)$(libdir)/$(LN1_SLIB)
- 	$(LN) -s $(OUT_SLIB) $(DESTDIR)$(libdir)/$(LN1_SLIB)
- 	rm -f $(DESTDIR)$(libdir)/$(LN_SLIB)
--- 
-1.7.2.2
-
Index: b/package/libnl/libnl-1.1-minor-leaks.patch
===================================================================
--- a/package/libnl/libnl-1.1-minor-leaks.patch	2011-04-27 01:06:20.546285624 -0700
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,40 +0,0 @@
-From: Patrick McHardy <kaber@trash.net>
-Date: Fri, 18 Jan 2008 16:55:49 +0000 (+0100)
-Subject: [LIBNL]: Fix minor memleaks on exit
-X-Git-Url: http://git.kernel.org/?p=libs%2Fnetlink%2Flibnl.git;a=commitdiff_plain;h=b64f15d6f947839236fa276d473d238f8c9b9d57;hp=e91bb2ffb090955d443e643a25b250bf3d33534a
-
-[LIBNL]: Fix minor memleaks on exit
-
-Make valgrind happy ...
-
-Signed-off-by: Patrick McHardy <kaber@trash.net>
----
-
-diff --git a/lib/route/route_utils.c b/lib/route/route_utils.c
-index a12d169..1386cda 100644
---- a/lib/route/route_utils.c
-+++ b/lib/route/route_utils.c
-@@ -63,6 +63,11 @@ static void __init init_routing_table_names(void)
- 	add_routing_table_name(RT_TABLE_LOCAL, "local");
- };
- 
-+static void __exit release_routing_table_names(void)
-+{
-+	__trans_list_clear(&table_names);
-+}
-+
- int rtnl_route_read_table_names(const char *path)
- {
- 	__trans_list_clear(&table_names);
-@@ -104,6 +109,11 @@ static void __init init_proto_names(void)
- 	add_proto_name(RTPROT_STATIC, "static");
- };
- 
-+static void __exit release_proto_names(void)
-+{
-+	__trans_list_clear(&proto_names);
-+}
-+
- int rtnl_route_read_protocol_names(const char *path)
- {
- 	__trans_list_clear(&proto_names);
Index: b/package/libnl/libnl-1.1-netlink-local-fix.patch
===================================================================
--- a/package/libnl/libnl-1.1-netlink-local-fix.patch	2011-04-27 01:06:20.610285624 -0700
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,19 +0,0 @@
-Fixes the ULONG_MAX definition problem:
-
-In file included from cache.c:43:
-../include/netlink-local.h: In function '__str2type':../include/netlink-local.h:218: error: 'ULONG_MAX' undeclared (first use in this function)
-
-Patch borrowed from OpenEmbedded, recipes/libnl/files/netlink-local-fix.patch.
-
-Index: libnl-1.1/include/netlink-local.h
-===================================================================
---- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
-+++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
-@@ -26,6 +26,7 @@
- #include <sys/socket.h>
- #include <inttypes.h>
- #include <assert.h>
-+#include <limits.h>
- 
- #include <arpa/inet.h>
- #include <netdb.h>
