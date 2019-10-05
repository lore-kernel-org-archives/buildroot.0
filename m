From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:13:55 +0200
Subject: [Buildroot] [git commit] package/uacme: fix build with mbedtls and
 gnutls
Message-ID: <20191005210829.BBF7788F83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8045bf03a7c119ada408b971e59b4c59f0e50f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls and gnutls can't be enabled at the same time so prefer gnutls
to keep the same default behavior than the configure file

Fixes:
 - http://autobuild.buildroot.org/results/a016b58d755cc0888680b345844f92de467329b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/uacme.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index d3d692b1f8..6dfd11895d 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -15,18 +15,12 @@ UACME_DEPENDENCIES = libcurl
 
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-UACME_CONF_OPTS += --with-mbedtls
-UACME_DEPENDENCIES += mbedtls
-else
-UACME_CONF_OPTS += --without-mbedtls
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else
-UACME_CONF_OPTS += --without-gnutls
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls
+UACME_DEPENDENCIES += mbedtls
 endif
 
 $(eval $(autotools-package))
