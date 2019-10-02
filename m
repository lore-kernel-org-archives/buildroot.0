From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:41:43 +0200
Subject: [Buildroot] [git commit] package/uacme: new package
Message-ID: <20191002213737.724AE88453@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4900370d2f1204b3989a22408c01365f9a483d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
[Thomas:
 - bump to version 1.0.19
 - drop --disable-maintainer-mode and --disable-debug
 - add missing dependency on libcurl
 - drop = in --with-gnutls=]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/uacme/Config.in  | 14 ++++++++++++++
 package/uacme/uacme.hash |  3 +++
 package/uacme/uacme.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f94c04383..7b93110179 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1711,6 +1711,9 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
+F:	package/uacme/
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/package/Config.in b/package/Config.in
index 4d8fce21c0..b52b2a96e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2095,6 +2095,7 @@ endif
 	source "package/transmission/Config.in"
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
+	source "package/uacme/Config.in"
 	source "package/udpcast/Config.in"
 	source "package/uftp/Config.in"
 	source "package/uhttpd/Config.in"
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
new file mode 100644
index 0000000000..96247f9c94
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
index 0000000000..b7c4d8d8e8
--- /dev/null
+++ b/package/uacme/uacme.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	d5557bbb8a44b8902bd0c45fbdeaa84610a7ef605ec5b0f1245d9eea24c4a640	uacme-1.0.19.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
new file mode 100644
index 0000000000..999cc365e9
--- /dev/null
+++ b/package/uacme/uacme.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# uacme
+#
+################################################################################
+
+UACME_VERSION = 1.0.19
+# Released versions are on branch upstream/latest, tagged as
+# upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
+# include .tarball-version
+UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
+UACME_LICENSE = GPL-3.0+
+UACME_LICENSE_FILES = COPYING
+UACME_DEPENDENCIES = libcurl
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls
+UACME_DEPENDENCIES += mbedtls
+else
+UACME_CONF_OPTS += --without-mbedtls
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+UACME_CONF_OPTS += --with-gnutls
+UACME_DEPENDENCIES += gnutls
+else
+UACME_CONF_OPTS += --without-gnutls
+endif
+
+$(eval $(autotools-package))
