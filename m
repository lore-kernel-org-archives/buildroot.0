From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:14:35 +0100
Subject: [Buildroot] [git commit] libkcapi: new package
Message-ID: <20170318142012.046FA82552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc86a9813301fde21652009d6473c68553322ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a userspace library that allows easy use of crypto
interfaces exposed by the kernel.

A git tip is used instead of the last official release, as autotools
support and cross-compilation fixes have been added only very recently.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas:
 - Change sub-option prompt to "build test applications"
 - Be more specific about the license: the library is under BSD-3c only,
   while the programs are under BSD-3c or GPLv2.
 - Explicitly disable programs when BR2_PACKAGE_LIBKCAPI_APPS is not
   enabled.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/libkcapi/Config.in     | 16 ++++++++++++++++
 package/libkcapi/libkcapi.hash |  2 ++
 package/libkcapi/libkcapi.mk   | 20 ++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0665e5a..746a547 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1003,6 +1003,9 @@ F:	package/easydbus/
 F:	package/rs485conf/
 F:	package/turbolua/
 
+N:	Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+F:	package/libkcapi/
+
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
 F:	package/polkit/
diff --git a/package/Config.in b/package/Config.in
index 7308378..ab76a77 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -933,6 +933,7 @@ menu "Crypto"
 	source "package/libgcrypt/Config.in"
 	source "package/libgpg-error/Config.in"
 	source "package/libgpgme/Config.in"
+	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
new file mode 100644
index 0000000..453dc69
--- /dev/null
+++ b/package/libkcapi/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBKCAPI
+	bool "libkcapi"
+	help
+	  Linux Kernel Crypto API userspace interface library
+
+	  http://www.chronox.de/libkcapi.html
+
+if BR2_PACKAGE_LIBKCAPI
+
+config BR2_PACKAGE_LIBKCAPI_APPS
+	bool "build test applications"
+	help
+	  Build additional test applications that can provide
+	  performance or algorithm tests.
+
+endif
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
new file mode 100644
index 0000000..e191970
--- /dev/null
+++ b/package/libkcapi/libkcapi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1ed007a35d9fe31383d1131e9f8e14af4df8d55e6c48828b5075324b2876364a	libkcapi-a039f8a5adca57dc69a19d7361600c2f410e0c26.tar.gz
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
new file mode 100644
index 0000000..9488098
--- /dev/null
+++ b/package/libkcapi/libkcapi.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libkcapi
+#
+################################################################################
+
+LIBKCAPI_VERSION = a039f8a5adca57dc69a19d7361600c2f410e0c26
+LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
+LIBKCAPI_AUTORECONF = YES
+LIBKCAPI_INSTALL_STAGING = YES
+LIBKCAPI_LICENSE = BSD-3c (library), BSD-3c or GPLv2 (programs)
+LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
+
+ifeq ($(BR2_PACKAGE_LIBKCAPI_APPS),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-speed --enable-kcapi-test --enable-apps
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-speed --disable-kcapi-test --disable-apps
+endif
+
+$(eval $(autotools-package))
