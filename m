From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 00:00:45 +0100
Subject: [Buildroot] [PATCH v1] package/sane-backends: bump version to 1.0.32
Message-ID: <20210313230045.29438-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change from '--enable-avahi' to '--with-avahi' as advised in the
  1.0.31 release description ([1])

- add optional libcurl dependency (--with-libcurl)

- add optional poppler/libglib2 dependency (--with-poppler-glib)

- add optional libxml2 dependency (--with-usb-record-replay)

- change COPYING hash (editoral changes)

For details see [1].

[1] https://gitlab.com/sane-project/backends/-/releases

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/sane-backends/sane-backends.hash |  6 +++---
 package/sane-backends/sane-backends.mk   | 27 +++++++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index 09652c993f..e382aacef2 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/sane-project/backends/tags/RELEASE_1_0_27
-sha256 293747bf37275c424ebb2c833f8588601a60b2f9653945d5a3194875355e36c9  sane-backends-1.0.27.tar.gz
+# From https://gitlab.com/sane-project/backends/uploads/a705aadf854ca0dc8bf66df937308861/sane-backends-1.0.32.sha256.txt
+sha256  3a28c237c0a72767086202379f6dc92dbb63ec08dfbab22312cba80e238bb114  sane-backends-1.0.32.tar.gz
 
 # Hash for license file
-sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 3c93ceaaae..697aa3252b 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.0.27
+SANE_BACKENDS_VERSION = 1.0.32
 SANE_BACKENDS_SITE = \
-	https://gitlab.com/sane-project/backends/uploads/a3ba9fff29253a94e84074917bff581a
+	https://gitlab.com/sane-project/backends/uploads/104f09c07d35519cc8e72e604f11643f
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
@@ -44,7 +44,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yyy)
 SANE_BACKENDS_DEPENDENCIES += avahi
-SANE_BACKENDS_CONF_OPTS += --enable-avahi
+SANE_BACKENDS_CONF_OPTS += --with-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
@@ -54,6 +54,27 @@ else
 SANE_BACKENDS_CONF_OPTS += --without-snmp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+SANE_BACKENDS_DEPENDENCIES += libcurl
+SANE_BACKENDS_CONF_OPTS += --with-libcurl
+else
+SANE_BACKENDS_CONF_OPTS += --without-libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER)$(BR2_PACKAGE_LIBGLIB2),yy)
+SANE_BACKENDS_DEPENDENCIES += poppler libglib2
+SANE_BACKENDS_CONF_OPTS += --with-poppler-glib
+else
+SANE_BACKENDS_CONF_OPTS += --without-poppler-glib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+SANE_BACKENDS_DEPENDENCIES += libxml2
+SANE_BACKENDS_CONF_OPTS += --with-usb-record-replay
+else
+SANE_BACKENDS_CONF_OPTS += --without-usb-record-replay
+endif
+
 define SANE_BACKENDS_DISABLE_DOCS
 	$(SED) 's/ doc//' $(@D)/Makefile
 endef
-- 
2.30.1
