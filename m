From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Apr 2019 19:10:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: always disable zlib in bind
 library
Message-ID: <20190421171039.26556-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/62df959193b7737d436162f93af6b89ea542f8f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 812e4870b9..aa8f66345e 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -40,16 +40,14 @@ DHCP_MAKE_ENV = \
 	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
 	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
 
+#?Always disable zlib in bind library (like all other dependencies, see
+#?bind/Makefile.in)
+DHCP_BIND_CONF_OPTS = --without-zlib
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-DHCP_BIND_CONF_OPTS += --with-zlib
-else
-DHCP_BIND_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_BIND_CONF_OPTS += --without-dlopen
 endif
-- 
2.20.1
