From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Jul 2020 22:24:07 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/uredir: new package
In-Reply-To: <20200714202407.23575-1-ps.report@gmx.net>
References: <20200714202407.23575-1-ps.report@gmx.net>
Message-ID: <20200714202407.23575-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The provided download hash ([1]) differes from actual one, so use
the locally calculated one.

[1] https://github.com/troglobit/uredir/releases/download/v3.3/uredir-3.3.tar.gz.md5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/uredir/Config.in   |  9 +++++++++
 package/uredir/uredir.hash |  4 ++++
 package/uredir/uredir.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/uredir/Config.in
 create mode 100644 package/uredir/uredir.hash
 create mode 100644 package/uredir/uredir.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b07bb040c2..c0006d046a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2047,6 +2047,7 @@ F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
 F:	package/redir/
+F:	package/uredir/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index c9601a01fe..86ed5fe696 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2231,6 +2231,7 @@ endif
 	source "package/unbound/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
+	source "package/uredir/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
 	source "package/vdr-plugin-vnsiserver/Config.in"
diff --git a/package/uredir/Config.in b/package/uredir/Config.in
new file mode 100644
index 0000000000..99206cfe47
--- /dev/null
+++ b/package/uredir/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UREDIR
+	bool "uredir"
+	select BR2_PACKAGE_LIBUEV
+	help
+	  A small Linux daemon to redirect UDP connections. It can be
+	  used to forward connections on small and embedded systems that
+	  do not have (or want to use) iptables.
+
+	  https://github.com/troglobit/uredir
diff --git a/package/uredir/uredir.hash b/package/uredir/uredir.hash
new file mode 100644
index 0000000000..d3dddbcaa2
--- /dev/null
+++ b/package/uredir/uredir.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+md5  154c90eca41909b80cc8c00e567a00e7  uredir-3.3.tar.gz
+# License files
+sha256  e4b8fd3375ce44e5e03be199724a8785510ea5fa58ed92a7a34fd0ccbd35db10  LICENSE
diff --git a/package/uredir/uredir.mk b/package/uredir/uredir.mk
new file mode 100644
index 0000000000..8d74a0fb3d
--- /dev/null
+++ b/package/uredir/uredir.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uredir
+#
+################################################################################
+
+UREDIR_VERSION = 3.3
+UREDIR_SITE = $(call github,troglobit,uredir,v$(UREDIR_VERSION))
+UREDIR_LICENSE = ISC
+UREDIR_LICENSE_FILES = LICENSE
+# no configure provided by tarball download
+UREDIR_AUTORECONF = YES
+UREDIR_DEPENDENCIES = host-pkgconf libuev
+
+$(eval $(autotools-package))
-- 
2.27.0
