From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Apr 2019 10:32:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/msmtp: drop unneeded static openssl
 workaround
Message-ID: <20190413083218.6355-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

msmtp uses pkg-config to find openssl dependencies such as lz or latomic
so drop unneeded openssl workaround that was added by
https://git.buildroot.net/buildroot/commit/package/msmtp?id=468bbc1538aaea87beaf455a2ad6ea5a255d5f58

I don't know why it was added seven years ago as msmtp already used
pkg-config at this time:
https://github.com/marlam/msmtp-mirror/blob/rel-1-4-27/configure.ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 079c7c2319..db3d42cd94 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -46,10 +46,6 @@ MSMTP_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPTS += --with-tls=openssl
 MSMTP_DEPENDENCIES += openssl
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl uses zlib, so we need to explicitly link with it when static
-MSMTP_CONF_ENV += LIBS=-lz
-endif
 else
 MSMTP_CONF_OPTS += --with-tls=no
 endif
-- 
2.20.1
