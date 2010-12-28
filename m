From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Dec 2010 08:52:14 +0100
Subject: [Buildroot] [git commit master 1/1] php: fix gmp extension build
	after libgmp bump
Message-ID: <20101228081422.C22528A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6527001c9d42b95c76b7689ed8eeecd8d17740cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from php svn r295402.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...hen-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch

diff --git a/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch b/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
new file mode 100644
index 0000000..221b3c0
--- /dev/null
+++ b/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
@@ -0,0 +1,30 @@
+From e814fcac0599dbaae50ede1f9f78e20941e27877 Mon Sep 17 00:00:00 2001
+From: pajoye <pajoye@c90b9560-bf6c-de11-be94-00142212c4b1>
+Date: Tue, 23 Feb 2010 11:07:39 +0000
+Subject: [PATCH] - fix build when __GMP_BITS_PER_MP_LIMB is not defined but GMP_LIMB_BITS (no trace of this change in gmp's changelog...)
+
+git-svn-id: http://svn.php.net/repository/php/php-src/branches/PHP_5_3 at 295402 c90b9560-bf6c-de11-be94-00142212c4b1
+---
+ ext/gmp/gmp.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/ext/gmp/gmp.c b/ext/gmp/gmp.c
+index a54ffe9..f53dcd6 100644
+--- a/ext/gmp/gmp.c
++++ b/ext/gmp/gmp.c
+@@ -1374,8 +1374,11 @@ ZEND_FUNCTION(gmp_random)
+ 
+ 		GMPG(rand_initialized) = 1;
+ 	}
++#ifdef GMP_LIMB_BITS
++	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * GMP_LIMB_BITS);
++#else
+ 	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * __GMP_BITS_PER_MP_LIMB);
+-
++#endif
+ 	ZEND_REGISTER_RESOURCE(return_value, gmpnum_result, le_gmp);
+ }
+ /* }}} */
+-- 
+1.7.1
+
-- 
1.7.2.2
