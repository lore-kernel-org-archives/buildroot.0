From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:35 -0000
Subject: [Buildroot] [git commit] package/redir: new package
Message-ID: <20200902161634.627F385EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6121dc01d8e8ac5eecaa7668b1db84cb02d72c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/redir/Config.in  |  7 +++++++
 package/redir/redir.hash |  4 ++++
 package/redir/redir.mk   | 17 +++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42fa5a4956..9a161c8036 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2061,6 +2061,7 @@ F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
+F:	package/redir/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index 7936cb8105..f122983724 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2181,6 +2181,7 @@ endif
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
