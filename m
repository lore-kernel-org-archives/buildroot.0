From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  9 Nov 2019 19:55:11 +0100
Subject: [Buildroot] [PATCH v2 1/2] allow .smk files as includes in packages
In-Reply-To: <20191109185512.24139-1-jeremy.rosen@smile.fr>
References: <20191109185512.24139-1-jeremy.rosen@smile.fr>
Message-ID: <20191109185512.24139-2-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when using the include directive in a package's .mk, buildroot
will create a new package. It is impossible to include a makefile for
the normal inclusion purpose

This is hardwired in many places, both in buildroot-core and in the way
makefiles are included in BR2_EXTERNAL. This can't be changed without
breaking external code

Instead, use a different extension for "normal" includes and filter them out
in pkgdir

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 63b19e812b..ebab55a0fd 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -30,7 +30,7 @@ endef
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *-package macros to
 # automagically find where the package is located.
-pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
+pkgdir = $(dir $(lastword $(filter-out %.smk,$(MAKEFILE_LIST))))
 pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Define extractors for different archive suffixes
-- 
2.24.0.rc1
