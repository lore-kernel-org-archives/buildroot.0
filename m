From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  7 Aug 2018 08:41:22 -0500
Subject: [Buildroot] [PATCH] package/strongswan: add pid dir support for
 netns
Message-ID: <1533649282-62006-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This patch adds BR2_PACKAGE_STRONGSWAN_PID_DIR support to build
strongswan with --with-piddir option.

By default 'charon' and starter daemons create their PID files
and UNIX sockets in '/var/run' directory and that would
conflict if multiple instances would use it.
(ie a network-namespaced or multi-vpn configuration)

This patch provides an option to use custom pid directory to
avoid issue with multiple instances.

For more information, Please visit
https://wiki.strongswan.org/projects/strongswan/wiki/Netns

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/strongswan/Config.in     | 14 ++++++++++++++
 package/strongswan/strongswan.mk |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 0438eec..e2efa7b 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -130,4 +130,18 @@ config BR2_PACKAGE_STRONGSWAN_VICI
 	default y
 	depends on BR2_PACKAGE_STRONGSWAN_CHARON
 
+config BR2_PACKAGE_STRONGSWAN_PID_DIR
+	string "path to pid dir"
+	default "/var/run"
+	help
+	  This option allows the developer to build strongswan
+	  'with-piddir' option. This option is helpful when running
+	  multiple instances of strongswan in separate namespaces.
+
+	  By default 'charon' and starter daemons create their PID
+	  files and UNIX sockets in '/var/run' directory and that
+	  would conflict if multiple instances would use it.
+
+          https://wiki.strongswan.org/projects/strongswan/wiki/Netns
+
 endif
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5c597d5..5edc89c 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -36,7 +36,8 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
-	--with-imcvdir=/usr/lib/ipsec/imcvs
+	--with-imcvdir=/usr/lib/ipsec/imcvs \
+	--with-piddir=$(call qstrip,$(BR2_PACKAGE_STRONGSWAN_PID_DIR))
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
-- 
1.9.1
