From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 26 Sep 2013 08:59:34 -0500
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
Message-ID: <1380203974-16321-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix issues with some toolchains not finding libssl or libgcrypt.

Fixes http://autobuild.buildroot.net/results/eeaaf41c0c5f88357af8445750dce776774c2b5d
Fixes http://autobuild.buildroot.net/results/7a2590a7c3a1f52590f3e886b7cf9d04ad966a10

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/libssh2/libssh2.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 10eb5ed..ff35d9e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -15,10 +15,12 @@ LIBSSH2_CONF_OPT = --disable-examples-build
 # Only select openssl if libgcrypt is not selected
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
-LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
+LIBSSH2_CONF_OPT += --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	 --without-openssl
 else
 LIBSSH2_DEPENDENCIES += openssl
-LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
+LIBSSH2_CONF_OPT += --with-openssl --with-libssl-prefix=$(STAGING_DIR)/usr \
+	--without-libgcrypt
 endif
 
 # Add zlib support if enabled
-- 
1.7.1
