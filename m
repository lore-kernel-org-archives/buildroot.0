From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 17:09:32 +0100
Subject: [Buildroot] [git commit] rtmpdump: don't force a crypto backend
Message-ID: <20140127161129.6950B9C166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=999a91afa3c644ad702545ca979cce26cba08a58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rtmpdump CAN work without a crypto backend (by passing CRYPTO=), so
don't enforce gnutls.

Fixes a dependency issue as gnutls needs wchar, but rtmpdump
(and polarssl/openssl) don't.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/Config.in   |    1 -
 package/rtmpdump/rtmpdump.mk |    5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rtmpdump/Config.in b/package/rtmpdump/Config.in
index c37118a..5e9c508 100644
--- a/package/rtmpdump/Config.in
+++ b/package/rtmpdump/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RTMPDUMP
 	bool "librtmp"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_OPENSSL
 	help
 	  rtmpdump - RTMPDump Real-Time Messaging Protocol API
 	  Only librtmp is installed by this package.
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 7ef9ff4..4f9d247 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -19,9 +19,12 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 else ifeq ($(BR2_PACKAGE_POLARSSL),y)
     RTMPDUMP_DEPENDENCIES += polarssl
     RTMPDUMP_CRYPTO = POLARSSL
-else
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
     RTMPDUMP_DEPENDENCIES += openssl
     RTMPDUMP_CRYPTO = OPENSSL
+else
+    # no crypto
+    RTMPDUMP_CRYPTO =
 endif
 
 RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
