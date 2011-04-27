From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 15:05:10 -0300
Subject: [Buildroot] [PATCH 2/2] openvpn: bump to version 2.2.0
In-Reply-To: <1303927510-18047-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303927510-18047-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303927510-18047-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...=> openvpn-fix-build-with-disable-crypto.patch} |    0
 package/openvpn/openvpn-fix-tmpdir.patch           |   39 ++++++++++++++++++++
 package/openvpn/openvpn.mk                         |   10 +----
 3 files changed, 41 insertions(+), 8 deletions(-)
 rename package/openvpn/{openvpn-2.1.3-fix-build-with-disable-crypto.patch => openvpn-fix-build-with-disable-crypto.patch} (100%)
 create mode 100644 package/openvpn/openvpn-fix-tmpdir.patch

diff --git a/package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch b/package/openvpn/openvpn-fix-build-with-disable-crypto.patch
similarity index 100%
rename from package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch
rename to package/openvpn/openvpn-fix-build-with-disable-crypto.patch
diff --git a/package/openvpn/openvpn-fix-tmpdir.patch b/package/openvpn/openvpn-fix-tmpdir.patch
new file mode 100644
index 0000000..919d49b
--- /dev/null
+++ b/package/openvpn/openvpn-fix-tmpdir.patch
@@ -0,0 +1,39 @@
+From b70d99fb617350b252c8bde2f1f2d81d3f5b7955 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 27 Apr 2011 18:43:50 +0200
+Subject: [PATCH] Fix compile issues when using --enable-small and --disable-ssl/--disable-crypto
+
+The tmp_dir string is required in the options struct regardless of options
+so spin it out of #if conditionals.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Acked-by: David Sommerseth <dazo@users.sourceforge.net>
+Signed-off-by: David Sommerseth <dazo@users.sourceforge.net>
+---
+ options.h |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/options.h b/options.h
+index a9c6a94..8a51502 100644
+--- a/options.h
++++ b/options.h
+@@ -369,6 +369,8 @@ struct options
+   struct plugin_option_list *plugin_list;
+ #endif
+ 
++  const char *tmp_dir;
++
+ #if P2MP
+ 
+ #if P2MP_SERVER
+@@ -409,7 +411,6 @@ struct options
+   const char *client_connect_script;
+   const char *client_disconnect_script;
+   const char *learn_address_script;
+-  const char *tmp_dir;
+   const char *client_config_dir;
+   bool ccd_exclusive;
+   bool disable;
+-- 
+1.7.0.1
+
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 89118b1..27a9a55 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,15 +4,9 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.1.4
+OPENVPN_VERSION = 2.2.0
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_CONF_OPT = --enable-small
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	OPENVPN_CONF_OPT += --enable-pthread
-else
-	OPENVPN_CONF_OPT += --disable-pthread
-endif
+OPENVPN_CONF_OPT = --enable-small --disable-plugins
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
 	OPENVPN_DEPENDENCIES += lzo
-- 
1.7.3.4
