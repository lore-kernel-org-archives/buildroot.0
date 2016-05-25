From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 25 May 2016 09:52:53 -0500
Subject: [Buildroot] [PATCH] ustr: Makefile fixes for link failures
Message-ID: <1464187973-11273-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ustr package is failing sometimes in the autobuilder at a target
install link step. This is an attempt to fix the issue by not allowing
make to ignore a failed remove call to remove the link before it is
created.

http://autobuild.buildroot.org/results/9e1/9e13c9779a84312bcb094604acfa6ec626697aa7
http://autobuild.buildroot.org/results/ceb/cebfd7e29a6521ae7ba4c229586a3ef662aa9de1

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/ustr/0001-Makefile-force-removes.patch | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/ustr/0001-Makefile-force-removes.patch

diff --git a/package/ustr/0001-Makefile-force-removes.patch b/package/ustr/0001-Makefile-force-removes.patch
new file mode 100644
index 0000000..f244ca7
--- /dev/null
+++ b/package/ustr/0001-Makefile-force-removes.patch
@@ -0,0 +1,39 @@
+Allowing the makefile to ignore remove failures is masking an issues on some
+builds that causes the subsequent link call to fail. This patch makes the
+remove a required step in an attempt to uncover the real issue. Either way
+the removes should be required since they should never fail with the -f flag.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+
+--- a/Makefile.in	2016-05-23 08:46:46.337481574 -0500
++++ b/Makefile.in	2016-05-23 08:45:12.327380457 -0500
+@@ -425,11 +425,11 @@
+ 		@echo Installing files
+ 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
+ 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
+-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
++		rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+ 		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
++		rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+ 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
++		rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+ 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
+ 		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
+@@ -438,11 +438,11 @@
+ 		@echo Installing files
+ 		install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
+ 		install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
+-		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
++		rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+ 		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+-		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
++		rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+ 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+-		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
++		rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+ 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
+ 		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
-- 
1.9.1
