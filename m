From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 17:32:02 -0300
Subject: [Buildroot] [PATCHv2] openswan: new package
Message-ID: <1332966722-12750-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |    1 +
 package/openswan/Config.in   |    8 ++++++++
 package/openswan/openswan.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/openswan/Config.in
 create mode 100644 package/openswan/openswan.mk

diff --git a/package/Config.in b/package/Config.in
index 274ea7a..d11099e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
+source "package/openswan/Config.in"
 source "package/openvpn/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
new file mode 100644
index 0000000..3336156
--- /dev/null
+++ b/package/openswan/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OPENSWAN
+	bool "openswan"
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_IPROUTE2
+	help
+	  Openswan is an implementation of IPsec for Linux
+
+	  http://www.openswan.org
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
new file mode 100644
index 0000000..a25ca8f
--- /dev/null
+++ b/package/openswan/openswan.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# openswan
+#
+#############################################################
+
+OPENSWAN_VERSION = 2.6.38
+OPENSWAN_SITE = http://download.openswan.org/openswan
+OPENSWAN_DEPENDENCIES = host-bison gmp iproute2
+OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
+	USERCOMPILE="$(TARGET_CFLAGS)" INC_USRLOCAL=/usr \
+	USE_KLIPS=false USE_MAST=false USE_NM=false
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+	OPENSWAN_DEPENDENCIES += libcurl
+	OPENSWAN_MAKE_OPT += USE_LIBCURL=true
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	OPENSWAN_DEPENDENCIES += openssl
+	OPENSWAN_MAKE_OPT += HAVE_OPENSSL=true
+ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
+	OPENSWAN_MAKE_OPT += HAVE_OCF=true
+endif
+endif
+
+define OPENSWAN_BUILD_CMDS
+	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) programs
+endef
+
+define OPENSWAN_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
