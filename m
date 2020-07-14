From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Jul 2020 22:24:05 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/redir: new package
Message-ID: <20200714202407.23575-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/redir/Config.in  |  7 +++++++
 package/redir/redir.hash |  4 ++++
 package/redir/redir.mk   | 17 +++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/redir/Config.in
 create mode 100644 package/redir/redir.hash
 create mode 100644 package/redir/redir.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index efbb676b48..69ef58e72f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2045,6 +2045,7 @@ F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
+F:	package/redir/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index aafaa312a1..9592920f3a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2175,6 +2175,7 @@ endif
 	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
 	source "package/reaver/Config.in"
+	source "package/redir/Config.in"
 	source "package/rp-pppoe/Config.in"
 	source "package/rpcbind/Config.in"
 	source "package/rsh-redone/Config.in"
diff --git a/package/redir/Config.in b/package/redir/Config.in
new file mode 100644
index 0000000000..6e51c64218
--- /dev/null
+++ b/package/redir/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_REDIR
+	bool "redir"
+	depends on BR2_USE_MMU # fork()
+	help
+	  This is a TCP port redirector for UNIX.
+
+	  https://github.com/troglobit/redir
diff --git a/package/redir/redir.hash b/package/redir/redir.hash
new file mode 100644
index 0000000000..8cc19f6ac6
--- /dev/null
+++ b/package/redir/redir.hash
@@ -0,0 +1,4 @@
+# From https://github.com/troglobit/redir/releases/download/v3.3/redir-3.3.tar.xz.md5
+md5  b452e1ca6faded7bab9c76dd61d9d983  redir-3.3.tar.xz
+# License files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/redir/redir.mk b/package/redir/redir.mk
new file mode 100644
index 0000000000..ea02d43a12
--- /dev/null
+++ b/package/redir/redir.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# redir
+#
+################################################################################
+
+REDIR_VERSION = 3.3
+REDIR_SOURCE = redir-$(REDIR_VERSION).tar.xz
+REDIR_SITE = https://github.com/troglobit/redir/releases/download/v$(REDIR_VERSION)
+REDIR_LICENSE = GPL-2.0+
+REDIR_LICENSE_FILES = COPYING
+REDIR_CONF_OPTS = \
+	--disable-compat \
+	--enable-shaper \
+	--enable-ftp
+
+$(eval $(autotools-package))
-- 
2.27.0
