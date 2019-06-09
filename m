From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 11:38:12 +0200
Subject: [Buildroot] [PATCH 2/4] package/iputils: fix build with NLS
In-Reply-To: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
Message-ID: <20190609093814.14169-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-meson.build-fix-build-with-NLS.patch | 70 +++++++++++++++++++
 package/iputils/iputils.mk                    |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 package/iputils/0003-meson.build-fix-build-with-NLS.patch

diff --git a/package/iputils/0003-meson.build-fix-build-with-NLS.patch b/package/iputils/0003-meson.build-fix-build-with-NLS.patch
new file mode 100644
index 0000000000..f6fd737f43
--- /dev/null
+++ b/package/iputils/0003-meson.build-fix-build-with-NLS.patch
@@ -0,0 +1,70 @@
+From 8719555a530a8981214f1a35df4b17838dc5f3e8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 Jun 2019 10:55:35 +0200
+Subject: [PATCH] meson.build: fix build with NLS
+
+With some toolchains, intl is needed for NLS support so search for this
+library and use if needed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+-[Upstream status: not sent yet]
+---
+ meson.build | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 24bda0c..53a3995 100644
+--- a/meson.build
++++ b/meson.build
+@@ -88,6 +88,9 @@ if opt == true
+ 	subdir ('po')
+ endif
+ 
++# Some systems needs intl for gettext
++intl_dep = cc.find_library('intl', required : false)
++
+ opt = get_option('USE_IDN')
+ if opt == true
+ 	idn_dep = cc.find_library('idn2', required : false)
+@@ -244,7 +247,7 @@ libcommon = static_library(
+ 
+ if build_ping == true
+ 	executable('ping', ['ping.c', 'ping_common.c', 'ping6_common.c', git_version_h],
+-		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, gpg_error_dep, resolv_dep],
++		dependencies : [m_dep, cap_dep, idn_dep, intl_dep, crypto_dep, gpg_error_dep, resolv_dep],
+ 		link_with : [libcommon],
+ 		install: true)
+ 	meson.add_install_script('build-aux/setcap-setuid.sh',
+@@ -257,7 +260,7 @@ endif
+ 
+ if build_tracepath == true
+ 	executable('tracepath', ['tracepath.c', git_version_h],
+-		dependencies : idn_dep,
++		dependencies : [idn_dep, intl_dep],
+ 		link_with : [libcommon],
+ 		install: true)
+ endif
+@@ -277,7 +280,7 @@ endif
+ 
+ if build_clockdiff == true
+ 	executable('clockdiff', ['clockdiff.c', git_version_h],
+-		dependencies : [cap_dep],
++		dependencies : [cap_dep, intl_dep],
+ 		link_with : [libcommon],
+ 		install: true)
+ 	meson.add_install_script('build-aux/setcap-setuid.sh',
+@@ -307,7 +310,7 @@ endif
+ 
+ if build_arping == true
+ 	executable('arping', ['arping.c', git_version_h],
+-		dependencies : [rt_dep, cap_dep, idn_dep],
++		dependencies : [rt_dep, cap_dep, idn_dep, intl_dep],
+ 		link_with : [libcommon],
+ 		install: true)
+ 	meson.add_install_script('build-aux/setcap-setuid.sh',
+-- 
+2.20.1
+
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 2b326838f7..6eae32d594 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -16,6 +16,7 @@ IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
+IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 IPUTILS_CONF_OPTS += -DUSE_CAP=true
-- 
2.20.1
