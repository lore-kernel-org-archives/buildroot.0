From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 00:14:05 +0200
Subject: [Buildroot] [git commit] c-icap-modules: new package
Message-ID: <20150712222507.0041E7FF9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea443e624ccef4d17f88f52289c7d2154cf59495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Do not pass custom CFLAGS and remove the hacks on the Makefile:
    since the c-icap-config script is now fixed, it returns correct
    values, and the hacks are no longer needed.
  - Add optional dependency on zlib and berkeleydb.
  - Explicitly disable clamav support.]

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/c-icap-modules/Config.in         |    7 ++++++
 package/c-icap-modules/c-icap-modules.mk |   32 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e1b81a9..9787521 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1163,6 +1163,7 @@ menu "Networking applications"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
+	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap-modules/Config.in b/package/c-icap-modules/Config.in
new file mode 100644
index 0000000..616456b
--- /dev/null
+++ b/package/c-icap-modules/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_C_ICAP_MODULES
+	bool "c-icap-modules"
+	depends on BR2_PACKAGE_C_ICAP
+	help
+	  Additionals modules for c-icap server.
+
+	  http://c-icap.sourceforge.net/
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
new file mode 100644
index 0000000..27c57e1
--- /dev/null
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# c-icap-modules
+#
+################################################################################
+
+C_ICAP_MODULES_VERSION = 0.3.2
+C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
+C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_MODULES_LICENCE = GPLv2+
+C_ICAP_MODULES_LICENCE_FILE = COPYING
+C_ICAP_MODULES_DEPENDENCIES = c-icap
+
+C_ICAP_MODULES_CONF_OPTS = \
+	--with-c-icap=$(STAGING_DIR)/usr/ \
+	--without-clamav
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+C_ICAP_MODULES_CONF_OPTS += --with-zlib
+C_ICAP_MODULES_DEPENDENCIES += zlib
+else
+C_ICAP_MODULES_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+C_ICAP_MODULES_CONF_OPTS += --with-bdb
+C_ICAP_MODULES_DEPENDENCIES += berkeleydb
+else
+C_ICAP_MODULES_CONF_OPTS += --without-bdb
+endif
+
+$(eval $(autotools-package))
