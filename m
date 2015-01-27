From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:44:37 +0100
Subject: [Buildroot] [git commit] new package: freeradius-client
Message-ID: <20150127224500.679BE80E1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5afafaaeafe3a3706a20a98e92202ec44cd1061f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bender <codehero@gmail.com>
[yann.morin.1998 at free.fr:
  - add optional dependency to nettle
  - fix build against nettle
  - switch to using the ftp for release, instead of github
  - add missing dependency to host-pkgconf
  - remove extraneous configure options, we already pass them
  - drop extraneous ac_cv_func_memcmp_working, we already pass it
  - drop extraneous ac_cv_func_uname, it is properly found
  - add hash file
  - tweak help entry
]
[Peter: license is BSD-2c]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 .../freeradius-client/0001-fix-for-nettle.patch    |   20 ++++++++++++++++++
 package/freeradius-client/Config.in                |    7 ++++++
 package/freeradius-client/freeradius-client.hash   |    2 +
 package/freeradius-client/freeradius-client.mk     |   22 ++++++++++++++++++++
 5 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 352d73a..d65de70 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -821,6 +821,7 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
+	source "package/freeradius-client/Config.in"
 	source "package/fmlib/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
diff --git a/package/freeradius-client/0001-fix-for-nettle.patch b/package/freeradius-client/0001-fix-for-nettle.patch
new file mode 100644
index 0000000..a862c74
--- /dev/null
+++ b/package/freeradius-client/0001-fix-for-nettle.patch
@@ -0,0 +1,20 @@
+lib/rc-md5: fix build when nettle is enabled
+
+rc-md5 uses size_t, which is defined in string.h. This include is
+missing when built against nettle.
+
+Just add it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN freeradius-client-1.1.7.orig/lib/rc-md5.h freeradius-client-1.1.7/lib/rc-md5.h
+--- freeradius-client-1.1.7.orig/lib/rc-md5.h	2015-01-19 17:18:26.000000000 +0100
++++ freeradius-client-1.1.7/lib/rc-md5.h	2015-01-25 22:56:07.815626476 +0100
+@@ -13,6 +13,7 @@
+ 
+ #ifdef HAVE_NETTLE
+ 
++#include <string.h> /* size_t */
+ #include <nettle/md5-compat.h>
+ 
+ #else
diff --git a/package/freeradius-client/Config.in b/package/freeradius-client/Config.in
new file mode 100644
index 0000000..773adb8
--- /dev/null
+++ b/package/freeradius-client/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FREERADIUS_CLIENT
+	bool "freeradius-client"
+	help
+	  FreeRADIUS Client is a framework and library for
+	  writing RADIUS Clients.
+
+	  http://wiki.freeradius.org/project/Radiusclient
diff --git a/package/freeradius-client/freeradius-client.hash b/package/freeradius-client/freeradius-client.hash
new file mode 100644
index 0000000..5931ac2
--- /dev/null
+++ b/package/freeradius-client/freeradius-client.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  eada2861b8f4928e3ac6b5bbfe11e92cd6cdcacfce40cae1085e77c1b6add0e9  freeradius-client-1.1.7.tar.gz
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
new file mode 100644
index 0000000..00913c7
--- /dev/null
+++ b/package/freeradius-client/freeradius-client.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# freeradius-client
+#
+################################################################################
+
+FREERADIUS_CLIENT_VERSION = 1.1.7
+FREERADIUS_CLIENT_SITE = ftp://ftp.freeradius.org/pub/freeradius/
+FREERADIUS_CLIENT_LICENSE = BSD-2c
+FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT
+FREERADIUS_CLIENT_INSTALL_STAGING = YES
+
+FREERADIUS_CLIENT_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+FREERADIUS_CLIENT_DEPENDENCIES += nettle
+FREERADIUS_CLIENT_CONF_OPTS += --with-nettle=yes
+else
+FREERADIUS_CLIENT_CONF_OPTS += --with-nettle=no
+endif
+
+$(eval $(autotools-package))
