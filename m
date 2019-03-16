From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 16 Mar 2019 09:05:20 +0200
Subject: [Buildroot] [PATCH 1/1] uftp: new package
Message-ID: <20190316070520.10174-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Encrypted UDP based FTP with multicast.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/uftp/Config.in |  7 +++++++
 package/uftp/uftp.hash |  3 +++
 package/uftp/uftp.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/uftp/Config.in
 create mode 100644 package/uftp/uftp.hash
 create mode 100644 package/uftp/uftp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 778dffa5d5..986a42e64d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -218,6 +218,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/libuv/
 F:	package/python*
+F:	package/uftp/
 F:	package/zeromq/
 
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
diff --git a/package/Config.in b/package/Config.in
index 30391cfc89..bc855060c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2029,6 +2029,7 @@ endif
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
+	source "package/uftp/Config.in"
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/ushare/Config.in"
diff --git a/package/uftp/Config.in b/package/uftp/Config.in
new file mode 100644
index 0000000000..b6a8961628
--- /dev/null
+++ b/package/uftp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UFTP
+	bool "uftp"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Encrypted UDP based FTP with multicast.
+
+	  http://uftp-multicast.sourceforge.net/
diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
new file mode 100644
index 0000000000..57016f2081
--- /dev/null
+++ b/package/uftp/uftp.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256
+sha256	c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48	uftp-4.9.9.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
new file mode 100644
index 0000000000..bbc362652b
--- /dev/null
+++ b/package/uftp/uftp.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# uftp
+#
+################################################################################
+
+UFTP_VERSION = 4.9.9
+UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
+UFTP_DEPENDENCIES = openssl
+UFTP_LICENSE = GPL-3.0+
+UFTP_LICENSE_FILES = LICENSE.txt
+
+define UFTP_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define UFTP_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.19.1
