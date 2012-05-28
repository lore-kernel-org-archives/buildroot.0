From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 28 May 2012 14:41:42 -0400
Subject: [Buildroot] [PATCH] New package: xinetd
Message-ID: <1338230502-21663-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/Config.in                              |    1 +
 package/xinetd/Config.in                       |    8 +++
 package/xinetd/xinetd-2.3.15/001-ar.patch      |   66 ++++++++++++++++++++++++
 package/xinetd/xinetd-2.3.15/002-destdir.patch |   27 ++++++++++
 package/xinetd/xinetd-2.3.15/003-rpc_fix.patch |   19 +++++++
 package/xinetd/xinetd.mk                       |   13 +++++
 6 files changed, 134 insertions(+)
 create mode 100644 package/xinetd/Config.in
 create mode 100644 package/xinetd/xinetd-2.3.15/001-ar.patch
 create mode 100644 package/xinetd/xinetd-2.3.15/002-destdir.patch
 create mode 100644 package/xinetd/xinetd-2.3.15/003-rpc_fix.patch
 create mode 100644 package/xinetd/xinetd.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..06d09da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ source "package/wget/Config.in"
 endif
 source "package/wireless_tools/Config.in"
 source "package/wpa_supplicant/Config.in"
+source "package/xinetd/Config.in"
 source "package/xl2tp/Config.in"
 
 endmenu
diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
new file mode 100644
index 0000000..6bfe24c
--- /dev/null
+++ b/package/xinetd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XINETD
+	bool "xinetd"
+	depends on BR2_INET_RPC
+	help
+	  xinetd is a secure replacement for inetd. It was originally written by
+	  panos at cs.colorado.edu.
+
+	  http://www.xinetd.org
diff --git a/package/xinetd/xinetd-2.3.15/001-ar.patch b/package/xinetd/xinetd-2.3.15/001-ar.patch
new file mode 100644
index 0000000..b956648
--- /dev/null
+++ b/package/xinetd/xinetd-2.3.15/001-ar.patch
@@ -0,0 +1,66 @@
+--- a/libs/src/misc/Makefile.in
++++ b/libs/src/misc/Makefile.in
+@@ -62,7 +62,7 @@
+ 
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ install: $(LIBNAME)
+--- a/libs/src/portable/Makefile.in
++++ b/libs/src/portable/Makefile.in
+@@ -57,7 +57,7 @@
+ 
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ install: $(LIBNAME)
+--- a/libs/src/pset/Makefile.in
++++ b/libs/src/pset/Makefile.in
+@@ -53,7 +53,7 @@
+ 	mv $(LIBNAME) $(LIBDIR)/optimized
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ install: $(LIBNAME)
+--- a/libs/src/sio/Makefile.in
++++ b/libs/src/sio/Makefile.in
+@@ -52,7 +52,7 @@
+ 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)/optimized
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ install: $(LIBNAME)
+--- a/libs/src/str/Makefile.in
++++ b/libs/src/str/Makefile.in
+@@ -63,7 +63,7 @@
+ 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)-O
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ LINT_IGNORE=possible pointer alignment|RCSid unused
+--- a/libs/src/xlog/Makefile.in
++++ b/libs/src/xlog/Makefile.in
+@@ -58,7 +58,7 @@
+ 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)/optimized
+ 
+ $(LIBNAME): $(OBJECTS)
+-	ar r $@ $?
++	$(AR) r $@ $?
+ 	$(RANLIB) $@
+ 
+ install: $(LIBNAME)
diff --git a/package/xinetd/xinetd-2.3.15/002-destdir.patch b/package/xinetd/xinetd-2.3.15/002-destdir.patch
new file mode 100644
index 0000000..89075c8
--- /dev/null
+++ b/package/xinetd/xinetd-2.3.15/002-destdir.patch
@@ -0,0 +1,27 @@
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -75,15 +75,15 @@ dlibxlog: dlibsio dlibstr
+ 
+ install: build
+ 	for i in $(DAEMONDIR) $(BINDIR) $(MANDIR)/man5 $(MANDIR)/man8 ; do \
+-	   test -d $$i || mkdir -p $$i ; done
+-	$(INSTALL_CMD) -m 755 xinetd/xinetd $(DAEMONDIR)
+-	$(INSTALL_CMD) -m 755 xinetd/itox $(DAEMONDIR)
+-	$(INSTALL_CMD) -m 755 $(SRCDIR)/xinetd/xconv.pl $(DAEMONDIR)
+-	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.conf.man $(MANDIR)/man5/xinetd.conf.5
+-	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.log.man $(MANDIR)/man8/xinetd.log.8
+-	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.man $(MANDIR)/man8/xinetd.8
+-	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/itox.8 $(MANDIR)/man8/itox.8
+-	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xconv.pl.8 $(MANDIR)/man8/xconv.pl.8
++	   test -d $(DESTDIR)$$i || mkdir -p $(DESTDIR)$$i ; done
++	$(INSTALL_CMD) -m 755 xinetd/xinetd $(DESTDIR)$(DAEMONDIR)
++	$(INSTALL_CMD) -m 755 xinetd/itox $(DESTDIR)$(DAEMONDIR)
++	$(INSTALL_CMD) -m 755 $(SRCDIR)/xinetd/xconv.pl $(DESTDIR)$(DAEMONDIR)
++	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.conf.man $(DESTDIR)$(MANDIR)/man5/xinetd.conf.5
++	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.log.man $(DESTDIR)$(MANDIR)/man8/xinetd.log.8
++	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.man $(DESTDIR)$(MANDIR)/man8/xinetd.8
++	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/itox.8 $(DESTDIR)$(MANDIR)/man8/itox.8
++	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xconv.pl.8 $(DESTDIR)$(MANDIR)/man8/xconv.pl.8
+ 	@echo "You must put your xinetd.conf in /etc/xinetd.conf"
+ 	@echo "There is a sample config file in xinetd/sample.conf and you can"
+ 	@echo "use xconv.pl to convert your old inetd.conf file to an xinetd format"
diff --git a/package/xinetd/xinetd-2.3.15/003-rpc_fix.patch b/package/xinetd/xinetd-2.3.15/003-rpc_fix.patch
new file mode 100644
index 0000000..11f47e7
--- /dev/null
+++ b/package/xinetd/xinetd-2.3.15/003-rpc_fix.patch
@@ -0,0 +1,19 @@
+--- a/xinetd/confparse.c
++++ b/xinetd/confparse.c
+@@ -745,7 +745,7 @@ static status_e check_entry( struct serv
+ 	   }
+    }
+ 
+-/* #ifndef NO_RPC */
++#ifndef NO_RPC
+ #if defined(HAVE_RPC_RPCENT_H) || defined(HAVE_NETDB_H)
+    if ( SC_IS_RPC( scp ) && !SC_IS_UNLISTED( scp ) )
+    {
+@@ -759,6 +759,7 @@ static status_e check_entry( struct serv
+       SC_RPCDATA( scp )->rd_program_number = rep->r_number ;
+    }
+    else
++#endif
+ #endif   /* ! NO_RPC */
+    {
+        if ( !SC_IS_UNLISTED( scp ) ) 
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
new file mode 100644
index 0000000..5900a8f
--- /dev/null
+++ b/package/xinetd/xinetd.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# xinetd
+#
+#############################################################
+XINETD_VERSION      = 2.3.15
+XINETD_SOURCE       = xinetd-$(XINETD_VERSION).tar.gz
+XINETD_SITE         = http://www.xinetd.org
+XINETD_CONF_OPT     =
+XINETD_DEPENDENCIES =
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.9.5
