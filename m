From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jan 2013 14:23:58 +0100
Subject: [Buildroot] [PATCH] efl/libecore: fix build with gcrypt
Message-ID: <1357046638-2195-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with gnutls, libecore also needs libgcrypt.

Fixes:

  http://autobuild.buildroot.org/results/4da454d6414cf8f4e638defae9b793fb46a0a072/build-end.log

While we're at it, also explicit the --enable-openssl /
--disable-openssl depending on whether openssl is available or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libecore/libecore.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 0220017..e824bfa 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -36,10 +36,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBECORE_DEPENDENCIES += openssl
+LIBECORE_CONF_OPT += --enable-openssl
+else
+LIBECORE_CONF_OPT += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBECORE_DEPENDENCIES += gnutls
+LIBECORE_DEPENDENCIES += gnutls libgcrypt
+LIBECORE_CONF_OPT += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+LIBECORE_CONF_OPT += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
1.7.9.5
