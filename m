From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Wed, 1 May 2019 16:12:34 +0200
Subject: [Buildroot] [PATCH v2] package/uacme: new package
Message-ID: <20190501141234.GA10484@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/uacme/Config.in  | 14 ++++++++++++++
 package/uacme/uacme.hash |  3 +++
 package/uacme/uacme.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/uacme/Config.in
 create mode 100644 package/uacme/uacme.hash
 create mode 100644 package/uacme/uacme.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ccb0af..4ac1826 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1651,6 +1651,9 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
+F:	package/uacme/
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/package/Config.in b/package/Config.in
index f592e74..da30283 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2054,6 +2054,7 @@ endif
 	source "package/transmission/Config.in"
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
+	source "package/uacme/Config.in"
 	source "package/udpcast/Config.in"
 	source "package/uftp/Config.in"
 	source "package/uhttpd/Config.in"
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
new file mode 100644
index 0000000..96247f9
--- /dev/null
+++ b/package/uacme/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_UACME
+	bool "uacme"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBCURL
+	help
+	  uacme is a client for the ACMEv2 protocol described in
+	  RFC8555, written in plain C code with minimal dependencies
+	  (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
+	  a Certificate Authority (https://letsencrypt.org is a
+	  popular one) and an applicant to automate the process of
+	  verification and certificate issuance.
+
+	  https://github.com/ndilieto/uacme
diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
new file mode 100644
index 0000000..829333a
--- /dev/null
+++ b/package/uacme/uacme.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	31cd4e50b7ff6450ec31cbf19ab50d2f72b4137769e689e4f9f9fd31842198d0	uacme-1.0.7.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
new file mode 100644
index 0000000..ab40fbe
--- /dev/null
+++ b/package/uacme/uacme.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# uacme
+#
+################################################################################
+
+UACME_VERSION = 1.0.7
+# Released versions are on branch upstream/latest, tagged as upstream/X.Y.Z
+# Do not use vX.Y.Z tags from master, as they do not include .tarball-version
+UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
+UACME_LICENSE = GPL-3.0+
+UACME_LICENSE_FILES = COPYING
+
+UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls
+UACME_DEPENDENCIES += mbedtls
+else
+UACME_CONF_OPTS += --without-mbedtls
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+UACME_CONF_OPTS += --with-gnutls=
+UACME_DEPENDENCIES += gnutls
+else
+UACME_CONF_OPTS += --without-gnutls
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
