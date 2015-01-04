From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Jan 2015 15:17:14 +0100
Subject: [Buildroot] [PATCH] package/erlang: fix detection of libatomic_ops
Message-ID: <1420381034-16098-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some platforms, hardware-assisted compare-and-swap may not be
available, so libatomic will not provide it.

However, libatomic_ops can provide a puerly software CASE emulation, but
must be instructed to do so. erlang just forgot to tell libatomic_ops
that it does require CAS.

Fix that by defining AO_REQUIRE_CAS before including atmoic_ops.h, like
is done in libunwind, as pointed out by Thomas.

Also, erlang has a convoluted, mind-alterating set on aclocal.m4 macros,
that just forgets to link against -latomic_ops when checking CAS is
available, so that even if CAS is available, configure chokes.

Since I would like to keep the little sanity I still have, just force
linking with -latomic_ops. This is useless when the check is natrally
sucessful (i.e. on platforms where CAS is available in HW), but we
would eventually link with -latomic_ops there, too; it's just redundant.

Overall, just consider that erlang requires libatomic_ops, so forcibly
depend on it, it is easier than trying to disable it. We can revisit
that whenever someone wants to run erlang on a platform for which there
is no libatomic_ops support.

Fixes a slew of autobuild ARM failures:
    http://autobuild.buildroot.org/results/e7b/e7bfc4893dea6b133f0794ef44d50ad89bcb6662/
    http://autobuild.buildroot.org/results/3e9/3e9c307f1ec6536482641019dcaa94677f7267a3/
    http://autobuild.buildroot.org/results/a85/a85ca414e5b67af46510abd7b610eb5ae8661de4/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 ...erlang-build-fix.patch => 0001-build-fix.patch} |  0
 ...d-instruct-libatomic_ops-we-do-require-CA.patch | 70 ++++++++++++++++++++++
 package/erlang/Config.in                           |  2 +
 package/erlang/erlang.mk                           |  7 ++-
 4 files changed, 76 insertions(+), 3 deletions(-)
 rename package/erlang/{erlang-build-fix.patch => 0001-build-fix.patch} (100%)
 create mode 100644 package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch

diff --git a/package/erlang/erlang-build-fix.patch b/package/erlang/0001-build-fix.patch
similarity index 100%
rename from package/erlang/erlang-build-fix.patch
rename to package/erlang/0001-build-fix.patch
diff --git a/package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch b/package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
new file mode 100644
index 0000000..8e40143
--- /dev/null
+++ b/package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
@@ -0,0 +1,70 @@
+From 439fa2eae78a8900bda120072335be19d626498c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 28 Dec 2014 23:39:40 +0100
+Subject: [PATCH] erts/ethread: instruct libatomic_ops we do require CAS
+
+We do require compare-and-swap (CAS), so we must instruct libatomic_ops
+to provide it, even if the architecture does not have instructions for
+it.
+
+For example, on ARM, LDREX is required for fast CAS. But LDREX is only
+available on ARMv6, so by default libatomic_ops will not have CAS for
+anything below, like ARMv5. But ARMv5 is always UP, so using an
+emulated CAS (that is signal-asyn-safe) is still possible (albeit much
+slower).
+
+Tell libatomic_ops to provide CAS, even if the hardware is not capable
+of it, by using emulated CAS, as per libatomic_ops dosc:
+    https://github.com/ivmai/libatomic_ops/blob/master/doc/README.txt#L28
+
+    If this is included after defining AO_REQUIRE_CAS, then the package
+    will make an attempt to emulate compare-and-swap in a way that (at
+    least on Linux) should still be async-signal-safe.
+
+Thanks go to Thomas for all this insight! :-)
+Thanks go to Frank for reporting the issue! :-)
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Cc: Frank Hunleth <fhunleth@troodon-software.com>
+---
+ erts/include/internal/libatomic_ops/ethread.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/erts/include/internal/libatomic_ops/ethread.h b/erts/include/internal/libatomic_ops/ethread.h
+index d65ee19..71d3598 100644
+--- a/erts/include/internal/libatomic_ops/ethread.h
++++ b/erts/include/internal/libatomic_ops/ethread.h
+@@ -35,6 +35,7 @@
+ 
+ #define ETHR_NATIVE_IMPL__ "libatomic_ops"
+ 
++#define AO_REQUIRE_CAS
+ #include "atomic_ops.h"
+ #include "ethr_membar.h"
+ #include "ethr_atomic.h"
+diff --git a/erts/aclocal.m4 b/erts/aclocal.m4
+index d65ee19..71d3598 100644
+--- a/erts/aclocal.m4
++++ b/erts/aclocal.m4
+@@ -1414,7 +1414,8 @@
+ 	    	    fi;;
+ 	    esac
+ 	    ethr_have_libatomic_ops=no
+-	    AC_TRY_LINK([#include "atomic_ops.h"],
++	    AC_TRY_LINK([#define AO_REQUIRE_CAS
++                    #include "atomic_ops.h"],
+ 	    	        [
+ 	    	    	    volatile AO_t x;
+ 	    	    	    AO_t y;
+@@ -1455,6 +1455,7 @@
+ 	        AC_CHECK_SIZEOF(AO_t, ,
+ 	    	    	        [
+ 	    	    	    	    #include <stdio.h>
++	    	    	    	    #define AO_REQUIRE_CAS
+ 	    	    	    	    #include "atomic_ops.h"
+ 	    	    	        ])
+ 	        AC_DEFINE_UNQUOTED(ETHR_SIZEOF_AO_T, $ac_cv_sizeof_AO_t, [Define to the size of AO_t if libatomic_ops is used])
+-- 
+1.9.1
+
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 56830da..2eb9eba 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 0b8619e..81ac436 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -13,6 +13,9 @@ ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
 ERLANG_INSTALL_STAGING = YES
 
+# Touching erts/configure.in
+ERLANG_AUTORECONF = YES
+
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 
@@ -22,10 +25,8 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
 
-ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 ERLANG_DEPENDENCIES += libatomic_ops
-ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
-endif
+ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-- 
1.9.1
