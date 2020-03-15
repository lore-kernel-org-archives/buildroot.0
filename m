From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:57:15 +0100
Subject: [Buildroot] [git commit] package/tinyproxy: new package
Message-ID: <20200315215403.C50F4817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=feec90de86245eea83eb0e01849c00fa387936da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tinyproxy is a small, efficient HTTP/SSL proxy daemon.

https://tinyproxy.github.io

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 .../0001-Makefile.am-remove-docs-subdir.patch      | 27 ++++++++++++++++++++++
 package/tinyproxy/Config.in                        | 16 +++++++++++++
 package/tinyproxy/tinyproxy.hash                   |  2 ++
 package/tinyproxy/tinyproxy.mk                     | 15 ++++++++++++
 6 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcd293b4fb..16670a607b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,6 +132,9 @@ F:	package/minimodem/
 N:	Alexander Lukichev <alexander.lukichev@gmail.com>
 F:	package/openpgm/
 
+N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
+F:	package/tinyproxy/
+
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
diff --git a/package/Config.in b/package/Config.in
index abcc9cdad5..afe32f52b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2179,6 +2179,7 @@ endif
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
+	source "package/tinyproxy/Config.in"
 	source "package/tinyssh/Config.in"
 	source "package/tor/Config.in"
 	source "package/traceroute/Config.in"
diff --git a/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch b/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
new file mode 100644
index 0000000000..e2a08678a3
--- /dev/null
+++ b/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
@@ -0,0 +1,27 @@
+From 7ce6ee22057489d280e0ea5f6439edbbf0ad7ee2 Mon Sep 17 00:00:00 2001
+From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
+Date: Sat, 14 Mar 2020 12:45:29 +0300
+Subject: [PATCH] Makefile.am: remove docs subdir
+
+This avoids building the documentation, which requires asciidoc.
+
+Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e9113c2..2fe3d54 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,6 @@ SUBDIRS = \
+ 	src \
+ 	data \
+ 	etc \
+-	docs \
+ 	m4macros \
+ 	tests
+ 
+-- 
+2.20.1
+
diff --git a/package/tinyproxy/Config.in b/package/tinyproxy/Config.in
new file mode 100644
index 0000000000..aec2ab81a8
--- /dev/null
+++ b/package/tinyproxy/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TINYPROXY
+	bool "tinyproxy"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  Tinyproxy is a small, efficient HTTP/SSL proxy daemon released
+	  under the GNU General Public License. Tinyproxy is very
+	  useful in a small network setting, where a larger proxy would
+	  be too resource intensive.
+
+	  https://tinyproxy.github.io
+
+comment "tinyproxy needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
new file mode 100644
index 0000000000..2d439de517
--- /dev/null
+++ b/package/tinyproxy/tinyproxy.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 ff4f3d1331d6d855d8b6ed794c22ab0a4285dd81fe9c98a7aa7ed591248d4ab9 tinyproxy-1.10.0.tar.gz
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
new file mode 100644
index 0000000000..f1a2a50c32
--- /dev/null
+++ b/package/tinyproxy/tinyproxy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# tinyproxy
+#
+################################################################################
+
+TINYPROXY_VERSION = 1.10.0
+TINYPROXY_SITE = $(call github,tinyproxy,tinyproxy,$(TINYPROXY_VERSION))
+TINYPROXY_LICENSE = GPL-2.0+
+TINYPROXY_LICENSE_FILES = COPYING
+
+# building from a git clone and patching Makefile.am
+TINYPROXY_AUTORECONF = YES
+
+$(eval $(autotools-package))
