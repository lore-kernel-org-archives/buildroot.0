From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] libnl: fix minor memleaks,
	install shared library properly
Message-ID: <20101104230333.AA91E8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84c944d6c36ddbdf1f64a324aa465c5b17184980
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl-1.1-flags.patch       |   36 ++++++++++++++++++++++++++
 package/libnl/libnl-1.1-minor-leaks.patch |   40 +++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 package/libnl/libnl-1.1-flags.patch
 create mode 100644 package/libnl/libnl-1.1-minor-leaks.patch

diff --git a/package/libnl/libnl-1.1-flags.patch b/package/libnl/libnl-1.1-flags.patch
new file mode 100644
index 0000000..8c376df
--- /dev/null
+++ b/package/libnl/libnl-1.1-flags.patch
@@ -0,0 +1,36 @@
+From f124a6ff6a19d5c6b6709d38dd2ffa8275abbd5f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 18 Oct 2010 12:16:27 -0300
+Subject: [PATCH] Make libnl.so mode 0755 when installing, and respect LDFLAGS
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 0bf8af7..0098906 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -48,7 +48,7 @@ all:
+ 
+ $(OUT_SLIB): ../Makefile.opts $(OBJ)
+ 	@echo "  LD $(OUT_SLIB)"; \
+-	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
++	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
+ 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
+ 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
+ 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
+@@ -65,7 +65,7 @@ distclean:
+ 
+ install:
+ 	mkdir -p $(DESTDIR)$(libdir)/
+-	install -m 0644 $(OUT_SLIB) $(DESTDIR)$(libdir)
++	install -m 0755 $(OUT_SLIB) $(DESTDIR)$(libdir)
+ 	rm -f $(DESTDIR)$(libdir)/$(LN1_SLIB)
+ 	$(LN) -s $(OUT_SLIB) $(DESTDIR)$(libdir)/$(LN1_SLIB)
+ 	rm -f $(DESTDIR)$(libdir)/$(LN_SLIB)
+-- 
+1.7.2.2
+
diff --git a/package/libnl/libnl-1.1-minor-leaks.patch b/package/libnl/libnl-1.1-minor-leaks.patch
new file mode 100644
index 0000000..855a6ab
--- /dev/null
+++ b/package/libnl/libnl-1.1-minor-leaks.patch
@@ -0,0 +1,40 @@
+From: Patrick McHardy <kaber@trash.net>
+Date: Fri, 18 Jan 2008 16:55:49 +0000 (+0100)
+Subject: [LIBNL]: Fix minor memleaks on exit
+X-Git-Url: http://git.kernel.org/?p=libs%2Fnetlink%2Flibnl.git;a=commitdiff_plain;h=b64f15d6f947839236fa276d473d238f8c9b9d57;hp=e91bb2ffb090955d443e643a25b250bf3d33534a
+
+[LIBNL]: Fix minor memleaks on exit
+
+Make valgrind happy ...
+
+Signed-off-by: Patrick McHardy <kaber@trash.net>
+---
+
+diff --git a/lib/route/route_utils.c b/lib/route/route_utils.c
+index a12d169..1386cda 100644
+--- a/lib/route/route_utils.c
++++ b/lib/route/route_utils.c
+@@ -63,6 +63,11 @@ static void __init init_routing_table_names(void)
+ 	add_routing_table_name(RT_TABLE_LOCAL, "local");
+ };
+ 
++static void __exit release_routing_table_names(void)
++{
++	__trans_list_clear(&table_names);
++}
++
+ int rtnl_route_read_table_names(const char *path)
+ {
+ 	__trans_list_clear(&table_names);
+@@ -104,6 +109,11 @@ static void __init init_proto_names(void)
+ 	add_proto_name(RTPROT_STATIC, "static");
+ };
+ 
++static void __exit release_proto_names(void)
++{
++	__trans_list_clear(&proto_names);
++}
++
+ int rtnl_route_read_protocol_names(const char *path)
+ {
+ 	__trans_list_clear(&proto_names);
-- 
1.7.1
