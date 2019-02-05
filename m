From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 10:00:44 +0100
Subject: [Buildroot] [git commit] package/android-tools: Fix build with
 OpenSSL 1.1.x
Message-ID: <20190205090445.A7A2F83F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf3a57acdc1ee7983b6821453da0bbbb5c1fa607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use patch from:

	https://github.com/lede-project/source/commit/f63f20fb93c7e67775cb01d97fc88b5b29452b81

which fixes compilation of adb with OpenSSL 1.1.x, and took only part
for adb only.

Fixes:

	http://autobuild.buildroot.net/results/66f/66f05eb9a56aa8526a1420334d68c7eda094e90e/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ded-patch-for-openssl-1.1.0-compatibility.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch b/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
new file mode 100644
index 0000000000..2de338368f
--- /dev/null
+++ b/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
@@ -0,0 +1,47 @@
+From bb3da0e32be4f2260940edf3ee0f88103dfd0dcc Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cote2004-github@yahoo.com>
+Date: Tue, 5 Feb 2019 01:12:19 +0200
+Subject: [PATCH] adb: added patch for openssl 1.1.0 compatibility
+
+Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
+
+[Vadim: took only adb related part from
+https://github.com/lede-project/source/commit/f63f20fb93c7e67775cb01d97fc88b5b29452b81]
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ core/adb/adb_auth_host.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/core/adb/adb_auth_host.c b/core/adb/adb_auth_host.c
+index 9039d42..debd2ef 100644
+--- a/core/adb/adb_auth_host.c
++++ b/core/adb/adb_auth_host.c
+@@ -79,7 +79,13 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
+     }
+ 
+     BN_set_bit(r32, 32);
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++    const BIGNUM *rsa_n, *rsa_e;
++    RSA_get0_key(rsa, &rsa_n, &rsa_e, NULL);
++    BN_copy(n, rsa_n);
++#else
+     BN_copy(n, rsa->n);
++#endif
+     BN_set_bit(r, RSANUMWORDS * 32);
+     BN_mod_sqr(rr, r, n, ctx);
+     BN_div(NULL, rem, n, r32, ctx);
+@@ -93,7 +99,11 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
+         BN_div(n, rem, n, r32, ctx);
+         pkey->n[i] = BN_get_word(rem);
+     }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++    pkey->exponent = BN_get_word(rsa_e);
++#else
+     pkey->exponent = BN_get_word(rsa->e);
++#endif
+ 
+ out:
+     BN_free(n0inv);
+-- 
+2.14.1
+
