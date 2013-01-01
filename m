From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 15:34:40 +0100
Subject: [Buildroot] [git commit] efl/libecore: fix build with gcrypt
Message-ID: <20130101143641.244D69A57F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=560e7db37433fc82760f71557dbc3e495f05f909
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with gnutls, libecore also needs libgcrypt.

Fixes:

  http://autobuild.buildroot.org/results/4da454d6414cf8f4e638defae9b793fb46a0a072/build-end.log

While we're at it, also explicit the --enable-openssl /
--disable-openssl depending on whether openssl is available or not.

[Peter: only enable gnutls support when both gnutls and gcrypt are enabled]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 0220017..dfc5750 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -36,10 +36,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBECORE_DEPENDENCIES += openssl
+LIBECORE_CONF_OPT += --enable-openssl
+else
+LIBECORE_CONF_OPT += --disable-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBECORE_DEPENDENCIES += gnutls
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
+LIBECORE_DEPENDENCIES += gnutls libgcrypt
+LIBECORE_CONF_OPT += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+LIBECORE_CONF_OPT += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
