From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 16:38:52 +0100
Subject: [Buildroot] [git commit] janus-gateway: new package
Message-ID: <20150101154436.75DD28080D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f95c7e6fb9c0cf30eb769a8f0e272e76f36c5eae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Rename patch to the proper naming convention, and add a
    description to it.
  - Add mandatory dependency to OpenSSL.
  - Make the dependency on libwebsock optional.
  - Remove select of host-gengetopt, since this package no longer has
    a menuconfig option.
  - Add missing toolchain option dependencies inherited from selected
    packages.
  - Add proper Config.in help text.
  - Fix the .mk comment header to the proper format.
  - Use the github function and remove the unneeded SITE_METHOD
    variable.
  - Add support for optional Opus and Libogg support.
  - Remove hash file, since the package is fetched from github.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/janus-gateway/0001-disable-ssp.patch |   20 ++++++++++
 package/janus-gateway/Config.in              |   21 ++++++++++
 package/janus-gateway/janus-gateway.mk       |   52 ++++++++++++++++++++++++++
 4 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 43b2b61..a4f5d8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1060,6 +1060,7 @@ endif
 	source "package/iptraf-ng/Config.in"
 	source "package/iputils/Config.in"
 	source "package/iw/Config.in"
+	source "package/janus-gateway/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
new file mode 100644
index 0000000..9ef184a
--- /dev/null
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -0,0 +1,20 @@
+Do not force SSP usage
+
+The toolchain may not support SSP, so do not enforce its usage, let
+the package user pass the appropriate CFLAGS to enable SSP if needed.
+
+Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
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
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
new file mode 100644
index 0000000..6ba5f6a
--- /dev/null
+++ b/package/janus-gateway/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_JANUS_GATEWAY
+	bool "janus-gateway"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBNICE
+	select BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_DING_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libmicrohttpd
+	depends on BR2_USE_WCHAR # libnice -> libglib2
+	depends on BR2_USE_MMU # libnice
+	help
+	  Janus is an open source, general purpose, WebRTC gateway
+	  designed and developed by Meetecho.
+
+	  https://github.com/meetecho/janus-gateway
+
+comment "janus-gateway needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
new file mode 100644
index 0000000..6c89e9a
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# janus-gateway
+#
+################################################################################
+
+JANUS_GATEWAY_VERSION = c632c1e9da5ffd8c34df6086a1aa5a8511a2a02d
+JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
+JANUS_GATEWAY_LICENSE = GPLv3
+JANUS_GATEWAY_LICENSE_FILES = COPYING
+
+# ding-libs provides the ini_config library
+JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson \
+	libnice sofia-sip libsrtp host-gengetopt openssl ding-libs
+
+# Straight out of the repository, no ./configure
+JANUS_GATEWAY_AUTORECONF = YES
+
+define JANUS_GATEWAY_M4
+        mkdir -p $(@D)/m4
+endef
+JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
+
+JANUS_GATEWAY_CONF_OPTS = \
+	--disable-data-channels \
+	--disable-rabbitmq
+
+ifeq ($(BR2_PACKAGE_LIBWEBSOCK),y)
+JANUS_GATEWAY_DEPENDENCIES += libwebsock
+JANUS_GATEWAY_CONF_OPTS += --enable-websockets
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-websockets
+endif
+
+ifeq ($(BR2_PACKAGE_OPUS),y)
+JANUS_GATEWAY_DEPENDENCIES += opus
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
+endif
+
+ifeq ($(BR2_PACKAGE_LIBOGG),y)
+JANUS_GATEWAY_DEPENDENCIES += libogg
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
+endif
+
+# Parallel build broken
+JANUS_GATEWAY_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
