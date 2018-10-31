From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:23:11 +0100
Subject: [Buildroot] [git commit] lighttpd: add optional pam support
Message-ID: <20181031092109.F10788375F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9d75c717e01aed474b7567c969236418e87eda8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let the option depend on linux-pam as pam has quite some dependencies and
this is unlikely to be used if pam isn't explicitly enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 7 +++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 383c10f70f..0f37422aea 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -26,6 +26,13 @@ config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	help
 	  Enable OpenSSL support for lighttpd.
 
+config BR2_PACKAGE_LIGHTTPD_PAM
+       bool "pam authentication support"
+       depends on BR2_PACKAGE_LINUX_PAM
+       default y
+       help
+         Enable PAM authentication support for lighttpd.
+
 config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 44bee6f90f..d8f64dc7e8 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -12,7 +12,6 @@ LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
-	--without-pam \
 	--without-wolfssl \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib
@@ -24,6 +23,13 @@ else
 LIGHTTPD_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_PAM),y)
+LIGHTTPD_DEPENDENCIES += linux-pam
+LIGHTTPD_CONF_OPTS += --with-pam
+else
+LIGHTTPD_CONF_OPTS += --without-pam
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
 LIGHTTPD_CONF_OPTS += --with-zlib
