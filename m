From: Derrick Lyndon Pallas <derrick@meter.com>
Date: Wed, 14 Oct 2020 19:06:14 +0000
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: new package
Message-ID: <20201014190614.30321-1-derrick@meter.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipcalc is an ancient and venerable tool for manipulating IP addresses,
networks, & interfaces from shell scripts.  There is a subtool in busybox,
but it does not support everything the upstream tool [1] supports.

[1] https://gitlab.com/ipcalc/ipcalc

Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/busybox/busybox.mk                    |  1 +
 ...not-fail-to-build-if-ronn-is-missing.patch | 49 +++++++++++++++++++
 .../0002-Include-stdarg-for-va_list.patch     | 29 +++++++++++
 package/ipcalc/Config.in                      |  9 ++++
 package/ipcalc/ipcalc.hash                    |  3 ++
 package/ipcalc/ipcalc.mk                      | 17 +++++++
 8 files changed, 112 insertions(+)
 create mode 100644 package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
 create mode 100644 package/ipcalc/0002-Include-stdarg-for-va_list.patch
 create mode 100644 package/ipcalc/Config.in
 create mode 100644 package/ipcalc/ipcalc.hash
 create mode 100644 package/ipcalc/ipcalc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 79a9eaa563..ab69e2b630 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -731,6 +731,9 @@ F:	package/tcllib/
 N:	Denis Bodor <lefinnois@lefinnois.net>
 F:	package/libstrophe/
 
+N:	Derrick Lyndon Pallas <derrick@meter.com>
+F:	package/ipcalc/
+
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
 
diff --git a/package/Config.in b/package/Config.in
index 09a332e3b9..8cfe3a7f74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2108,6 +2108,7 @@ menu "Networking applications"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
 	source "package/iodine/Config.in"
+	source "package/ipcalc/Config.in"
 	source "package/iperf/Config.in"
 	source "package/iperf3/Config.in"
 	source "package/iproute2/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7862beb790..01f7331221 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -42,6 +42,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
+	$(if $(BR2_PACKAGE_IPCALC),ipcalc) \
 	$(if $(BR2_PACKAGE_IPROUTE2),iproute2) \
 	$(if $(BR2_PACKAGE_IPUTILS),iputils) \
 	$(if $(BR2_PACKAGE_KMOD),kmod) \
diff --git a/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch b/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
new file mode 100644
index 0000000000..419f4bba44
--- /dev/null
+++ b/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
@@ -0,0 +1,49 @@
+From 322294d7bf61f9fdf0e45e9b6c6013a7c6a35bfd Mon Sep 17 00:00:00 2001
+From: Derrick Lyndon Pallas <derrick@meter.com>
+Date: Wed, 14 Oct 2020 18:25:54 +0000
+Subject: [PATCH] Do not fail to build if ronn is missing
+
+If ruby-ronn is missing, we can not compile the man page from markdown but
+that should not prevent the application from building.
+
+Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
+---
+ meson.build | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a2169fc..981d4a4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,16 +72,17 @@ ipcalc = executable('ipcalc',
+ 	install : true
+ )
+ 
+-ronn = find_program('ronn', required: true)
+-
+-ipcalc_1 = custom_target(
+-	'ipcalc.1',
+-	output : 'ipcalc.1',
+-	input : 'ipcalc.1.md',
+-	command : [ronn, '--pipe', '-r', '@INPUT@'],
+-	capture: true,
+-	install_dir: join_paths(get_option('mandir'), 'man1'),
+-	install: true
+-)
++ronn = find_program('ronn', required: false)
++if ronn.found()
++	ipcalc_1 = custom_target(
++		'ipcalc.1',
++		output : 'ipcalc.1',
++		input : 'ipcalc.1.md',
++		command : [ronn, '--pipe', '-r', '@INPUT@'],
++		capture: true,
++		install_dir: join_paths(get_option('mandir'), 'man1'),
++		install: true
++	)
++endif
+ 
+ subdir('tests')
+-- 
+2.28.0
+
diff --git a/package/ipcalc/0002-Include-stdarg-for-va_list.patch b/package/ipcalc/0002-Include-stdarg-for-va_list.patch
new file mode 100644
index 0000000000..de23a56303
--- /dev/null
+++ b/package/ipcalc/0002-Include-stdarg-for-va_list.patch
@@ -0,0 +1,29 @@
+From 7795c02fb1e0f5fdbdf949007e52684c590235d4 Mon Sep 17 00:00:00 2001
+From: Derrick Lyndon Pallas <derrick@meter.com>
+Date: Wed, 14 Oct 2020 18:40:38 +0000
+Subject: [PATCH 2/2] Include stdarg for va_list
+
+While several function signatures use va_list, stdarg was never included.
+This fixes that.
+
+Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
+---
+ ipcalc.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ipcalc.h b/ipcalc.h
+index 0e81320..a220dc5 100644
+--- a/ipcalc.h
++++ b/ipcalc.h
+@@ -20,6 +20,8 @@
+ #ifndef _IPCALC_H
+ #define _IPCALC_H
+ 
++#include <stdarg.h> /* for va_list */
++
+ #if defined(USE_GEOIP)
+   void geo_ip_lookup(const char *ip, char **country, char **ccode, char **city, char  **coord);
+   int geo_setup(void);
+-- 
+2.28.0
+
diff --git a/package/ipcalc/Config.in b/package/ipcalc/Config.in
new file mode 100644
index 0000000000..7cbb09253f
--- /dev/null
+++ b/package/ipcalc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IPCALC
+	bool "ipcalc"
+	help
+	  A modern IPv4/IPv6 ipcalc tool, assisting in network calculations
+	  in command line and as a tool for scripts.
+
+	  https://gitlab.com/ipcalc/ipcalc
+
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
new file mode 100644
index 0000000000..df610eb693
--- /dev/null
+++ b/package/ipcalc/ipcalc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d7aca371335ab3e35364bcfe34cd0229db005be8bebb9236608ec318cb3f7748  ipcalc-1.0.0.tar.bz2
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
new file mode 100644
index 0000000000..c4ce8b9ceb
--- /dev/null
+++ b/package/ipcalc/ipcalc.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# ipcalc
+#
+################################################################################
+
+IPCALC_VERSION = 1.0.0
+IPCALC_SITE = https://gitlab.com/ipcalc/ipcalc/-/archive/$(IPCALC_VERSION)
+IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
+IPCALC_LICENSE = GPL-2.0+
+IPCALC_LICENSE_FILES = COPYING
+
+IPCALC_CONF_OPTS = \
+	-Duse_maxminddb=disabled \
+	-Duse_geoip=disabled
+
+$(eval $(meson-package))
-- 
2.28.0
