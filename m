From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 8 Dec 2016 03:34:17 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: disable some parts of test-suite
Message-ID: <20161208023417.GA5366@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The math tests are experimental at the moment and require more
adaptions before they can be enabled again.
The locale tests are not compatible with musl toolchains,
so disable them.

Use latest git version from upstream for other bugfixes.

Fixes:
 http://autobuild.buildroot.net/results/74e/74e7add310797772bc51f9ea9847408a8b05d643/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index f6700a9..bb8b9ed 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 4ad1c23ae2eb30888cda520c739cc26150512487
+UCLIBC_NG_TEST_VERSION = 189b47080068d431302beec0e627dcaa5358eae8
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPLv2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
 
+# the math tests are recently synced from glibc and need more adaption before
+# regular testing is possible
+UCLIBC_NG_TEST_MAKE_ENV += NO_MATH=1
+
+# locale tests are not compatible with musl, yet
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+UCLIBC_NG_TEST_MAKE_ENV += NO_LOCALE=1
+endif
 ifeq ($(BR2_USE_WCHAR),)
 UCLIBC_NG_TEST_MAKE_ENV += NO_WCHAR=1
 endif
-- 
2.1.4
