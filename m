From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:19:16 +0200
Subject: [Buildroot] [git commit] package/uacme: add openssl optional
 dependency
Message-ID: <20191005211341.765FB88F89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a978d423988fba29b9e0671d5b3fc6e6d01e4e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select openssl if mbedtls or gnutls are not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/Config.in | 2 +-
 package/uacme/uacme.mk  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 96247f9c94..ac59764e1a 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UACME
 	bool "uacme"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	select BR2_PACKAGE_LIBCURL
 	help
 	  uacme is a client for the ACMEv2 protocol described in
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 23d14d12e2..0a662a2646 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -21,6 +21,9 @@ UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UACME_CONF_OPTS += --with-openssl
+UACME_DEPENDENCIES += openssl
 endif
 
 $(eval $(autotools-package))
