From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 11:33:04 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/nodejs: security
 bump to version 12.20.1
Message-ID: <20210112101551.B28E387599@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b6397c10f36bd5d6b59773c25ab47e3e10e0c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-8265: use-after-free in TLSWrap (High) Affected Node.js versions
  are vulnerable to a use-after-free bug in its TLS implementation.  When
  writing to a TLS enabled socket, node::StreamBase::Write calls
  node::TLSWrap::DoWrite with a freshly allocated WriteWrap object as first
  argument.  If the DoWrite method does not return an error, this object is
  passed back to the caller as part of a StreamWriteResult structure.  This
  may be exploited to corrupt memory leading to a Denial of Service or
  potentially other exploits

- CVE-2020-8287: HTTP Request Smuggling in nodejs Affected versions of
  Node.js allow two copies of a header field in a http request.  For
  example, two Transfer-Encoding header fields.  In this case Node.js
  identifies the first header field and ignores the second.  This can lead
  to HTTP Request Smuggling

- CVE-2020-1971: OpenSSL - EDIPARTYNAME NULL pointer de-reference (High)
  This is a vulnerability in OpenSSL which may be exploited through Node.js.
  You can read more about it in
  https://www.openssl.org/news/secadv/20201208.txt

Update the license hash for the addition of the (MIT licensed)
cjs-module-lexer module:
https://github.com/nodejs/node/commit/9eb1fa19248949dfc716807b1dc97dedf36da14e

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ecc8f0fe8459c4c14844a8a58eb168c58b0485fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 61259425ba..b3ea15ca31 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.19.1/SHASUMS256.txt
-sha256  74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d  node-v12.19.1.tar.xz
+# From https://nodejs.org/dist/v12.20.1/SHASUMS256.txt
+sha256  e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853  node-v12.20.1.tar.xz
 
 # Hash for license file
-sha256  0dc03af08b95ea0c1e27f8fd591dee4383eb6f2c304db6eb6cdfb6751f7da87b  LICENSE
+sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 524a6b5d8f..8916d47940 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.19.1
+NODEJS_VERSION = 12.20.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
