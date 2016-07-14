From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jul 2016 16:30:38 +0200
Subject: [Buildroot] [PATCHv2] package/libgpg-error: fix no-thread build
Message-ID: <1468506638-24170-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Including the pthreads header was not properly guarded; fix that.

Disable building tests, as they are not really needed for Buildroot.

Note that autoreconfiguring is very noisy and spits out a lot of git
errors as their configure.ac expects, and even *requires* to be run from
a git clone. Although reported as fatal errors, it's just git whining.
We can ignore them.

Fixes:
    http://autobuild.buildroot.org/results/049/0495d60556139de8f3f6df420d9a226ee8a432a0/
    http://autobuild.buildroot.org/results/0d1/0d12423877b4aac2a18fac651063de98774b5108/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2;
  - upstream has accepted my patches, so we use them instead
    of the previous workarounds.

---
Notes:
  - patches backported from upstream;
  - upstream has tagged a new release with those, but not yet
    made the releas tarballs available;
  - when it is done, we can bump to 1.24 and drop those two patches.
---
 .../0001-Fix-build-without-threads.patch           | 71 ++++++++++++++++++++++
 .../0002-Add-an-option-to-disable-tests.patch      | 57 +++++++++++++++++
 package/libgpg-error/libgpg-error.mk               |  5 ++
 3 files changed, 133 insertions(+)
 create mode 100644 package/libgpg-error/0001-Fix-build-without-threads.patch
 create mode 100644 package/libgpg-error/0002-Add-an-option-to-disable-tests.patch

diff --git a/package/libgpg-error/0001-Fix-build-without-threads.patch b/package/libgpg-error/0001-Fix-build-without-threads.patch
new file mode 100644
index 0000000..9154cd8
--- /dev/null
+++ b/package/libgpg-error/0001-Fix-build-without-threads.patch
@@ -0,0 +1,71 @@
+From abcdfa7964da62b92984516608faf8941038b71d Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Jul 2016 11:38:46 +0200
+Subject: [PATCH 1/2] Fix build without threads
+
+* src/gen-posix-lock-obj.c: properly guard inclusioin of pthread.h
+* tests/t-lock.c: likewise
+* tests/t-poll.c: likewise
+--
+
+Although ./configure checks for thread support, gen-posix-lock-obj and
+two tests still include pthread.h unconditionally.
+
+Guard that inclusion using the same condition as all other uses of
+pthread-related code.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/gen-posix-lock-obj.c | 4 +++-
+ tests/t-lock.c           | 4 +++-
+ tests/t-poll.c           | 4 +++-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/gen-posix-lock-obj.c b/src/gen-posix-lock-obj.c
+index e32a3cd..e6f33ae 100644
+--- a/src/gen-posix-lock-obj.c
++++ b/src/gen-posix-lock-obj.c
+@@ -29,7 +29,9 @@
+ #include <string.h>
+ #include <stdio.h>
+ #include <errno.h>
+-#include <pthread.h>
++#ifdef USE_POSIX_THREADS
++# include <pthread.h>
++#endif
+ 
+ #include "posix-lock-obj.h"
+ 
+diff --git a/tests/t-lock.c b/tests/t-lock.c
+index 38c9cec..6add18b 100644
+--- a/tests/t-lock.c
++++ b/tests/t-lock.c
+@@ -31,7 +31,9 @@
+ # include <windows.h>
+ # include <time.h>
+ #else
+-# include <pthread.h>
++# ifdef USE_POSIX_THREADS
++#  include <pthread.h>
++# endif
+ #endif
+ 
+ #define PGM "t-lock"
+diff --git a/tests/t-poll.c b/tests/t-poll.c
+index 811f895..a26cbfa 100644
+--- a/tests/t-poll.c
++++ b/tests/t-poll.c
+@@ -34,7 +34,9 @@
+ # include <windows.h>
+ # include <time.h>
+ #else
+-# include <pthread.h>
++# ifdef USE_POSIX_THREADS
++#  include <pthread.h>
++# endif
+ #endif
+ 
+ #define PGM "t-lock"
+-- 
+2.7.4
+
diff --git a/package/libgpg-error/0002-Add-an-option-to-disable-tests.patch b/package/libgpg-error/0002-Add-an-option-to-disable-tests.patch
new file mode 100644
index 0000000..3d933b3
--- /dev/null
+++ b/package/libgpg-error/0002-Add-an-option-to-disable-tests.patch
@@ -0,0 +1,57 @@
+From d57a16c3779eca84dedcf2423b26e41172cd5a96 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Jul 2016 11:38:47 +0200
+Subject: [PATCH 2/2] Add an option to disable tests
+
+* configure.ac: add an option to enable/disable building tests
+* Makefile.am: conditionally build tests
+--
+
+On an embeded device, there is no reason to have the tests present in
+a production release build. Add a configure-time option to disable
+them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile.am  | 8 +++++++-
+ configure.ac | 5 +++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index baeba14..5abd97d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,13 @@ else
+ doc =
+ endif
+ 
+-SUBDIRS = m4 src $(doc) tests po $(lang_subdirs)
++if BUILD_TESTS
++tests = tests
++else
++tests =
++endif
++
++SUBDIRS = m4 src $(doc) $(tests) po $(lang_subdirs)
+ 
+ 
+ dist-hook: gen-ChangeLog
+diff --git a/configure.ac b/configure.ac
+index 682fd84..d19943d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -533,6 +533,11 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+                      build_doc=$enableval, build_doc=yes)
+ AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
+ 
++build_tests=yes
++AC_ARG_ENABLE([tests], AC_HELP_STRING([--disable-tests],
++                                    [do not build the tests]),
++                     build_tests=$enableval, build_tests=yes)
++AM_CONDITIONAL([BUILD_TESTS], [test "x$build_tests" != xno])
+ 
+ #
+ # Substitution
+-- 
+2.7.4
+
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index b074ff6..c8c60fa 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -11,6 +11,9 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 
+# 0002-tests-do-not-build.patch touches Makefile.am
+LIBGPG_ERROR_AUTORECONF = YES
+
 define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 	cd $(@D)/src/syscfg && \
 	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
@@ -18,4 +21,6 @@ define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 endef
 LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
 
+LIBGPG_ERROR_CONF_OPTS = --disable-tests
+
 $(eval $(autotools-package))
-- 
2.7.4
