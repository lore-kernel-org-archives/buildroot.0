From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:27 +0000
Subject: [Buildroot] [PATCH 7/8] Adding janus-gateway
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-7-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/janus-gateway/Config.in                    | 14 +++++++++++
 .../janus-gateway-0001-disable-ssp.patch           | 12 ++++++++++
 package/janus-gateway/janus-gateway.mk             | 27 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/janus-gateway/Config.in
 create mode 100644 package/janus-gateway/janus-gateway-0001-disable-ssp.patch
 create mode 100644 package/janus-gateway/janus-gateway.mk

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
new file mode 100644
index 0000000..fef35f6
--- /dev/null
+++ b/package/janus-gateway/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JANUS_GATEWAY
+	bool "janus-gateway"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBNICE
+	select BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_DING_LIBS
+	select BR2_PACKAGE_LIBWEBSOCK
+	select BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Adds janus-gateway, an open source, general purpose, WebRTC gateway 
+	  
+	  https://github.com/meetecho/janus-gateway
diff --git a/package/janus-gateway/janus-gateway-0001-disable-ssp.patch b/package/janus-gateway/janus-gateway-0001-disable-ssp.patch
new file mode 100644
index 0000000..5de8b3b
--- /dev/null
+++ b/package/janus-gateway/janus-gateway-0001-disable-ssp.patch
@@ -0,0 +1,12 @@
+diff -rupN janus-gateway-master.orig/Makefile.am janus-gateway-master/Makefile.am
+--- janus-gateway-master.orig/Makefile.am	2014-11-27 14:36:31.000000000 +0000
++++ janus-gateway-master/Makefile.am	2014-12-01 16:39:50.551935028 +0000
+@@ -14,7 +14,7 @@ AM_CFLAGS += -Wredundant-decls  # sophia
+ # some fairly big refactoring though, which can wait.
+ # AM_CFLAGS += -Wshadow -Wstrict-aliasing=2
+ 
+-AM_CFLAGS += -fstack-protector-all -g -ggdb -fPIC -rdynamic
++AM_CFLAGS += -g -ggdb -fPIC -rdynamic
+ 
+ # FIXME: make docs work with distcheck
+ DISTCHECK_CONFIGURE_FLAGS = --disable-docs --enable-post-processing
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
new file mode 100644
index 0000000..277a38c
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# janus-gateway
+#
+#############################################################
+JANUS_GATEWAY_VERSION = c632c1e9da5ffd8c34df6086a1aa5a8511a2a02d
+JANUS_GATEWAY_SITE_METHOD = git
+JANUS_GATEWAY_SITE = https://github.com/meetecho/janus-gateway.git
+JANUS_GATEWAY_LICENSE = GPLv3
+JANUS_GATEWAY_LICENSE_FILES = COPYING
+
+JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson libnice sofia-sip libsrtp ding-libs libwebsock host-gengetopt
+
+# Straight out of the repository, no ./configure
+JANUS_GATEWAY_AUTORECONF = YES
+ 
+define JANUS_GATEWAY_M4
+        mkdir -p $(@D)/m4
+endef
+JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
+
+JANUS_GATEWAY_CONF_OPTS = --disable-data-channels \
+				--disable-rabbitmq 
+
+JANUS_GATEWAY_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
-- 
1.9.1
