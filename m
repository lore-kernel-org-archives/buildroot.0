From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sat, 18 Apr 2020 23:26:17 +0200
Subject: [Buildroot] [PATCH v2] package/uacme: bump version to 1.2.2
Message-ID: <20200418212617.rmizagunxkkzwwom@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version includes a new binary named "ualpn", a proxying
ACMEv2 tls-alpn-01 responder.

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
Changes v1 -> v2:
  - Fixed unintentional revert of commit b7eacd41bba
    http://lists.busybox.net/pipermail/buildroot/2020-April/280506.html

 package/uacme/Config.in  | 15 ++++++++++++++-
 package/uacme/uacme.hash |  2 +-
 package/uacme/uacme.mk   |  8 +++++++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index ea9babfda7..f3830840b6 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_UACME
 	select BR2_PACKAGE_LIBCURL
 	help
 	  uacme is a client for the ACMEv2 protocol described in
-	  RFC8555, written in plain C code with minimal dependencies
+	  RFC8555, written in plain C with minimal dependencies
 	  (libcurl and either of GnuTLS, OpenSSL or mbedTLS). The
 	  ACMEv2 protocol allows a Certificate Authority
 	  (https://letsencrypt.org is a popular one) and an applicant
@@ -13,3 +13,16 @@ config BR2_PACKAGE_UACME
 	  issuance.
 
 	  https://github.com/ndilieto/uacme
+
+if BR2_PACKAGE_UACME
+
+config BR2_PACKAGE_UACME_UALPN
+	bool "enable ualpn"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEV
+	default y
+	help
+	  Build and install ualpn, the transparent proxying tls-alpn-01
+	  challenge responder.
+
+endif
diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 5c68680b54..abc30a7e54 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	08070779232c9711a227189ee2d3cb55042f6be2ea0aa59525cb7b554c4688b0        uacme-1.0.22.tar.gz
+sha256	26fa153118fc895f0961502d644e3606cccb7fb261594c2b7dd293decd0b0174        uacme-1.2.2.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index c5931e2682..946c69ba83 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.0.22
+UACME_VERSION = 1.2.2
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
@@ -26,4 +26,10 @@ UACME_CONF_OPTS += --with-openssl
 UACME_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
+UACME_DEPENDENCIES += libev
+else
+UACME_CONF_OPTS += --without-ualpn
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
