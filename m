From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:18:51 +0100
Subject: [Buildroot] [PATCH] gnutls: make sure librt detection doesn't
	poison the linker flags
Message-ID: <1423948731-24850-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like we're passing --with-libpthread-prefix, we also need to pass
--with-librt-prefix in order to avoid having the gnutls build system
detect the librt in /usr/lib, and pass -L/usr/lib to the linker flags.

Fixes:

  http://autobuild.buildroot.org/results/fa5/fa58602cb78ffe3ae4ee389ef5cf5a37b7657c4c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ab176a6..6c64b38 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,6 +17,7 @@ GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 GNUTLS_CONF_OPTS = \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
+	--with-librt-prefix=$(STAGING_DIR) \
 	--disable-rpath \
 	--disable-doc \
 	--disable-guile \
-- 
2.1.0
