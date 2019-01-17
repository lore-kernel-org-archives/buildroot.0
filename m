From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 15:51:24 +0100
Subject: [Buildroot] [git commit] nettle: fix build with gcc 4.7
Message-ID: <20190117145105.64F078D460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69a893a552a9875507fe83ae8dc9e72178594a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/69226d42e9a483aaff44fb3f468b4724415e71f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-accidental-use-of-C99-for-loop.patch  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch b/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch
new file mode 100644
index 0000000000..e03af7a45a
--- /dev/null
+++ b/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch
@@ -0,0 +1,71 @@
+From f5a3a224bf00bef5669366d2ae23c2b2b13b8016 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Wed, 26 Dec 2018 11:04:31 +0100
+Subject: [PATCH] Fix accidental use of C99 for loop.
+
+* rsa-sign-tr.c (sec_equal): Fix accidental use of C99 for loop.
+Reported by Andreas Gustafsson.
+* testsuite/rsa-sec-decrypt-test.c (test_main): Likewise.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.lysator.liu.se/nettle/nettle/commit/f5a3a224bf00bef5669366d2ae23c2b2b13b8016]
+---
+ ChangeLog                        | 6 ++++++
+ rsa-sign-tr.c                    | 3 ++-
+ testsuite/rsa-sec-decrypt-test.c | 3 ++-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 4c7338a1..079d0153 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2018-12-26  Niels M??ller  <nisse@lysator.liu.se>
++
++	* rsa-sign-tr.c (sec_equal): Fix accidental use of C99 for loop.
++	Reported by Andreas Gustafsson.
++	* testsuite/rsa-sec-decrypt-test.c (test_main): Likewise.
++
+ 2018-12-04  Niels M??ller  <nisse@lysator.liu.se>
+ 
+ 	* Released nettle-3.4.1.
+diff --git a/rsa-sign-tr.c b/rsa-sign-tr.c
+index 59c9bd07..f824c4ca 100644
+--- a/rsa-sign-tr.c
++++ b/rsa-sign-tr.c
+@@ -239,8 +239,9 @@ static int
+ sec_equal(const mp_limb_t *a, const mp_limb_t *b, size_t limbs)
+ {
+   volatile mp_limb_t z = 0;
++  size_t i;
+ 
+-  for (size_t i = 0; i < limbs; i++)
++  for (i = 0; i < limbs; i++)
+     {
+       z |= (a[i] ^ b[i]);
+     }
+diff --git a/testsuite/rsa-sec-decrypt-test.c b/testsuite/rsa-sec-decrypt-test.c
+index 64f0b13c..fb0ed3a1 100644
+--- a/testsuite/rsa-sec-decrypt-test.c
++++ b/testsuite/rsa-sec-decrypt-test.c
+@@ -68,6 +68,7 @@ test_main(void)
+   unsigned n_size = 1024;
+   mpz_t gibberish;
+   mpz_t garbage;
++  size_t size;
+ 
+   rsa_private_key_init(&key);
+   rsa_public_key_init(&pub);
+@@ -78,7 +79,7 @@ test_main(void)
+ 
+   memset(verifybad, 'A', PAYLOAD_SIZE);
+ 
+-  for (size_t size = 1; size < 51; size++)
++  for (size = 1; size < 51; size++)
+     {
+       ASSERT (rsa_generate_keypair(&pub, &key, &random_ctx,
+ 			           (nettle_random_func *) knuth_lfib_random,
+-- 
+2.18.1
+
