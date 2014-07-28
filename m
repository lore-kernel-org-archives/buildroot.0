From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 23:26:53 +0200
Subject: [Buildroot] [git commit] flickcurl: adjust openssl dependency
Message-ID: <20140728212843.73A389D2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=563f586e9abd018b3cc348f0e6de78dfc3a54911
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flickcurl does not specifically need openssl: it needs libcurl to have
crypto support to access https:// URLs. So, instead of depending on
openssl in FLICKCURL_DEPENDENCIES, this commit simply leaves it to the
Config.in file to select either OpenSSL, gnutls or libnss to make sure
libcurl will use one of these libraries.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flickcurl/Config.in    |    2 ++
 package/flickcurl/flickcurl.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
index 7b91710..426ceec 100644
--- a/package/flickcurl/Config.in
+++ b/package/flickcurl/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_FLICKCURL
 	bool "flickcurl"
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
+	# Ensure that libcurl is built with crypto support, since
+	# flickcurl must access https:// URLs.
 	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	help
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index 67e8851..4302745 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -11,7 +11,7 @@ FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
 FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
 FLICKCURL_CONF_OPT = --without-curl-config --without-xml2-config --without-raptor
-FLICKCURL_DEPENDENCIES = libcurl libxml2 openssl host-pkgconf
+FLICKCURL_DEPENDENCIES = libcurl libxml2 host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FLICKCURL_UTILS),)
 define FLICKCURL_REMOVE_UTILS
