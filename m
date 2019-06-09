From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 11:38:14 +0200
Subject: [Buildroot] [PATCH 4/4] package/iputils: fix build without setcap
In-Reply-To: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
Message-ID: <20190609093814.14169-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/711718ecf20d6cc28953e089a6e5516cfb4b9031

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-sys-Make-setcap-really-optional.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/iputils/0004-build-sys-Make-setcap-really-optional.patch

diff --git a/package/iputils/0004-build-sys-Make-setcap-really-optional.patch b/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
new file mode 100644
index 0000000000..0024f3fa6f
--- /dev/null
+++ b/package/iputils/0004-build-sys-Make-setcap-really-optional.patch
@@ -0,0 +1,71 @@
+From 473be6467f995865244e7e68b2fa587a4ee79551 Mon Sep 17 00:00:00 2001
+From: Michael Weiss <dev.primeos@gmail.com>
+Date: Thu, 16 May 2019 09:44:27 +0000
+Subject: [PATCH] build-sys: Make setcap really optional
+
+The setcap dependency is marked as optional but meson.build depends on
+setcap.path():
+
+meson.build:246:7: ERROR:  add_install_script args must be strings
+
+[Retrieved from:
+https://github.com/iputils/iputils/commit/473be6467f995865244e7e68b2fa587a4ee79551]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8af9e18..95c778a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -221,10 +221,13 @@ config_h = configure_file(
+ setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
+ if get_option('NO_SETCAP_OR_SUID')
+ 	perm_type = 'none'
++	setcap_path = '/dev/null'
+ elif cap_dep.found() and setcap.found()
+ 	perm_type = 'caps'
++	setcap_path = setcap.path()
+ else
+ 	perm_type = 'setuid'
++	setcap_path = '/dev/null'
+ endif
+ 
+ ############################################################
+@@ -243,7 +246,7 @@ if build_ping == true
+ 		join_paths(get_option('prefix'), get_option('bindir')),
+ 		'ping',
+ 		perm_type,
+-		setcap.path()
++		setcap_path
+ 	)
+ endif
+ 
+@@ -263,7 +266,7 @@ if build_traceroute6 == true
+ 		join_paths(get_option('prefix'), get_option('bindir')),
+ 		'traceroute6',
+ 		perm_type,
+-		setcap.path()
++		setcap_path
+ 	)
+ endif
+ 
+@@ -276,7 +279,7 @@ if build_clockdiff == true
+ 		join_paths(get_option('prefix'), get_option('bindir')),
+ 		'clockdiff',
+ 		perm_type,
+-		setcap.path()
++		setcap_path
+ 	)
+ endif
+ 
+@@ -306,7 +309,7 @@ if build_arping == true
+ 		join_paths(get_option('prefix'), get_option('bindir')),
+ 		'arping',
+ 		perm_type,
+-		setcap.path()
++		setcap_path
+ 	)
+ endif
+ 
-- 
2.20.1
