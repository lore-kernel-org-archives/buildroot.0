From: laurent.laffont at gmail.com <laurent.laffont@gmail.com>
Date: Thu,  9 Jul 2009 14:09:03 +0200
Subject: [Buildroot] [PATCH] add ruby serialport extension
Message-ID: <1247141343-8641-1-git-send-email-laurent.laffont@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: laurent laffont <laurent.laffont@gmail.com>

Handle ruby serialport extension cross compilation.
http://rubyforge.org/projects/ruby-serialport/

Signed-off-by: laurent laffont <laurent.laffont@gmail.com>
---
 package/Config.in                                  |    1 +
 package/ruby-serialport/Config.in                  |    7 +++
 .../ruby-serialport/ruby-serialport-fix-1.9.patch  |   52 +++++++++++++++++++
 package/ruby-serialport/ruby-serialport.mk         |   53 ++++++++++++++++++++
 4 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 package/ruby-serialport/Config.in
 create mode 100644 package/ruby-serialport/ruby-serialport-fix-1.9.patch
 create mode 100644 package/ruby-serialport/ruby-serialport.mk

diff --git a/package/Config.in b/package/Config.in
index cb83563..5c22ed3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -427,6 +427,7 @@ source "package/lua/Config.in"
 source "package/microperl/Config.in"
 source "package/python/Config.in"
 source "package/ruby/Config.in"
+source "package/ruby-serialport/Config.in"
 source "package/tcl/Config.in"
 source "package/php/Config.in"
 endmenu
diff --git a/package/ruby-serialport/Config.in b/package/ruby-serialport/Config.in
new file mode 100644
index 0000000..acdb3be
--- /dev/null
+++ b/package/ruby-serialport/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RUBY_SERIALPORT
+	depends on BR2_PACKAGE_RUBY
+	bool "ruby-serialport"
+	help
+	  Ruby library that provides a class for using RS-232 serial ports
+	  http://rubyforge.org/projects/ruby-serialport/
+
diff --git a/package/ruby-serialport/ruby-serialport-fix-1.9.patch b/package/ruby-serialport/ruby-serialport-fix-1.9.patch
new file mode 100644
index 0000000..8203b78
--- /dev/null
+++ b/package/ruby-serialport/ruby-serialport-fix-1.9.patch
@@ -0,0 +1,52 @@
+--- a/ext/impl/posix_serialport.c	2008-12-23 20:35:07.000000000 +0000
++++ b/ext/impl/posix_serialport.c	2009-05-21 16:37:13.000000000 +0100
+@@ -38,16 +38,16 @@
+ static int get_fd_helper(obj)
+    VALUE obj;
+ {
+-   OpenFile *fptr;
++   rb_io_t *fptr;
+ 
+    GetOpenFile(obj, fptr);
+-   return (fileno(fptr->f));
++   return (fptr->fd);
+ }
+ 
+ static VALUE sp_create_impl(class, _port)
+    VALUE class, _port;
+ {
+-   OpenFile *fp;
++   rb_io_t *fp;
+    int fd;
+    int num_port;
+    char *port;
+@@ -89,7 +89,7 @@
+ 
+       case T_STRING:
+          Check_SafeStr(_port);
+-         port = RSTRING(_port)->ptr;
++         port = RSTRING_PTR(_port);
+          break;
+ 
+       default:
+@@ -130,7 +130,7 @@
+       rb_sys_fail(sTcsetattr);
+    }
+ 
+-   fp->f = rb_fdopen(fd, "r+");
++   fp->fd = fd;
+    fp->mode = FMODE_READWRITE | FMODE_SYNC;
+ 
+    return (VALUE) sp;
+diff -ur ruby-serialport-0.7.0.orig/ext/serialport.h ruby-serialport-0.7.0/ext/serialport.h
+--- ruby-serialport-0.7.0.orig/ext/serialport.h	2008-12-23 20:09:35.000000000 +0000
++++ ruby-serialport-0.7.0/ext/serialport.h	2009-05-21 16:37:13.000000000 +0100
+@@ -22,7 +22,7 @@
+ #define RUBY_SERIAL_PORT_VERSION   "0.7.0"
+ 
+ #include <ruby.h>    /* ruby inclusion */
+-#include <rubyio.h>  /* ruby io inclusion */
++#include <ruby/io.h>  /* ruby io inclusion */
+ 
+ struct modem_params
+ {
diff --git a/package/ruby-serialport/ruby-serialport.mk b/package/ruby-serialport/ruby-serialport.mk
new file mode 100644
index 0000000..797646c
--- /dev/null
+++ b/package/ruby-serialport/ruby-serialport.mk
@@ -0,0 +1,53 @@
+#############################################################
+#
+# ruby-serialport
+#
+#############################################################
+RUBY_SERIALPORT_VERSION = 0.7.0
+RUBY_SERIALPORT_SOURCE = ruby-serialport-$(RUBY_SERIALPORT_VERSION).tar.gz
+RUBY_SERIALPORT_SITE = http://rubyforge.org/frs/download.php/49992
+RUBY_SERIALPORT_DIR:=$(BUILD_DIR)/ruby-serialport-$(RUBY_SERIALPORT_VERSION)
+RUBY_SERIALPORT_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(RUBY_SERIALPORT_SOURCE):
+	 $(call DOWNLOAD,$(RUBY_SERIALPORT_SITE,$(RUBY_SERIALPORT_SOURCE))
+
+ruby-serialport-source: $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE)
+
+$(RUBY_SERIALPORT_DIR)/.unpacked: $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE)
+	$(RUBY_SERIALPORT_CAT) $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(RUBY_SERIALPORT_DIR) package/ruby-serialport/ ruby-serialport\*.patch
+	touch $@
+
+$(RUBY_SERIALPORT_DIR)/.configured: $(RUBY_SERIALPORT_DIR)/.unpacked
+	(cd $(RUBY_SERIALPORT_DIR)/ext; rm Makefile; \
+		RUBYLIB=$(RUBY_DIR):$(RUBY_DIR)/lib:$(RUBY_DIR)/.ext ruby-1.9 -e "require 'mkmf'; create_makefile('serialport')";)
+	touch $@
+
+$(RUBY_SERIALPORT_DIR)/ext/serialport.so: $(RUBY_SERIALPORT_DIR)/.configured
+	(cd $(RUBY_SERIALPORT_DIR)/ext; \
+		$(MAKE) extout=$(RUBY_DIR)/.ext)
+
+$(RUBY_SERIALPORT_DIR)/.installed: $(RUBY_SERIALPORT_DIR)/ext/serialport.so
+	(cd $(RUBY_SERIALPORT_DIR)/ext; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) extout=$(RUBY_DIR)/.ext install)
+	touch $@
+
+ruby-serialport: $(RUBY_SERIALPORT_DIR)/.installed
+
+ruby-serialport-clean:
+	(cd $(RUBY_SERIALPORT_DIR)/ext; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) extout=$(RUBY_DIR)/.ext clean)
+
+ruby-serialport-dirclean: 
+	rm -rf $(RUBY_SERIALPORT_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_RUBY_SERIALPORT),y)
+TARGETS+=ruby-serialport
+endif
-- 
1.6.3.3
