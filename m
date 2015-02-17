From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Feb 2015 13:58:22 +0100
Subject: [Buildroot] [git commit] gnutls: make sure librt detection doesn't
	poison the linker flags
Message-ID: <20150217125839.8C9D08175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b34c63375a88999d232129428a2297f5ddb9c465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like we're passing --with-libpthread-prefix, we also need to pass
--with-librt-prefix in order to avoid having the gnutls build system
detect the librt in /usr/lib, and pass -L/usr/lib to the linker flags.

Fixes:

  http://autobuild.buildroot.org/results/fa5/fa58602cb78ffe3ae4ee389ef5cf5a37b7657c4c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
