From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 14:10:44 +0200
Subject: [Buildroot] [git commit] vsftpd: correct openssl linking after
	1d046a5c (vsftpd: use pkg-config to get OpenSSL link flags)
Message-ID: <20150513121418.CEAD881D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=205f07755661b64da21509469b46006ea0badcf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/221/221c987a9657caefad54bcc2fe9d2d71189c94c5/
http://autobuild.buildroot.net/results/90c/90cea7c4fdb3e5af923eedf96d79594d6d02e563/

vsftpd directly uses symbols from libcrypto (X509_{digest,free}), so it
needs to link against both.

This doesn't trigger for static builds as libssl internally uses libcrypto
(and lists it in Requires.private).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vsftpd/vsftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index ed15f00..3091f06 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl host-pkgconf
-VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl)
+VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
