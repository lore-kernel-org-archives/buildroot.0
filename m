From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 21 Sep 2018 22:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: new package
Message-ID: <20180921205619.25242-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HAProxy is a free, very fast and reliable solution offering
high availability, load balancing, and proxying for TCP and
HTTP-based applications.

http://www.haproxy.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/haproxy/Config.in    | 10 +++++
 package/haproxy/haproxy.hash |  5 +++
 package/haproxy/haproxy.mk   | 85 ++++++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 package/haproxy/Config.in
 create mode 100644 package/haproxy/haproxy.hash
 create mode 100644 package/haproxy/haproxy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 84129553c5..d71c7bd500 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -742,6 +742,7 @@ F:	package/gssdp/
 F:	package/gupnp/
 F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
+F:	package/haproxy/
 F:	package/hiredis/
 F:	package/i2pd/
 F:	package/igd2-for-linux/
diff --git a/package/Config.in b/package/Config.in
index c04645a30b..0d8fd8149f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1789,6 +1789,7 @@ menu "Networking applications"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
+	source "package/haproxy/Config.in"
 	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
new file mode 100644
index 0000000000..cbcbc0c388
--- /dev/null
+++ b/package/haproxy/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HAPROXY
+	bool "haproxy"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
+	help
+	  HAProxy is a free, very fast and reliable solution offering
+	  high availability, load balancing, and proxying for TCP and
+	  HTTP-based applications.
+
+	  http://www.haproxy.org
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
new file mode 100644
index 0000000000..e6fcb3b65c
--- /dev/null
+++ b/package/haproxy/haproxy.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256	2bf5dafbb5f1530c0e67ab63666565de948591f8e0ee2a1d3c84c45e738220f1	haproxy-1.8.13.tar.gz
+sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
+sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
+sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
new file mode 100644
index 0000000000..ba0ebef1f3
--- /dev/null
+++ b/package/haproxy/haproxy.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# haproxy
+#
+################################################################################
+
+HAPROXY_VERSION_MAJOR = 1.8
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
+HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
+HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
+
+HAPROXY_MAKE_OPTS = \
+	LD=$(TARGET_CC) \
+	PREFIX=/usr \
+	TARGET=custom
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+HAPROXY_LIBS += -latomic
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HAPROXY_MAKE_OPTS += USE_THREAD=1
+endif
+
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+HAPROXY_DEPENDENCIES += lua
+HAPROXY_MAKE_OPTS += USE_LUA=1
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+HAPROXY_DEPENDENCIES += openssl
+HAPROXY_MAKE_OPTS += USE_OPENSSL=1
+ifeq ($(BR2_STATIC_LIBS),y)
+HAPROXY_LIBS += -lz
+endif
+endif
+
+# pcre and pcre2 can't be enabled at the same time so prefer pcre2
+# Set PCRE2_DIR as by haproxy will try to use pcre2-config and will default to
+# /usr/local
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+HAPROXY_DEPENDENCIES += pcre2
+HAPROXY_MAKE_OPTS += \
+	PCRE2DIR=$(STAGING_DIR)/usr \
+	USE_PCRE2=1
+
+# Again, set manually PCRE2_LDFLAGS or default will contain -L/usr/local
+ifeq ($(BR2_PACKAGE_PCRE2_32),y)
+HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-32
+else ifeq ($(BR2_PACKAGE_PCRE2_16),y)
+HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-16
+else
+HAPROXY_MAKE_OPTS += PCRE2_LDFLAGS=-lpcre2-8
+endif
+else ifeq ($(BR2_PACKAGE_PCRE),y)
+HAPROXY_DEPENDENCIES += pcre
+HAPROXY_MAKE_OPTS += \
+	PCREDIR=$(STAGING_DIR)/usr \
+	USE_PCRE=1
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+HAPROXY_DEPENDENCIES += systemd
+HAPROXY_MAKE_OPTS += USE_SYSTEMD=1
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+HAPROXY_DEPENDENCIES += zlib
+HAPROXY_MAKE_OPTS += USE_ZLIB=1
+endif
+
+HAPROXY_MAKE_OPTS += ADDLIB="$(HAPROXY_LIBS)"
+
+define HAPROXY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(HAPROXY_MAKE_OPTS) -C $(@D)
+endef
+
+define HAPROXY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(HAPROXY_MAKE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
