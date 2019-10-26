From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:45:53 +0200
Subject: [Buildroot] [PATCH 1/9] core/legal-info: don't require overriding
 _LICENSE
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <213c692b57813437e44755673c5366c92ab1aad6.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the formatting we impose on the _LICENSE variable requires
that we also use the seldom used := assignment operator, which makes
the _LICENSE variable the only variable that users have to write with
this operator.

This really departs from the simplicity and consistency of using the
append-assignment, which we use for every other variables.

This is because the append-assignment operator surreptiotiously
introduces a sapce between the original value and the append one. But
we can use this knowledge, to match any instance of a space followed by
a comma, and turn it into a single comma.

This allows users to now have a consistent use of the '=' and '+='
operators we use everywhere else in .mk files.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt | 16 ++++++++++------
 package/pkg-generic.mk                  |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b402767b05..b2386f2c01 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -429,13 +429,17 @@ not and can not work as people would expect it should:
   the +license+ field of the manifest file for this package. +
   The expected format for this variable must comply with the following rules:
   ** If different parts of the package are released under different
-  licenses, then +comma+ separate licenses (e.g. +`LIBFOO_LICENSE =
-  GPL-2.0+, LGPL-2.1+`+). If there is clear distinction between which
-  component is licensed under what license, then annotate the license
-  with that component, between parenthesis (e.g. +`LIBFOO_LICENSE =
-  GPL-2.0+ (programs), LGPL-2.1+ (libraries)`+).
+     licenses, then +comma+ separate licenses (e.g. +`LIBFOO_LICENSE =
+     GPL-2.0+, LGPL-2.1+`+). If there is clear distinction between which
+     component is licensed under what license, then annotate the license
+     with that component, between parenthesis (e.g. +`LIBFOO_LICENSE =
+     GPL-2.0+ (programs), LGPL-2.1+ (libraries)`+).
+  ** If some licenses are conditioned on a sub-option being enabled, append
+     the conditional licenses with a comma (e.g.: `FOO_LICENSE += , GPL-2.0+
+     (programs)`); the infrastructure will internally remove the space before
+     the comma.
   ** If the package is dual licensed, then separate licenses with the
-  +or+ keyword (e.g. +`LIBFOO_LICENSE = AFL-2.1 or GPL-2.0+`+).
+     +or+ keyword (e.g. +`LIBFOO_LICENSE = AFL-2.1 or GPL-2.0+`+).
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1f24b52a69..893faba22a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1006,7 +1006,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 endif # redistribute
 
 endif # other packages
-	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
+	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
-- 
2.20.1
