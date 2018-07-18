From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 12:55:41 +0200
Subject: [Buildroot] [git commit] cutelyst: new package
Message-ID: <20180718105122.73B0C888F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5eed34f4497343669b83513a0b6075295597ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A C++ Web Framework built on top of Qt, using
the simple approach of Catalyst (Perl) framework.

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
[Thomas: add entry in DEVELOPERS file, move cmake-package invocation
to the end of .mk file, select BR2_PACKAGE_OPENSSL.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/cutelyst/Config.in     | 10 ++++++++++
 package/cutelyst/cutelyst.hash |  3 +++
 package/cutelyst/cutelyst.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25c3ebe970..257f6ff89e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -510,6 +510,9 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
+N:	Daniel Nicoletti <dantti12@gmail.com>
+F:	package/cutelyst/
+
 N:	Daniel Nystr??m <daniel.nystrom@timeterminal.se>
 F:	package/e2tools/
 
diff --git a/package/Config.in b/package/Config.in
index eedce83616..08a3eac48a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Other GUIs"
 	source "package/kf5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
+	source "package/cutelyst/Config.in"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
new file mode 100644
index 0000000000..5a3974a454
--- /dev/null
+++ b/package/cutelyst/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CUTELYST
+	bool "cutelyst"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_QT5BASE_GUI
+	help
+	  A C++ Web Framework built on top of Qt, using
+	  the simple approach of Catalyst (Perl) framework.
+
+	  https://cutelyst.org
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
new file mode 100644
index 0000000000..58645e50c2
--- /dev/null
+++ b/package/cutelyst/cutelyst.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+sha256  a5d40c5e0027982181529449ffa807492f5759c2c604cdc467e748445721ff28    cutelyst-2.5.1.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
new file mode 100644
index 0000000000..438ac091c6
--- /dev/null
+++ b/package/cutelyst/cutelyst.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# cutelyst
+#
+################################################################################
+
+CUTELYST_VERSION = 2.5.1
+CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
+CUTELYST_INSTALL_STAGING = YES
+CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
+CUTELYST_LICENSE = LGPL-2.1+
+CUTELYST_LICENSE_FILES = COPYING
+CUTELYST_DEPENDENCIES = qt5base
+
+CUTELYST_CONF_OPTS += \
+	-DPLUGIN_CSRFPROTECTION=ON
+
+ifeq ($(BR2_PACKAGE_GRANTLEE),y)
+CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
+else
+CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
+CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
+else
+CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
+else
+CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
+endif
+
+$(eval $(cmake-package))
