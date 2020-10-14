From: Derrick Lyndon Pallas <derrick@meter.com>
Date: Wed, 14 Oct 2020 00:59:21 +0000
Subject: [Buildroot] [PATCH 1/1] package: add ipcalc at version 1.0.0
Message-ID: <20201014005921.27623-1-derrick@meter.com>
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
 package/Config.in                           |  1 +
 package/ipcalc/0001-disable-man-build.patch | 33 +++++++++++++++++++++
 package/ipcalc/Config.in                    |  7 +++++
 package/ipcalc/ipcalc.hash                  |  3 ++
 package/ipcalc/ipcalc.mk                    | 17 +++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/ipcalc/0001-disable-man-build.patch
 create mode 100644 package/ipcalc/Config.in
 create mode 100644 package/ipcalc/ipcalc.hash
 create mode 100644 package/ipcalc/ipcalc.mk

diff --git a/package/Config.in b/package/Config.in
index 09a332e3b9..56508bbc46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1702,6 +1702,7 @@ menu "Networking"
 	source "package/gupnp-dlna/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
+	source "package/ipcalc/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
diff --git a/package/ipcalc/0001-disable-man-build.patch b/package/ipcalc/0001-disable-man-build.patch
new file mode 100644
index 0000000000..767b78162a
--- /dev/null
+++ b/package/ipcalc/0001-disable-man-build.patch
@@ -0,0 +1,33 @@
+diff --git a/meson.build b/meson.build
+index a2169fc..4ac9f46 100644
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
diff --git a/package/ipcalc/Config.in b/package/ipcalc/Config.in
new file mode 100644
index 0000000000..74cf84f4a4
--- /dev/null
+++ b/package/ipcalc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IPCALC
+	bool "ipcalc"
+	help
+	  A modern IPv4/IPv6 ipcalc tool, assisting in network calculations
+	  in command line and as a tool for scripts.
+
+	  https://gitlab.com/ipcalc/ipcalc
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
