From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:27:57 +0100
Subject: [Buildroot] [PATCH 1/1] php: bump to 5.4.0
In-Reply-To: <cover.1331148472.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148472.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fa898d87315baa416980683a2ac38d9d1bc3aef4.1331148472.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...hen-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch |   30 --------------------
 package/php/php.mk                                 |    2 +-
 2 files changed, 1 insertions(+), 31 deletions(-)
 delete mode 100644 package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch

diff --git a/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch b/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
deleted file mode 100644
index 221b3c0..0000000
--- a/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e814fcac0599dbaae50ede1f9f78e20941e27877 Mon Sep 17 00:00:00 2001
-From: pajoye <pajoye@c90b9560-bf6c-de11-be94-00142212c4b1>
-Date: Tue, 23 Feb 2010 11:07:39 +0000
-Subject: [PATCH] - fix build when __GMP_BITS_PER_MP_LIMB is not defined but GMP_LIMB_BITS (no trace of this change in gmp's changelog...)
-
-git-svn-id: http://svn.php.net/repository/php/php-src/branches/PHP_5_3 at 295402 c90b9560-bf6c-de11-be94-00142212c4b1
----
- ext/gmp/gmp.c |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/ext/gmp/gmp.c b/ext/gmp/gmp.c
-index a54ffe9..f53dcd6 100644
---- a/ext/gmp/gmp.c
-+++ b/ext/gmp/gmp.c
-@@ -1374,8 +1374,11 @@ ZEND_FUNCTION(gmp_random)
- 
- 		GMPG(rand_initialized) = 1;
- 	}
-+#ifdef GMP_LIMB_BITS
-+	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * GMP_LIMB_BITS);
-+#else
- 	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * __GMP_BITS_PER_MP_LIMB);
--
-+#endif
- 	ZEND_REGISTER_RESOURCE(return_value, gmpnum_result, le_gmp);
- }
- /* }}} */
--- 
-1.7.1
-
diff --git a/package/php/php.mk b/package/php/php.mk
index 7f848b1..d85fc6f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.17
+PHP_VERSION = 5.4.0
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.4.1
