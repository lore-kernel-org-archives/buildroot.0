From: Renaud AUBIN <root@renaud.io>
Date: Thu, 27 Aug 2015 22:54:56 +0200
Subject: [Buildroot] [PATCH] package/libhttpparser: New package
Message-ID: <1440708896-22502-1-git-send-email-root@renaud.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http-parser provides a simple C API to parse HTTP responses and
requests.

This packaging uses the official Joyent repository.
---
 package/Config.in                      |  1 +
 package/libhttpparser/Config.in        | 13 +++++++++++++
 package/libhttpparser/libhttpparser.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/libhttpparser/Config.in
 create mode 100644 package/libhttpparser/libhttpparser.mk

diff --git a/package/Config.in b/package/Config.in
index 783fbb4..89d863d 100644
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
diff --git a/package/libhttpparser/Config.in b/package/libhttpparser/Config.in
new file mode 100644
index 0000000..b8e6825
--- /dev/null
+++ b/package/libhttpparser/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBHTTPPARSER
+        bool "libhttpparser"
+        help
+          This is a parser for HTTP messages written in C. It
+          parses both requests and responses. The parser is
+          designed to be used in performance HTTP applications.
+          It does not make any syscalls nor allocations, it does
+          not buffer data, it can be interrupted at anytime.
+          Depending on your architecture, it only requires about
+          40 bytes of data per message stream (in a web server
+          that is per connection).
+
+          https://github.com/joyent/http-parser
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
new file mode 100644
index 0000000..bcb26c7
--- /dev/null
+++ b/package/libhttpparser/libhttpparser.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libhttp-parser
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
+    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) library package
+endef
+
+define LIBHTTPPARSER_INSTALL_STAGING_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/libhttp_parser.a $(STAGING_DIR)/usr/lib/libhttp_parser.a
+    $(INSTALL) -D -m 0644 $(@D)/http_parser.h $(STAGING_DIR)/usr/include/http_parser.h
+    $(INSTALL) -D -m 0755 $(@D)/libhttp_parser.so* $(STAGING_DIR)/usr/lib
+endef
+
+define LIBHTTPPARSER_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/libhttp_parser.so* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
