From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:38:29 +0200
Subject: [Buildroot] [git commit] beecrypt: fix compile for coldfire
Message-ID: <20160618213910.D915881D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5e57a8b6cd496dff3a4b25efcd443cc5eff0b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package uses m68k optimization, which doesn't work with coldfire.
These optimizations are disabled with --enable-debug.

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/bbe57a096de207b78e069591e21ac5a79eab069e/
http://autobuild.buildroot.net/results/ab702e6db382b1975d0cd61feaba9812830e81e8/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/beecrypt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index e66cec1..4fcdf43 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -17,6 +17,11 @@ BEECRYPT_CONF_OPTS = \
 	--without-python \
 	--disable-openmp
 
+# disable optimized m68k assembly as it doesn't compile for coldfire
+ifeq ($(BR2_m68k_cf),y)
+BEECRYPT_CONF_OPTS += --enable-debug
+endif
+
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 BEECRYPT_CONF_OPTS += --with-cplusplus
