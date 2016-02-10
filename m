From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 09:13:26 -0300
Subject: [Buildroot] [PATCH] wpan-tools: new package
Message-ID: <1455106406-27284-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |  1 +
 .../0001-fix-build-with-newer-libnl.patch          | 40 ++++++++++++++++++++++
 package/wpan-tools/Config.in                       | 11 ++++++
 package/wpan-tools/wpan-tools.hash                 |  4 +++
 package/wpan-tools/wpan-tools.mk                   | 13 +++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/wpan-tools/0001-fix-build-with-newer-libnl.patch
 create mode 100644 package/wpan-tools/Config.in
 create mode 100644 package/wpan-tools/wpan-tools.hash
 create mode 100644 package/wpan-tools/wpan-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 339cec0..7017147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1488,6 +1488,7 @@ endif
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
 	source "package/wpa_supplicant/Config.in"
+	source "package/wpan-tools/Config.in"
 	source "package/wvdial/Config.in"
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
diff --git a/package/wpan-tools/0001-fix-build-with-newer-libnl.patch b/package/wpan-tools/0001-fix-build-with-newer-libnl.patch
new file mode 100644
index 0000000..03e1a03
--- /dev/null
+++ b/package/wpan-tools/0001-fix-build-with-newer-libnl.patch
@@ -0,0 +1,40 @@
+From 51ab69d76aa708c79aed971ee4083abb8cc07201 Mon Sep 17 00:00:00 2001
+From: Stefan Schmidt <stefan@osg.samsung.com>
+Date: Mon, 9 Nov 2015 19:06:25 +0100
+Subject: [PATCH] build: avoid redefinition errors with libnl >= 3.2.27
+
+From 3.2.17 onwards we have nla for s8, s16, etc defined directly in libnl.
+If we keep including this file anyway we run into redefinition errors. Better
+include use our own only for earlier versions.
+
+Happened to me on Fedora 22 after my last update.
+
+Signed-off-by: Stefan Schmidt <stefan@osg.samsung.com>
+Acked-by: Alexander Aring <alex.aring@gmail.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: upstream
+
+ src/nl_extras.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/nl_extras.h b/src/nl_extras.h
+index 9d841aa..c4d1d14 100644
+--- a/src/nl_extras.h
++++ b/src/nl_extras.h
+@@ -1,6 +1,8 @@
+ #ifndef __NL_EXTRAS_H
+ #define __NL_EXTRAS_H
+ 
++#if LIBNL_VER_MIC <= 26
++
+ #ifndef NLA_S8
+ 
+ #define NLA_S8	13
+@@ -43,4 +45,6 @@ static inline int32_t nla_get_s32(struct nlattr *nla)
+ 
+ #endif /* NLA_S64 */
+ 
++#endif /* LIBNL_VER_MIC */
++
+ #endif /* __NL_EXTRAS_H */
diff --git a/package/wpan-tools/Config.in b/package/wpan-tools/Config.in
new file mode 100644
index 0000000..9e32742
--- /dev/null
+++ b/package/wpan-tools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_WPAN_TOOLS
+	bool "wpan-tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBNL
+	help
+	  Userspace tools for Linux IEEE 802.15.4 stack.
+
+	  http://wpan.cakelab.org/
+
+comment "wpan-tools needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
new file mode 100644
index 0000000..fbcf64c
--- /dev/null
+++ b/package/wpan-tools/wpan-tools.hash
@@ -0,0 +1,4 @@
+# From http://wpan.cakelab.org/releases/md5sum
+md5	c6356f7be4de2e9f2084283b9ed7e1ab	wpan-tools-0.5.tar.gz
+# Calculated based on the hash above
+sha256	f381f24eb1962aa9e21751004560371bb9ad8bd0b735bc493930f50e8c1f3d99	wpan-tools-0.5.tar.gz
diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
new file mode 100644
index 0000000..d223800
--- /dev/null
+++ b/package/wpan-tools/wpan-tools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# wpan-tools
+#
+################################################################################
+
+WPAN_TOOLS_VERSION = 0.5
+WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
+WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
+WPAN_TOOLS_LICENSE = iw license
+WPAN_TOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.4.10
