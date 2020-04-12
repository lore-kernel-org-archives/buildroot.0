From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:31:54 +0200
Subject: [Buildroot] [git commit] package/mbuffer: new package
Message-ID: <20200412202709.6B9F08E849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e50649e86cfee7491fe721049d355017b79c13af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/mbuffer/Config.in    | 11 +++++++++++
 package/mbuffer/mbuffer.hash |  5 +++++
 package/mbuffer/mbuffer.mk   | 19 +++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed6b3b699f..f974f4c3e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1846,6 +1846,9 @@ F:	package/libfribidi/
 N:	Min Xu <xuminready@gmail.com>
 F:	package/shadowsocks-libev/
 
+N:	Mircea Gliga <gliga.mircea@gmail.com>
+F:	package/mbuffer/
+
 N:	Mirza Krak <mirza.krak@northern.tech>
 F:	package/mender/
 F:	package/mender-artifact/
diff --git a/package/Config.in b/package/Config.in
index ace7dde860..d2b0a9c357 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1729,6 +1729,7 @@ menu "Networking"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
 	source "package/lksctp-tools/Config.in"
+	source "package/mbuffer/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/mbuffer/Config.in b/package/mbuffer/Config.in
new file mode 100644
index 0000000000..81e61877e3
--- /dev/null
+++ b/package/mbuffer/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MBUFFER
+	bool "mbuffer"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	help
+	  mbuffer is a tool for buffering data streams with a large set
+	  of unique features.
+
+	  http://www.maier-komor.de/mbuffer.html
+
+comment "mbuffer needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
new file mode 100644
index 0000000000..80b7b1f26c
--- /dev/null
+++ b/package/mbuffer/mbuffer.hash
@@ -0,0 +1,5 @@
+# From http://www.maier-komor.de/mbuffer.html
+md5 e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
+
+# Locally computed after checking signature upstream
+sha256 8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
new file mode 100644
index 0000000000..6ff6e27a39
--- /dev/null
+++ b/package/mbuffer/mbuffer.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mbuffer
+#
+################################################################################
+
+MBUFFER_VERSION = 20191016
+MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
+MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
+MBUFFER_LICENSE = GPL-3.0+
+MBUFFER_LICENSE_FILES = LICENSE
+MBUFFER_CONF_OPTS = --disable-debug
+MBUFFER_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
+
+# we don't need tests & co. so we specify a target
+# so that the others don't get built, e.g idev.so
+MBUFFER_MAKE_OPTS += mbuffer
+
+$(eval $(autotools-package))
