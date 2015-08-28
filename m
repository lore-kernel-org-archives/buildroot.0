From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:18:13 +0200
Subject: [Buildroot] [git commit branch/next] package/libhttpparser: New
	package
Message-ID: <20150828171831.5AE2381E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba1b3a5f39cb3507d548269f58770b66d441a545
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

http-parser provides a simple C API to parse HTTP responses and
requests.

This packaging uses the official Joyent repository.

[Thomas:
 - since we're always building the shared library, depend on
   !BR2_STATIC_LIBS in Config.in. We could build only the static
   library, but then we would have to do all the lib installation
   manually.
 - indent using tabs in Config.in
 - use 'make install' instead of handcoding the library installation.
 - use $(TARGET_CONFIGURE_OPTS) instead of just CC= and LD=.
 - use tabs for indentation in commands instead of spaces
 - add patch to fix reinstallation.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...-f-option-when-calling-ln-at-install-time.patch |   34 ++++++++++++++++++++
 package/libhttpparser/Config.in                    |   17 ++++++++++
 package/libhttpparser/libhttpparser.mk             |   26 +++++++++++++++
 4 files changed, 78 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 60cda71..69abc78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -979,6 +979,7 @@ menu "Networking"
 	source "package/libeXosip2/Config.in"
 	source "package/libfcgi/Config.in"
 	source "package/libgsasl/Config.in"
+	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
 	source "package/libmbus/Config.in"
diff --git a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
new file mode 100644
index 0000000..29fe04d
--- /dev/null
+++ b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
@@ -0,0 +1,34 @@
+From d9dfeca8736318eaad5cd4554cbae059469decde Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 28 Aug 2015 19:02:11 +0200
+Subject: [PATCH] Use -f option when calling ln at install time
+
+This allows "make install; make install" to work properly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 373709c..6206b09 100644
+--- a/Makefile
++++ b/Makefile
+@@ -113,12 +113,12 @@ tags: http_parser.c http_parser.h test.c
+ install: library
+ 	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
+ 	$(INSTALL) -D $(SONAME) $(LIBDIR)/$(SONAME)
+-	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
++	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
+ 
+ install-strip: library
+ 	$(INSTALL) -D  http_parser.h $(INCLUDEDIR)/http_parser.h
+ 	$(INSTALL) -D -s $(SONAME) $(LIBDIR)/$(SONAME)
+-	ln -s $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
++	ln -sf $(LIBDIR)/$(SONAME) $(LIBDIR)/libhttp_parser.so
+ 
+ uninstall:
+ 	rm $(INCLUDEDIR)/http_parser.h
+-- 
+2.5.0
+
diff --git a/package/libhttpparser/Config.in b/package/libhttpparser/Config.in
new file mode 100644
index 0000000..31b8b9b
--- /dev/null
+++ b/package/libhttpparser/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBHTTPPARSER
+	bool "libhttpparser"
+	depends on !BR2_STATIC_LIBS
+	help
+	  This is a parser for HTTP messages written in C. It
+	  parses both requests and responses. The parser is
+	  designed to be used in performance HTTP applications.
+	  It does not make any syscalls nor allocations, it does
+	  not buffer data, it can be interrupted at anytime.
+	  Depending on your architecture, it only requires about
+	  40 bytes of data per message stream (in a web server
+	  that is per connection).
+
+	  https://github.com/joyent/http-parser
+
+comment "libhttpparser needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
new file mode 100644
index 0000000..d6ec236
--- /dev/null
+++ b/package/libhttpparser/libhttpparser.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libhttpparser
+#
+################################################################################
+
+LIBHTTPPARSER_VERSION = v2.5.0
+LIBHTTPPARSER_SITE = $(call github,joyent,http-parser,$(LIBHTTPPARSER_VERSION))
+LIBHTTPPARSER_INSTALL_STAGING = YES
+LIBHTTPPARSER_LICENSE = MIT
+LIBHTTPPARSER_LICENSE_FILES = LICENSE-MIT
+
+define LIBHTTPPARSER_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) library package
+endef
+
+define LIBHTTPPARSER_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) PREFIX=$(STAGING_DIR)/usr install
+	$(INSTALL) -D -m 0644 $(@D)/libhttp_parser.a $(STAGING_DIR)/usr/lib/libhttp_parser.a
+endef
+
+define LIBHTTPPARSER_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
