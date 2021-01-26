From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:47:41 +0100
Subject: [Buildroot] [PATCH] package/ltp-testsuite: simplify code to exclude
 test-cases
Message-ID: <20210126174741.1046950-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have three conditions under which some tests may get removed:
uClibc, musl, static libraries. All three use the same mechanism
to exclude those test-cases: remove the files.

The first two use a common variable to list the affected files,
and share the same hook of their own to iterate over that list,
while the third has its own hook.

This is not very clean, so switch to using a single variable and
a single hook for all three conditions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 4d7aa451b5..43ee134d1c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -65,12 +65,11 @@ LTP_TESTSUITE_CONF_ENV += \
 	SYSROOT="$(STAGING_DIR)"
 
 # uclibc: bessel support normally not enabled
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 	testcases/misc/math/float/bessel/ \
 	testcases/misc/math/float/float_bessel.c
-else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
+
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
 	testcases/kernel/sched/process_stress/process.c \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
@@ -79,22 +78,17 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c \
 	utils/benchmark/ebizzy-0.3
-endif
+
+# ldd command build system tries to build a shared library unconditionally.
+LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_STATIC_LIBS) += \
+	testcases/commands/ldd
 
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
-	$(foreach f,$(LTP_TESTSUITE_UNSUPPORTED_TEST_CASES),
+	$(foreach f,$(LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_y),
 		rm -rf $(@D)/$(f)
 	)
 endef
 
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
 
-# ldd command build system tries to build a shared library unconditionally.
-ifeq ($(BR2_STATIC_LIBS),y)
-define LTP_TESTSUITE_REMOVE_LDD
-	rm -rf $(@D)/testcases/commands/ldd
-endef
-LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
-endif
-
 $(eval $(autotools-package))
-- 
2.25.1
