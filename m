From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:12:55 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] libcurl: security bump to
	version 7.53.0
Message-ID: <20170226211412.3AFAA802BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3abd9c659c9216a873188a4d27e0ce17f21b7255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes CVE-2017-2629 - curl SSL_VERIFYSTATUS ignored

From the advisory (http://www.openwall.com/lists/oss-security/2017/02/21/6):

Curl and libcurl support "OCSP stapling", also known as the TLS Certificate
Status Request extension (using the `CURLOPT_SSL_VERIFYSTATUS` option). When
telling curl to use this feature, it uses that TLS extension to ask for a
fresh proof of the server's certificate's validity. If the server doesn't
support the extension, or fails to provide said proof, curl is expected to
return an error.

Due to a coding mistake, the code that checks for a test success or failure,
ends up always thinking there's valid proof, even when there is none or if the
server doesn't support the TLS extension in question. Contrary to how it used
to function and contrary to how this feature is documented to work.

This could lead to users not detecting when a server's certificate goes
invalid or otherwise be mislead that the server is in a better shape than it
is in reality.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c5f5d9fa4e378f3b81f51284e32ee1c23ab2a575)
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 7a942f2..72cae81 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d16185a767cb2c1ba3d5b9096ec54e5ec198b213f45864a38b3bda4bbf87389b  curl-7.52.1.tar.bz2
+sha256 b2345a8bef87b4c229dedf637cb203b5e21db05e20277c8e1094f0d4da180801  curl-7.53.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ea37309..200915a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.52.1
+LIBCURL_VERSION = 7.53.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
