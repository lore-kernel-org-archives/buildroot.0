From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Jul 2012 23:59:44 +0200
Subject: [Buildroot] [git commit] msmtp: fix static linking with openssl
Message-ID: <20120701220033.302A0807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=468bbc1538aaea87beaf455a2ad6ea5a255d5f58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl depends on zlib, so we need to explicitly link with
zlib as well when statically linking.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/msmtp/msmtp.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 2c71229..d5e6a31 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -13,6 +13,10 @@ MSMTP_DEPENDENCIES += host-pkg-config
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPT += --with-ssl=openssl
 MSMTP_DEPENDENCIES += openssl
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+# openssl uses zlib, so we need to explicitly link with it when static
+MSMTP_CONF_ENV += LIBS=-lz
+endif
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 MSMTP_CONF_OPT += --with-ssl=gnutls
 MSMTP_DEPENDENCIES += gnutls
