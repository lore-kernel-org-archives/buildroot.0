From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 Jun 2019 23:49:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix static build with
 gcrypt
Message-ID: <20190607214931.30262-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n.build-fix-static-build-with-gcrypt.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch

diff --git a/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch b/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
new file mode 100644
index 0000000000..de58b7e03e
--- /dev/null
+++ b/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
@@ -0,0 +1,55 @@
+From 940f19a51e334ac23a4bc43bbcb17dfc5cea3cf0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 7 Jun 2019 23:17:13 +0200
+Subject: [PATCH] meson.build: fix static build with gcrypt
+
+Use dependency instead of cc.find_library to find gcrypt dependencies
+such as gpg-error otherwise static build will fail
+
+Fixes:
+ - http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/iputils/iputils/pull/185]
+---
+ meson.build        | 3 ++-
+ ninfod/meson.build | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 84e4360..68de2b0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -106,6 +106,7 @@ if crypto == 'nettle'
+ 	conf.set('USE_NETTLE', 1, description : 'If set use nettle crypto library.')
+ elif crypto == 'gcrypt'
+ 	crypto_dep = cc.find_library('gcrypt')
++	gpg_error_dep = cc.find_library('gpg-error')
+ 	conf.set('USE_GCRYPT', 1, description : 'If set use gcrypt crypto library.')
+ elif crypto == 'openssl'
+ 	crypto_dep = dependency('openssl')
+@@ -241,7 +242,7 @@ libcommon = static_library(
+ 
+ if build_ping == true
+ 	executable('ping', ['ping.c', 'ping_common.c', 'ping6_common.c', git_version_h],
+-		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, resolv_dep],
++		dependencies : [m_dep, cap_dep, idn_dep, crypto_dep, gpg_error_dep, resolv_dep],
+ 		link_with : [libcommon],
+ 		install: true)
+ 	meson.add_install_script('build-aux/setcap-setuid.sh',
+diff --git a/ninfod/meson.build b/ninfod/meson.build
+index a0ee94d..1e7aa26 100644
+--- a/ninfod/meson.build
++++ b/ninfod/meson.build
+@@ -10,7 +10,7 @@ ninfod_sources = files('''
+ 	ninfod_name.c
+ '''.split())
+ executable('ninfod', [ninfod_sources, git_version_h],
+-	dependencies : [cap_dep, crypto_dep, rt_dep, threads],
++	dependencies : [cap_dep, crypto_dep, gpg_error_dep, rt_dep, threads],
+ 	link_with : [libcommon],
+ 	include_directories : inc,
+ 	install: true,
+-- 
+2.20.1
+
-- 
2.20.1
