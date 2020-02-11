From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Tue, 11 Feb 2020 15:46:52 +0200
Subject: [Buildroot] [PATCH 1/1] mbuffer: new package
Message-ID: <20200211134652.2909-1-gliga.mircea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
---
 package/Config.in            |  1 +
 package/mbuffer/Config.in    |  8 ++++++++
 package/mbuffer/mbuffer.hash |  5 +++++
 package/mbuffer/mbuffer.mk   | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/mbuffer/Config.in
 create mode 100644 package/mbuffer/mbuffer.hash
 create mode 100644 package/mbuffer/mbuffer.mk

diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..ed173de1d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1703,6 +1703,7 @@ menu "Networking"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
 	source "package/lksctp-tools/Config.in"
+	source "package/mbuffer/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/mbuffer/Config.in b/package/mbuffer/Config.in
new file mode 100644
index 0000000000..5c733c0ec5
--- /dev/null
+++ b/package/mbuffer/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MBUFFER
+	bool "mbuffer"
+	depends on !BR2_STATIC_LIBS
+	help
+	  mbuffer is a tool for buffering data streams with a large set
+	  of unique features.
+
+	  http://www.maier-komor.de/mbuffer.html
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
-- 
2.25.0
