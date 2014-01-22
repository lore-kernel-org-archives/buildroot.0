From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 00:51:19 +0100
Subject: [Buildroot] [git commit] rtmpdump: workaround kconfig issue by
	defaulting to gnutls
Message-ID: <20140122235353.61CE59C4E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42ed108013082c6836673aabe8d6258f9e7a490f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we get:

package/openssl/Config.in:1:error: recursive dependency detected!
package/openssl/Config.in:1:    symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_GNUTLS
package/gnutls/Config.in:1:     symbol BR2_PACKAGE_GNUTLS is selected by BR2_PACKAGE_OPENSSL

Which is caused by lftp doing:

  select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL

And rtmpdump doing:

  select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_GNUTLS

Which confuses kconfig. Work around it by swapping gnutls and openssl in
rtmpdump so it matches lftp.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rtmpdump/Config.in b/package/rtmpdump/Config.in
index d13c55b..c37118a 100644
--- a/package/rtmpdump/Config.in
+++ b/package/rtmpdump/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RTMPDUMP
 	bool "librtmp"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_OPENSSL
 	help
 	  rtmpdump - RTMPDump Real-Time Messaging Protocol API
 	  Only librtmp is installed by this package.
