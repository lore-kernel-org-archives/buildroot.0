From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Nov 2018 14:23:26 +0100
Subject: [Buildroot] [PATCH 2/2] ngrep: add libnet optional dependency
In-Reply-To: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
Message-ID: <20181101132326.13015-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Enable tcpkill based on libnet availability
- Add BSD-3-Clause for tcpkill, added in version 1.46 and
  https://github.com/jpr5/ngrep/commit/f2a1f8b09194a8ab87787c1fdb60b968f5957c05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...heck-for-libnet_init-in-configure-in.patch | 28 +++++++++++++++++++
 package/ngrep/ngrep.mk                        |  9 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch

diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
new file mode 100644
index 0000000000..22b18ab7ee
--- /dev/null
+++ b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
@@ -0,0 +1,28 @@
+From 0a51c8bc62c7b49b8d67a360daa6b1957256f4f5 Mon Sep 17 00:00:00 2001
+From: Romain Francoise <romain@rfr.io>
+Date: Mon, 1 Jan 2018 18:01:13 +0100
+Subject: [PATCH] Check for libnet_init in configure.in
+
+libnet_init_packet was the old libnet 1.0 function which is now long
+deprecated.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5]
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 06c050a..dbef39b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -174,7 +174,7 @@ dnl
+ AC_ARG_ENABLE(tcpkill,
+ [  --enable-tcpkill        enable connection killing support (default off)],
+ [
+-  AC_CHECK_LIB(net, libnet_init_packet,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
++  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   use_tcpkill="$enableval"
+ ],
+ [ use_tcpkill="no" ])
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index f116e34e42..d4c84b9639 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -6,7 +6,7 @@
 
 NGREP_VERSION = 1_47
 NGREP_SITE = $(call github,jpr5,ngrep,V$(NGREP_VERSION))
-NGREP_LICENSE = BSD-4-Clause-like
+NGREP_LICENSE = BSD-4-Clause-like, BSD-3-Clause (tcpkill)
 NGREP_LICENSE_FILES = LICENSE
 NGREP_INSTALL_STAGING = YES
 # We're patching configure.in
@@ -25,4 +25,11 @@ NGREP_CONF_OPTS = \
 
 NGREP_DEPENDENCIES = libpcap pcre
 
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+NGREP_DEPENDENCIES += libnet
+NGREP_CONF_OPTS += --enable-tcpkill
+else
+NGREP_CONF_OPTS += --disable-tcpkill
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
