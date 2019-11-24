From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 13:48:20 -0800
Subject: [Buildroot] [PATCH/next v2 1/4] spidermonkey: new package
In-Reply-To: <20191124214823.2570598-1-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
Message-ID: <20191124214823.2570598-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Spidermonkey is Mozilla's JavaScript engine written in C and C++. It is used in
various Mozilla products, including Firefox, and is available under the MPL2.

There are 19 patches currently required to properly cross-compile spidermonkey:

1) allow-newer-autoconf-versions
  - Spidermonkey is hardcoded to use Autoconf 2.13, which is from 1999!
    The reasoning behind using 2.13 is because newer versions of Autoconf do not
    work correctly with the custom m4 macros in the source code.

    However: Because we are building just the Spidermonkey engine instead of the
    entire Firefox package, newer versions of Autoconf work without issue.
    See: See: https://bugzilla.mozilla.org/show_bug.cgi?id=104642
    for further explanation.

2) allow-building-in-tree
  - By default, spidermonkey must be configured and built out-of-tree, otherwise
    the following error occurs:

    FATAL ERROR PROCESSING MOZBUILD FILE
    ==============================

    The error occurred while processing the following file or one of the files
    it includes:
      js/src/shell/moz.build

    The error occurred when validating the result of the execution. The reported
    error is:
        The path specified in LOCAL_INCLUDES is not allowed:
        .. (resolved to js/src)
    Remove this check, as spidermonkey builds without issue in-tree.

3) allow-unknown-configuration-options
  - By default, if an unknown parameter is passed to configure, an error is
    raised. Replace the raise with a pass and continue.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1379540

4) fix-building-with-musl
  - The MIPS specific header <sgidefs.h> is not provided by musl.
    The Linux kernel headers <asm/sgidefs.h> provide the same definitions.

5) add-riscv-support
  - Submitted upstream:
    See: https://bugzilla.mozilla.org/show_bug.cgi?id=1318905

6) copy-headers-on-install-instead-of-symlinking
  - When installing, instead of linking the headers to the source directory,
    copy them.

7) ensure-proper-running-on-64-bit-and-32-bit-be-platforms
  - Taken from the Fedora RPM
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1488552

8) 0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1375074

9) save-x28-before-clobbering-it-in-the-regex-compiler
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1445907

10) always-use-the-equivalent-year-to-determine-the-time-zone
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1415202

Typically, The Firefox source tarball is used to build spidermonkey; however,
this has two disadvantages:
  - It's large. The Firefox source tarball is over 250M.
  - It requires Autoconf 2.13
Instead, use a tarball with only the Spidermonkey source code in it with a
pre-setup configure file. This tarball reduces the size to 31M and prevents the
Autoconf 2.13 requirement.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
 - Add select BR2_PACKAGE_HOST_PYTHON_SSL to package/spidermonkey/Config.in
   this line was left out from a old Config file that was copied over when
   making the patch.

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-allow-newer-autoconf-versions.patch  |  61 ++++++++
 .../0002-allow-building-in-tree.patch         |  47 ++++++
 ...-allow-unknown-configuration-options.patch |  35 +++++
 .../0004-fix-building-with-musl.patch         | 133 ++++++++++++++++
 .../spidermonkey/0005-add-riscv-support.patch | 121 +++++++++++++++
 ...ers-on-install-instead-of-symlinking.patch |  34 +++++
 ...ng-on-64-bit-and-32-bit-be-platforms.patch | 144 ++++++++++++++++++
 ...-on-ARM64-for-generated-unboxed-obje.patch |  66 ++++++++
 ...-clobbering-it-in-the-regex-compiler.patch | 100 ++++++++++++
 ...lent-year-to-determine-the-time-zone.patch | 103 +++++++++++++
 package/spidermonkey/Config.in                |  39 +++++
 package/spidermonkey/spidermonkey.hash        |   3 +
 package/spidermonkey/spidermonkey.mk          |  58 +++++++
 15 files changed, 946 insertions(+)
 create mode 100644 package/spidermonkey/0001-allow-newer-autoconf-versions.patch
 create mode 100644 package/spidermonkey/0002-allow-building-in-tree.patch
 create mode 100644 package/spidermonkey/0003-allow-unknown-configuration-options.patch
 create mode 100644 package/spidermonkey/0004-fix-building-with-musl.patch
 create mode 100644 package/spidermonkey/0005-add-riscv-support.patch
 create mode 100644 package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch
 create mode 100644 package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch
 create mode 100644 package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch
 create mode 100644 package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch
 create mode 100644 package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch
 create mode 100644 package/spidermonkey/Config.in
 create mode 100644 package/spidermonkey/spidermonkey.hash
 create mode 100644 package/spidermonkey/spidermonkey.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98f67fbc96..1f05d1fe4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -73,6 +73,7 @@ F:	package/selinux-python/
 F:	package/semodule-utils/
 F:	package/setools/
 F:	package/sngrep/
+F:	package/spidermonkey/
 F:	package/systemd/
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/Config.in b/package/Config.in
index 9210ec0ac8..04872dc850 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1489,6 +1489,7 @@ endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 	source "package/openlayers/Config.in"
+	source "package/spidermonkey/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/spidermonkey/0001-allow-newer-autoconf-versions.patch b/package/spidermonkey/0001-allow-newer-autoconf-versions.patch
new file mode 100644
index 0000000000..61becb68f3
--- /dev/null
+++ b/package/spidermonkey/0001-allow-newer-autoconf-versions.patch
@@ -0,0 +1,61 @@
+From 646a78262b18e19721cd41ee515215221dd241b6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Jul 2018 18:12:42 +0800
+Subject: [PATCH] allow newer autoconf versions
+
+Spidermonkey is hardcoded to use Autoconf 2.13, which is from 1999!
+The reasoning behind using 2.13 is because newer versions of Autoconf at the
+time did not work correctly with the custom m4 macros in the source code.
+However: Because we are building just the spidermonkey engine instead of the
+entire firefox package, and we are using a tarball with a pre-setup
+old-configure file, there is no need for the old version of autoconf.
+
+See: https://bugzilla.mozilla.org/show_bug.cgi?id=104642
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ build/moz.configure/old.configure | 4 ++--
+ js/src/old-configure              | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/build/moz.configure/old.configure b/build/moz.configure/old.configure
+index 17d0c5bf..436fcc5e 100644
+--- a/build/moz.configure/old.configure
++++ b/build/moz.configure/old.configure
+@@ -33,7 +33,7 @@ def autoconf(mozconfig, autoconf):
+     autoconf = autoconf[0] if autoconf else None
+ 
+     for ac in (mozconfig_autoconf, autoconf, 'autoconf-2.13', 'autoconf2.13',
+-               'autoconf213'):
++               'autoconf213', 'autoconf'):
+         if ac:
+             autoconf = find_program(ac)
+             if autoconf:
+@@ -87,7 +87,7 @@ def prepare_configure(old_configure, mozconfig, autoconf, build_env, shell,
+             old_configure = os.path.join(old_configure_dir, 'js', 'src',
+                                          os.path.basename(old_configure))
+ 
+-    refresh = True
++    refresh = False
+     if exists(old_configure):
+         mtime = getmtime(old_configure)
+         aclocal = os.path.join(build_env.topsrcdir, 'build', 'autoconf',
+diff --git a/js/src/old-configure b/js/src/old-configure
+index 58cc646f..ebd2646e 100644
+--- a/js/src/old-configure
++++ b/js/src/old-configure
+@@ -587,7 +587,7 @@ if test -z "$srcdir"; then
+   ac_prog=$0
+   ac_confdir=`echo $ac_prog|sed 's%/[^/][^/]*$%%'`
+   test "x$ac_confdir" = "x$ac_prog" && ac_confdir=.
+-  srcdir=$ac_confdir
++  srcdir="$ac_confdir/../../"
+   if test ! -r $srcdir/$ac_unique_file; then
+     srcdir=..
+   fi
+-- 
+2.23.0
+
diff --git a/package/spidermonkey/0002-allow-building-in-tree.patch b/package/spidermonkey/0002-allow-building-in-tree.patch
new file mode 100644
index 0000000000..533747cb41
--- /dev/null
+++ b/package/spidermonkey/0002-allow-building-in-tree.patch
@@ -0,0 +1,47 @@
+From 07d40f72e1ed1d84a5ddd98ae8490d41a2e19c46 Mon Sep 17 00:00:00 2001
+From: Arjan van de Ven <arjan@linux.intel.com>
+Date: Wed, 5 Sep 2018 11:39:01 +0000
+Subject: [PATCH] allow building in tree
+
+By default, spidermonkey must be configured and built out-of-tree,
+otherwise the following error occurs:
+
+FATAL ERROR PROCESSING MOZBUILD FILE
+==============================
+
+The error occurred while processing the following file or one of the files it
+includes:
+    js/src/shell/moz.build
+
+The error occurred when validating the result of the execution. The reported
+error is:
+    Path specified in LOCAL_INCLUDES is not allowed: 
+    .. (resolved to js/src)
+
+Remove this check, as spidermonkey builds without issue in-tree.
+
+Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ python/mozbuild/mozbuild/frontend/emitter.py | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/python/mozbuild/mozbuild/frontend/emitter.py b/python/mozbuild/mozbuild/frontend/emitter.py
+index 642b381c..c37fbf5d 100644
+--- a/python/mozbuild/mozbuild/frontend/emitter.py
++++ b/python/mozbuild/mozbuild/frontend/emitter.py
+@@ -1127,11 +1127,6 @@ class TreeMetadataEmitter(LoggingMixin):
+                 raise SandboxValidationError('Path specified in LOCAL_INCLUDES '
+                     'does not exist: %s (resolved to %s)' % (local_include,
+                     full_path), context)
+-            if (full_path == context.config.topsrcdir or
+-                    full_path == context.config.topobjdir):
+-                raise SandboxValidationError('Path specified in LOCAL_INCLUDES '
+-                    'is not allowed: %s (resolved to %s)' % (local_include,
+-                    full_path), context)
+             include_obj = LocalInclude(context, local_include)
+             local_includes.append(include_obj.path.full_path)
+             yield include_obj
+--
+2.23.0
+
diff --git a/package/spidermonkey/0003-allow-unknown-configuration-options.patch b/package/spidermonkey/0003-allow-unknown-configuration-options.patch
new file mode 100644
index 0000000000..b489075a94
--- /dev/null
+++ b/package/spidermonkey/0003-allow-unknown-configuration-options.patch
@@ -0,0 +1,35 @@
+From 4a06a1a6a71293decb83aee7adb74bc709493106 Mon Sep 17 00:00:00 2001
+From: Philip Chimento <philip.chimento@gmail.com>
+Date: Wed, 5 Jul 2017 22:57:09 -0700
+Subject: [PATCH] allow unknown configuration options
+
+By default, if an unknown parameter is passed to configure, an error is raised.
+Replace the raise with a pass and continue.
+
+Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1379540
+
+Signed-off-by: Philip Chimento <philip.chimento@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ js/src/configure                               | 9 +++++++++
+ python/mozbuild/mozbuild/configure/__init__.py | 2 +-
+ python/mozbuild/mozbuild/configure/options.py  | 6 +++++-
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+ create mode 100755 js/src/configure
+
+diff --git a/python/mozbuild/mozbuild/configure/__init__.py b/python/mozbuild/mozbuild/configure/__init__.py
+index 0fe640ca..09b460d3 100644
+--- a/python/mozbuild/mozbuild/configure/__init__.py
++++ b/python/mozbuild/mozbuild/configure/__init__.py
+@@ -421,7 +421,7 @@ def run(self, path=None):
+         # All options should have been removed (handled) by now.
+         for arg in self._helper:
+             without_value = arg.split('=', 1)[0]
+-            raise InvalidOptionError('Unknown option: %s' % without_value)
++            pass
+ 
+         # Run the execution queue
+         for func, args in self._execution_queue:
+--
+2.23.0
+
diff --git a/package/spidermonkey/0004-fix-building-with-musl.patch b/package/spidermonkey/0004-fix-building-with-musl.patch
new file mode 100644
index 0000000000..8d8b10fb71
--- /dev/null
+++ b/package/spidermonkey/0004-fix-building-with-musl.patch
@@ -0,0 +1,133 @@
+From 0c9e8f586ba52a9aef5ed298e8315b2598b8fb72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 25 May 2019 16:54:45 -0700
+Subject: [PATCH] fix building with musl
+
+The MIPS specific header <sgidefs.h> is not provided by musl
+linux kernel headers provide <asm/sgidefs.h> which has same definitions
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+---
+ js/src/jsmath.cpp                                        | 2 +-
+ memory/build/Mutex.h                                     | 4 ++--
+ mozglue/misc/TimeStamp_darwin.cpp                        | 1 -
+ mozglue/misc/TimeStamp_posix.cpp                         | 1 -
+ nsprpub/pr/src/misc/prsystem.c                           | 1 -
+ third_party/python/psutil/psutil/_psutil_bsd.c           | 1 -
+ third_party/python/psutil/psutil/_psutil_osx.c           | 1 -
+ third_party/python/psutil/psutil/arch/osx/process_info.c | 1 -
+ 8 files changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/js/src/jsmath.cpp b/js/src/jsmath.cpp
+index a28968be..8facaa81 100644
+--- a/js/src/jsmath.cpp
++++ b/js/src/jsmath.cpp
+@@ -71,7 +71,7 @@
+ #elif defined(__s390__)
+ #define GETRANDOM_NR 349
+ #elif defined(__mips__)
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #if _MIPS_SIM == _MIPS_SIM_ABI32
+ #define GETRANDOM_NR 4353
+ #elif _MIPS_SIM == _MIPS_SIM_ABI64
+diff --git a/memory/build/Mutex.h b/memory/build/Mutex.h
+index cb8b1e7d..7b9eb1de 100644
+--- a/memory/build/Mutex.h
++++ b/memory/build/Mutex.h
+@@ -42,7 +42,7 @@ struct Mutex {
+     if (pthread_mutexattr_init(&attr) != 0) {
+       return false;
+     }
+-    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
++    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_STALLED);
+     if (pthread_mutex_init(&mMutex, &attr) != 0) {
+       pthread_mutexattr_destroy(&attr);
+       return false;
+@@ -102,7 +102,7 @@ typedef Mutex StaticMutex;
+ 
+ #if defined(XP_DARWIN)
+ #define STATIC_MUTEX_INIT OS_SPINLOCK_INIT
+-#elif defined(XP_LINUX) && !defined(ANDROID)
++#elif defined(XP_LINUX) && !defined(ANDROID) && defined(__GLIBC__)
+ #define STATIC_MUTEX_INIT PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP
+ #else
+ #define STATIC_MUTEX_INIT PTHREAD_MUTEX_INITIALIZER
+diff --git a/mozglue/misc/TimeStamp_darwin.cpp b/mozglue/misc/TimeStamp_darwin.cpp
+index d2abe9a5..d065649c 100644
+--- a/mozglue/misc/TimeStamp_darwin.cpp
++++ b/mozglue/misc/TimeStamp_darwin.cpp
+@@ -19,7 +19,6 @@
+ 
+ #include <mach/mach_time.h>
+ #include <sys/time.h>
+-#include <sys/sysctl.h>
+ #include <time.h>
+ #include <unistd.h>
+ 
+diff --git a/mozglue/misc/TimeStamp_posix.cpp b/mozglue/misc/TimeStamp_posix.cpp
+index 86c7609a..a37bd93a 100644
+--- a/mozglue/misc/TimeStamp_posix.cpp
++++ b/mozglue/misc/TimeStamp_posix.cpp
+@@ -21,7 +21,6 @@
+ #if defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || \
+     defined(__OpenBSD__)
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #endif
+ 
+ #if defined(__DragonFly__) || defined(__FreeBSD__)
+diff --git a/nsprpub/pr/src/misc/prsystem.c b/nsprpub/pr/src/misc/prsystem.c
+index eba85fb0..54b57bb9 100644
+--- a/nsprpub/pr/src/misc/prsystem.c
++++ b/nsprpub/pr/src/misc/prsystem.c
+@@ -27,7 +27,6 @@
+     || defined(OPENBSD) || defined(DRAGONFLY) || defined(DARWIN)
+ #define _PR_HAVE_SYSCTL
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #endif
+ 
+ #if defined(DARWIN)
+diff --git a/third_party/python/psutil/psutil/_psutil_bsd.c b/third_party/python/psutil/psutil/_psutil_bsd.c
+index 9a2ed04b..9e0d34cb 100644
+--- a/third_party/python/psutil/psutil/_psutil_bsd.c
++++ b/third_party/python/psutil/psutil/_psutil_bsd.c
+@@ -29,7 +29,6 @@
+ #include <paths.h>
+ #include <sys/types.h>
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #include <sys/user.h>
+ #include <sys/proc.h>
+ #include <sys/file.h>
+diff --git a/third_party/python/psutil/psutil/_psutil_osx.c b/third_party/python/psutil/psutil/_psutil_osx.c
+index 55dd64ca..ec356339 100644
+--- a/third_party/python/psutil/psutil/_psutil_osx.c
++++ b/third_party/python/psutil/psutil/_psutil_osx.c
+@@ -13,7 +13,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <utmpx.h>
+-#include <sys/sysctl.h>
+ #include <sys/vmmeter.h>
+ #include <libproc.h>
+ #include <sys/proc_info.h>
+diff --git a/third_party/python/psutil/psutil/arch/osx/process_info.c b/third_party/python/psutil/psutil/arch/osx/process_info.c
+index 40c79a2c..8de0dcbd 100644
+--- a/third_party/python/psutil/psutil/arch/osx/process_info.c
++++ b/third_party/python/psutil/psutil/arch/osx/process_info.c
+@@ -16,7 +16,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <signal.h>
+-#include <sys/sysctl.h>
+ #include <libproc.h>
+ 
+ #include "process_info.h"
+-- 
+2.23.0
diff --git a/package/spidermonkey/0005-add-riscv-support.patch b/package/spidermonkey/0005-add-riscv-support.patch
new file mode 100644
index 0000000000..6b7ea3265f
--- /dev/null
+++ b/package/spidermonkey/0005-add-riscv-support.patch
@@ -0,0 +1,121 @@
+From 64ad80e6d95871f17be4cd01da15581f41ac0b2b Mon Sep 17 00:00:00 2001
+From: Stefan O'Rear <sorear2@gmail.com>
+Date: Fri, 11 Nov 2016 21:10:34 -0700
+Subject: [PATCH] Add RISC-V support
+
+These changes allow spidermonkey to cross-compile for riscv64 and riscv32.
+
+Upstream-status: Submitted
+See: https://bugzilla.mozilla.org/show_bug.cgi?id=1318905
+
+Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
+Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ build/autoconf/config.guess                      | 3 +++
+ build/moz.configure/init.configure               | 3 +++
+ js/src/jit/AtomicOperations.h                    | 2 ++
+ js/src/jit/none/AtomicOperations-feeling-lucky.h | 8 ++++++++
+ mfbt/tests/TestPoisonArea.cpp                    | 3 +++
+ python/mozbuild/mozbuild/configure/constants.py  | 4 ++++
+ 6 files changed, 23 insertions(+)
+
+diff --git a/build/autoconf/config.guess b/build/autoconf/config.guess
+index d5d667d4..1277a862 100755
+--- a/build/autoconf/config.guess
++++ b/build/autoconf/config.guess
+@@ -1029,6 +1029,9 @@ EOF
+     ppcle:Linux:*:*)
+ 	echo powerpcle-unknown-linux-${LIBC}
+ 	exit ;;
++    riscv32:Linux:*:* | riscv64:Linux:*:*)
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
++	exit ;;
+     s390:Linux:*:* | s390x:Linux:*:*)
+ 	echo ${UNAME_MACHINE}-ibm-linux-${LIBC}
+ 	exit ;;
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
+index 83b8d705..ef33db50 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -676,6 +676,9 @@ def split_triplet(triplet, allow_unknown=False):
+     elif cpu == 'sh4':
+         canonical_cpu = 'sh4'
+         endianness = 'little'
++    elif cpu in ('riscv32', 'riscv64'):
++        canonical_cpu = cpu
++        endianness = 'little'
+     elif allow_unknown:
+         canonical_cpu = cpu
+         endianness = 'unknown'
+diff --git a/js/src/jit/AtomicOperations.h b/js/src/jit/AtomicOperations.h
+index 3501e65b..fda0b148 100644
+--- a/js/src/jit/AtomicOperations.h
++++ b/js/src/jit/AtomicOperations.h
+@@ -393,6 +393,8 @@ inline bool AtomicOperations::isLockfreeJS(int32_t size) {
+ #include "jit/none/AtomicOperations-feeling-lucky.h"
+ #elif defined(__s390__) || defined(__s390x__)
+ #include "jit/none/AtomicOperations-feeling-lucky.h"
++#elif defined(__riscv)
++#include "jit/none/AtomicOperations-feeling-lucky.h"
+ #else
+ #error "No AtomicOperations support provided for this platform"
+ #endif
+diff --git a/js/src/jit/none/AtomicOperations-feeling-lucky.h b/js/src/jit/none/AtomicOperations-feeling-lucky.h
+index c0b43699..42b1f3e0 100644
+--- a/js/src/jit/none/AtomicOperations-feeling-lucky.h
++++ b/js/src/jit/none/AtomicOperations-feeling-lucky.h
+@@ -80,6 +80,14 @@
+ #define GNUC_COMPATIBLE
+ #endif
+ 
++#ifdef __riscv
++#define GNUC_COMPATIBLE
++#ifdef __riscv_xlen == 64
++#define HAS_64BIT_ATOMICS
++#define HAS_64BIT_LOCKFREE
++#endif
++#endif
++
+ // The default implementation tactic for gcc/clang is to use the newer
+ // __atomic intrinsics added for use in C++11 <atomic>.  Where that
+ // isn't available, we use GCC's older __sync functions instead.
+diff --git a/mfbt/tests/TestPoisonArea.cpp b/mfbt/tests/TestPoisonArea.cpp
+index 06c24ed0..fba9263c 100644
+--- a/mfbt/tests/TestPoisonArea.cpp
++++ b/mfbt/tests/TestPoisonArea.cpp
+@@ -168,6 +168,9 @@ static const ia64_instr _return_instr =
+ #define RETURN_INSTR _return_instr
+ #define RETURN_INSTR_TYPE ia64_instr
+ 
++#elif defined __riscv
++#define RETURN_INSTR 0x80828082 /* ret; ret */
++
+ #else
+ #error "Need return instruction for this architecture"
+ #endif
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
+index 33ae5a45..1067b6a4 100644
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -50,6 +50,8 @@ CPU_bitness = {
+     'mips64': 64,
+     'ppc': 32,
+     'ppc64': 64,
++    'riscv32': 32,
++    'riscv64': 64,
+     's390': 32,
+     's390x': 64,
+     'sh4': 32,
+@@ -82,6 +84,8 @@ CPU_preprocessor_checks = OrderedDict((
+     ('s390', '__s390__'),
+     ('ppc64', '__powerpc64__'),
+     ('ppc', '__powerpc__'),
++    ('riscv32', '__riscv && __SIZEOF_POINTER__ == 4'),
++    ('riscv64', '__riscv && __SIZEOF_POINTER__ == 8'),
+     ('Alpha', '__alpha__'),
+     ('hppa', '__hppa__'),
+     ('sparc64', '__sparc__ && __arch64__'),
+-- 
+2.23.0
+
diff --git a/package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch b/package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch
new file mode 100644
index 0000000000..10ca54c702
--- /dev/null
+++ b/package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch
@@ -0,0 +1,34 @@
+From 903a79a1efff18fc7cc50db09a3fe5d768adc9a8 Mon 19 Mar 2018 09:58:06 +0100
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Wed, 5 Jul 2017 22:45:59 -0700
+Subject: build: Copy headers on install instead of symlinking
+
+Patch ported from mozjs52 by Philip Chimento
+
+Signed-off-by: Rico Tzschichholz <ricotz@ubuntu.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ python/mozbuild/mozbuild/backend/recursivemake.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/python/mozbuild/mozbuild/backend/recursivemake.py b/python/mozbuild/mozbuild/backend/recursivemake.py
+index dd9020d..6918ef8 100644
+--- a/python/mozbuild/mozbuild/backend/recursivemake.py
++++ b/python/mozbuild/mozbuild/backend/recursivemake.py
+@@ -1427,11 +1427,11 @@ class RecursiveMakeBackend(CommonBackend):
+                                 raise Exception("Wildcards are only supported in the filename part of "
+                                                 "srcdir-relative or absolute paths.")
+ 
+-                            install_manifest.add_pattern_link(basepath, wild, path)
++                            install_manifest.add_pattern_copy(basepath, wild, path)
+                         else:
+-                            install_manifest.add_pattern_link(f.srcdir, f, path)
++                            install_manifest.add_pattern_copy(f.srcdir, f, path)
+                     else:
+-                        install_manifest.add_link(f.full_path, dest)
++                        install_manifest.add_copy(f.full_path, dest)
+                 else:
+                     install_manifest.add_optional_exists(dest)
+                     backend_file.write('%s_FILES += %s\n' % (
+--
+2.23.0
diff --git a/package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch b/package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch
new file mode 100644
index 0000000000..9ffd69380a
--- /dev/null
+++ b/package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch
@@ -0,0 +1,144 @@
+From f66d410f3ba767efb91c6b9545d373267cd975f2 Mon Sep 17 00:00:00 2001
+From: Philip Chimento <philip@endlessm.com>
+Date: Sat, 7 Sep 2019 20:43:40 +0200
+Subject: [PATCH] ensure proper running on 64-bit and 32-bit BE platforms
+
+See: https://salsa.debian.org/gnome-team/mozjs60/blob/debian/master/debian/patches/jsproperty-endian.patch
+
+Signed-off-by:  Philip Chimento <philip@endlessm.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ js/src/gc/Marking-inl.h       | 16 ++++++++++++++++
+ js/src/gc/RelocationOverlay.h | 13 ++++++++++++-
+ js/src/jsfriendapi.h          |  8 ++++++++
+ js/src/vm/StringType.h        | 13 +++++++++++++
+ 4 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/js/src/gc/Marking-inl.h b/js/src/gc/Marking-inl.h
+index 6d2a4c7..c773c21 100644
+--- a/js/src/gc/Marking-inl.h
++++ b/js/src/gc/Marking-inl.h
+@@ -82,12 +82,28 @@ inline void RelocationOverlay::forwardTo(Cell* cell) {
+   MOZ_ASSERT(!isForwarded());
+   // The location of magic_ is important because it must never be valid to see
+   // the value Relocated there in a GC thing that has not been moved.
++#if MOZ_LITTLE_ENDIAN || JS_BITS_PER_WORD == 32
++  // On 32-bit, the magic_ aliases with whatever comes after the first
++  // pointer; on little-endian 64-bit, the magic_ aliases with the
++  // 32 most significant bits of the pointer, which are the second half.
+   static_assert(offsetof(RelocationOverlay, magic_) ==
+                     offsetof(JSObject, group_) + sizeof(uint32_t),
+                 "RelocationOverlay::magic_ is in the wrong location");
+   static_assert(offsetof(RelocationOverlay, magic_) ==
+                     offsetof(js::Shape, base_) + sizeof(uint32_t),
+                 "RelocationOverlay::magic_ is in the wrong location");
++#elif JS_BITS_PER_WORD == 64
++  // On big-endian 64-bit, the magic_ aliases with the 32 most
++  // significant bits of the pointer, but now that's the first half.
++  static_assert(offsetof(RelocationOverlay, magic_) ==
++                    offsetof(JSObject, group_),
++                "RelocationOverlay::magic_ is in the wrong location");
++  static_assert(offsetof(RelocationOverlay, magic_) ==
++                    offsetof(js::Shape, base_),
++                "RelocationOverlay::magic_ is in the wrong location");
++#else
++#  error "Unknown endianness or word size"
++#endif
+   static_assert(
+       offsetof(RelocationOverlay, magic_) == offsetof(JSString, d.u1.length),
+       "RelocationOverlay::magic_ is in the wrong location");
+diff --git a/js/src/gc/RelocationOverlay.h b/js/src/gc/RelocationOverlay.h
+index a568843..399a541 100644
+--- a/js/src/gc/RelocationOverlay.h
++++ b/js/src/gc/RelocationOverlay.h
+@@ -33,14 +33,25 @@ class RelocationOverlay {
+   /* See comment in js/public/HeapAPI.h. */
+   static const uint32_t Relocated = js::gc::Relocated;
+ 
++#if MOZ_LITTLE_ENDIAN || JS_BITS_PER_WORD == 32
+   /*
+-   * Keep the low 32 bits untouched. Use them to distinguish strings from
++   * Keep the first 32 bits untouched. Use them to distinguish strings from
+    * objects in the nursery.
+    */
+   uint32_t preserve_;
+ 
+   /* Set to Relocated when moved. */
+   uint32_t magic_;
++#elif JS_BITS_PER_WORD == 64
++  /*
++   * On big-endian, we need to reorder to keep preserve_ lined up with the
++   * low 32 bits of the aligned group_ pointer in JSObject.
++   */
++  uint32_t magic_;
++  uint32_t preserve_;
++#else
++#  error "Unknown endianness or word size"
++#endif
+ 
+   /* The location |this| was moved to. */
+   Cell* newLocation_;
+diff --git a/js/src/jsfriendapi.h b/js/src/jsfriendapi.h
+index 4b8d18a..70ce0a1 100644
+--- a/js/src/jsfriendapi.h
++++ b/js/src/jsfriendapi.h
+@@ -9,6 +9,7 @@
+ 
+ #include "mozilla/Atomics.h"
+ #include "mozilla/Casting.h"
++#include "mozilla/EndianUtils.h"
+ #include "mozilla/Maybe.h"
+ #include "mozilla/MemoryReporting.h"
+ #include "mozilla/UniquePtr.h"
+@@ -609,8 +610,15 @@ struct String {
+   static const uint32_t LATIN1_CHARS_BIT = JS_BIT(6);
+   static const uint32_t EXTERNAL_FLAGS = LINEAR_BIT | NON_ATOM_BIT | JS_BIT(5);
+   static const uint32_t TYPE_FLAGS_MASK = JS_BIT(6) - 1;
++#if MOZ_LITTLE_ENDIAN || JS_BITS_PER_WORD == 32
+   uint32_t flags;
+   uint32_t length;
++#elif JS_BITS_PER_WORD == 64
++  uint32_t length;
++  uint32_t flags;
++#else
++#  error "Unknown endianness or word size"
++#endif
+   union {
+     const JS::Latin1Char* nonInlineCharsLatin1;
+     const char16_t* nonInlineCharsTwoByte;
+diff --git a/js/src/vm/StringType.h b/js/src/vm/StringType.h
+index cde3427..c3400db 100644
+--- a/js/src/vm/StringType.h
++++ b/js/src/vm/StringType.h
+@@ -7,6 +7,7 @@
+ #ifndef vm_StringType_h
+ #define vm_StringType_h
+ 
++#include "mozilla/EndianUtils.h"
+ #include "mozilla/MemoryReporting.h"
+ #include "mozilla/PodOperations.h"
+ #include "mozilla/Range.h"
+@@ -168,8 +169,20 @@ class JSString : public js::gc::Cell {
+   struct Data {
+     union {
+       struct {
++#if MOZ_LITTLE_ENDIAN || JS_BITS_PER_WORD == 32
+         uint32_t flags;  /* JSString */
+         uint32_t length; /* JSString */
++#elif JS_BITS_PER_WORD == 64
++        /*
++         * On big-endian, we need to reorder to keep flags lined up
++         * with the low 32 bits of the aligned group_ pointer in
++         * JSObject.
++         */
++        uint32_t length; /* JSString */
++        uint32_t flags;  /* JSString */
++#else
++#  error "Unknown endianness or word size"
++#endif
+       };
+       uintptr_t flattenData; /* JSRope (temporary while flattening) */
+     } u1;
+-- 
+2.23.0
+
diff --git a/package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch b/package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch
new file mode 100644
index 0000000000..9fd4340ffe
--- /dev/null
+++ b/package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch
@@ -0,0 +1,66 @@
+From 903a79a1efff18fc7cc50db09a3fe5d768adc9a8 Mon 19 Mar 2018 09:58:06 +0100
+From: Lars T Hansen <lhansen@mozilla.com>
+Date: Fri, 23 Mar 2018 22:01:33 +0000
+Subject: [PATCH] save and restore non-volatile x28 on ARM64 for generated unboxed object constructor
+
+Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1375074
+
+Upsream-status: Applied
+See: https://hg.mozilla.org/mozilla-central/rev/800abe66894d
+
+Signed-off-by: Lars T Hansen <lhansen@mozilla.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ js/src/vm/UnboxedObject.cpp | 30 ++++++++++++++++++++++++++----
+ 1 file changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/js/src/vm/UnboxedObject.cpp b/js/src/vm/UnboxedObject.cpp
+index 35ca20d7405f..1c20a1093d13 100644
+--- a/js/src/vm/UnboxedObject.cpp
++++ b/js/src/vm/UnboxedObject.cpp
+@@ -86,9 +86,16 @@ static const uintptr_t CLEAR_CONSTRUCTOR_CODE_TOKEN = 0x1;
+ #endif
+
+ #ifdef JS_CODEGEN_ARM64
+-  // ARM64 communicates stack address via sp, but uses a pseudo-sp for
+-  // addressing.
+-  masm.initStackPtr();
++    // ARM64 communicates stack address via sp, but uses a pseudo-sp (PSP) for
++    // addressing.  The register we use for PSP may however also be used by
++    // calling code, and it is nonvolatile, so save it.  Do this as a special
++    // case first because the generic save/restore code needs the PSP to be
++    // initialized already.
++    MOZ_ASSERT(PseudoStackPointer64.Is(masm.GetStackPointer64()));
++    masm.Str(PseudoStackPointer64, vixl::MemOperand(sp, -16, vixl::PreIndex));
++
++    // Initialize the PSP from the SP.
++    masm.initStackPtr();
+ #endif
+
+   MOZ_ASSERT(propertiesReg.volatile_());
+@@ -239,7 +246,22 @@ static const uintptr_t CLEAR_CONSTRUCTOR_CODE_TOKEN = 0x1;
+   if (ScratchDoubleReg.volatile_()) masm.pop(ScratchDoubleReg);
+   masm.PopRegsInMask(savedNonVolatileRegisters);
+
+-  masm.abiret();
++#ifdef JS_CODEGEN_ARM64
++    // Now restore the value that was in the PSP register on entry, and return.
++
++    // Obtain the correct SP from the PSP.
++    masm.Mov(sp, PseudoStackPointer64);
++
++    // Restore the saved value of the PSP register, this value is whatever the
++    // caller had saved in it, not any actual SP value, and it must not be
++    // overwritten subsequently.
++    masm.Ldr(PseudoStackPointer64, vixl::MemOperand(sp, 16, vixl::PostIndex));
++
++    // Perform a plain Ret(), as abiret() will move SP <- PSP and that is wrong.
++    masm.Ret(vixl::lr);
++#else
++    masm.abiret();
++#endif
+
+   masm.bind(&failureStoreOther);
+
+--
+2.23.0
diff --git a/package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch b/package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch
new file mode 100644
index 0000000000..b4623c5961
--- /dev/null
+++ b/package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch
@@ -0,0 +1,100 @@
+From 903a79a1efff18fc7cc50db09a3fe5d768adc9a8 Mon 19 Mar 2018 09:58:06 +0100
+From: Lars T Hansen <lhansen@mozilla.com>
+Date: Fri, 23 Mar 2018 22:01:33 +0000
+Subject: [PATCH] save x28 before clobbering it in the regex compiler
+
+Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1445907
+
+Upsream-status: Applied
+See: https://hg.mozilla.org/mozilla-central/rev/903a79a1efff
+
+Signed-off-by: Lars T Hansen <lhansen@mozilla.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+diff --git a/js/src/irregexp/NativeRegExpMacroAssembler.cpp b/js/src/irregexp/NativeRegExpMacroAssembler.cpp
+--- a/js/src/irregexp/NativeRegExpMacroAssembler.cpp
++++ b/js/src/irregexp/NativeRegExpMacroAssembler.cpp
+@@ -118,17 +118,25 @@ NativeRegExpMacroAssembler::GenerateCode
+
+     Label return_temp0;
+
+     // Finalize code - write the entry point code now we know how many
+     // registers we need.
+     masm.bind(&entry_label_);
+
+ #ifdef JS_CODEGEN_ARM64
+-    // ARM64 communicates stack address via sp, but uses a pseudo-sp for addressing.
++    // ARM64 communicates stack address via SP, but uses a pseudo-sp (PSP) for
++    // addressing.  The register we use for PSP may however also be used by
++    // calling code, and it is nonvolatile, so save it.  Do this as a special
++    // case first because the generic save/restore code needs the PSP to be
++    // initialized already.
++    MOZ_ASSERT(PseudoStackPointer64.Is(masm.GetStackPointer64()));
++    masm.Str(PseudoStackPointer64, vixl::MemOperand(sp, -16, vixl::PreIndex));
++
++    // Initialize the PSP from the SP.
+     masm.initStackPtr();
+ #endif
+
+     // Push non-volatile registers which might be modified by jitcode.
+     size_t pushedNonVolatileRegisters = 0;
+     for (GeneralRegisterForwardIterator iter(savedNonVolatileRegisters); iter.more(); ++iter) {
+         masm.Push(*iter);
+         pushedNonVolatileRegisters++;
+@@ -416,17 +424,32 @@ NativeRegExpMacroAssembler::GenerateCode
+     masm.pop(temp0);
+     masm.movePtr(temp0, StackPointer);
+ #endif
+
+     // Restore non-volatile registers which were saved on entry.
+     for (GeneralRegisterBackwardIterator iter(savedNonVolatileRegisters); iter.more(); ++iter)
+         masm.Pop(*iter);
+
++#ifdef JS_CODEGEN_ARM64
++    // Now restore the value that was in the PSP register on entry, and return.
++
++    // Obtain the correct SP from the PSP.
++    masm.Mov(sp, PseudoStackPointer64);
++
++    // Restore the saved value of the PSP register, this value is whatever the
++    // caller had saved in it, not any actual SP value, and it must not be
++    // overwritten subsequently.
++    masm.Ldr(PseudoStackPointer64, vixl::MemOperand(sp, 16, vixl::PostIndex));
++
++    // Perform a plain Ret(), as abiret() will move SP <- PSP and that is wrong.
++    masm.Ret(vixl::lr);
++#else
+     masm.abiret();
++#endif
+
+     // Backtrack code (branch target for conditional backtracks).
+     if (backtrack_label_.used()) {
+         masm.bind(&backtrack_label_);
+         Backtrack();
+     }
+
+     // Backtrack stack overflow code.
+diff --git a/js/src/jit-test/tests/regexp/bug1445907.js b/js/src/jit-test/tests/regexp/bug1445907.js
+new file mode 100644
+--- /dev/null
++++ b/js/src/jit-test/tests/regexp/bug1445907.js
+@@ -0,0 +1,15 @@
++// On ARM64, we failed to save x28 properly when generating code for the regexp
++// matcher.
++//
++// There's wasm and Debugger code here because the combination forces the use of
++// x28 and exposes the bug when running on the simulator.
++
++if (!wasmIsSupported())
++    quit();
++
++var g = newGlobal('');
++var dbg = new Debugger(g);
++g.eval(`var m = new WebAssembly.Instance(new WebAssembly.Module(wasmTextToBinary('(module (func (export "test")))')))`);
++var re = /./;
++dbg.onEnterFrame = function(frame) { re.exec("x") };
++result = g.eval("m.exports.test()");
+
+--
+2.23.0
+
diff --git a/package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch b/package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch
new file mode 100644
index 0000000000..7ebe80a8a0
--- /dev/null
+++ b/package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch
@@ -0,0 +1,103 @@
+From 903a79a1efff18fc7cc50db09a3fe5d768adc9a8 Mon 19 Mar 2018 09:58:06 +0100
+From: Andr? Bargull <andrebargull@gmail.com>
+Date: Wed, 8 Nov 2017 03:23:41 -0800
+Subject: always use the equivalent year to determine the time zone offset and
+ name
+
+Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1415202
+
+Upsream-status: Applied
+See: https://hg.mozilla.org/mozilla-central/rev/ce9f1466ec78
+
+Reviewed-by: Jeff Walden
+Signed-off-by: Andr? Bargull <andrebargull@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ js/src/jsdate.cpp  | 11 +++++++----
+ js/src/vm/Time.cpp | 14 ++++----------
+ js/src/vm/Time.h   |  2 +-
+ 3 files changed, 12 insertions(+), 15 deletions(-)
+
+diff --git a/js/src/jsdate.cpp b/js/src/jsdate.cpp
+index 07af3d18c865..ff8fd6c3763c 100644
+--- a/js/src/jsdate.cpp
++++ b/js/src/jsdate.cpp
+@@ -2353,12 +2353,15 @@ static PRMJTime ToPRMJTime(double localTime, double utcTime) {
+ static size_t FormatTime(char* buf, int buflen, const char* fmt, double utcTime,
+                          double localTime) {
+   PRMJTime prtm = ToPRMJTime(localTime, utcTime);
+-  int eqivalentYear = IsRepresentableAsTime32(utcTime)
+-                          ? prtm.tm_year
+-                          : EquivalentYearForDST(prtm.tm_year);
++  // If an equivalent year was used to compute the date/time components, use
++  // the same equivalent year to determine the time zone name and offset in
++  // PRMJ_FormatTime(...).
++  int timeZoneYear = IsRepresentableAsTime32(utcTime)
++                     ? prtm.tm_year
++                     : EquivalentYearForDST(prtm.tm_year);
+   int offsetInSeconds = (int)floor((localTime - utcTime) / msPerSecond);
+
+-  return PRMJ_FormatTime(buf, buflen, fmt, &prtm, eqivalentYear,
++  return PRMJ_FormatTime(buf, buflen, fmt, &prtm, timeZoneYear,
+                          offsetInSeconds);
+ }
+
+diff --git a/js/src/vm/Time.cpp b/js/src/vm/Time.cpp
+index f59977f0d0e9..5ee4794b3e83 100644
+--- a/js/src/vm/Time.cpp
++++ b/js/src/vm/Time.cpp
+@@ -247,7 +247,7 @@ static void PRMJ_InvalidParameterHandler(const wchar_t* expression,
+
+ /* Format a time value into a buffer. Same semantics as strftime() */
+ size_t PRMJ_FormatTime(char* buf, int buflen, const char* fmt,
+-                       const PRMJTime* prtm, int equivalentYear,
++                       const PRMJTime* prtm, int timeZoneYear,
+                        int offsetInSeconds) {
+   size_t result = 0;
+ #if defined(XP_UNIX) || defined(XP_WIN)
+@@ -280,7 +280,8 @@ size_t PRMJ_FormatTime(char* buf, int buflen, const char* fmt,
+      * Fill out |td| to the time represented by |prtm|, leaving the
+      * timezone fields zeroed out. localtime_r will then fill in the
+      * timezone fields for that local time according to the system's
+-     * timezone parameters.
++     * timezone parameters. Use |timeZoneYear| for the year to ensure the
++     * time zone name matches the time zone offset used by the caller.
+      */
+     struct tm td;
+     memset(&td, 0, sizeof(td));
+@@ -290,19 +291,12 @@ size_t PRMJ_FormatTime(char* buf, int buflen, const char* fmt,
+     td.tm_mday = prtm->tm_mday;
+     td.tm_mon = prtm->tm_mon;
+     td.tm_wday = prtm->tm_wday;
+-    td.tm_year = prtm->tm_year - 1900;
++    td.tm_year = timeZoneYear - 1900;
+     td.tm_yday = prtm->tm_yday;
+     td.tm_isdst = prtm->tm_isdst;
+
+     time_t t = mktime(&td);
+
+-    // If |prtm| cannot be represented in |time_t| the year is probably
+-    // out of range, try again with the DST equivalent year.
+-    if (t == static_cast<time_t>(-1)) {
+-      td.tm_year = equivalentYear - 1900;
+-      t = mktime(&td);
+-    }
+-
+     // If either mktime or localtime_r failed, fill in the fallback time
+     // zone offset |offsetInSeconds| and set the time zone identifier to
+     // the empty string.
+diff --git a/js/src/vm/Time.h b/js/src/vm/Time.h
+index 3a51d869c922..37b7faeec028 100644
+--- a/js/src/vm/Time.h
++++ b/js/src/vm/Time.h
+@@ -49,7 +49,7 @@ inline void PRMJ_NowShutdown() {}
+
+ /* Format a time value into a buffer. Same semantics as strftime() */
+ extern size_t PRMJ_FormatTime(char* buf, int buflen, const char* fmt,
+-                              const PRMJTime* tm, int equivalentYear,
++                              const PRMJTime* tm, int timeZoneYear,
+                               int offsetInSeconds);
+
+ /**
+--
+2.23.0
diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
new file mode 100644
index 0000000000..1a5e0e29a5
--- /dev/null
+++ b/package/spidermonkey/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_nios2
+	depends on !BR2_aarch64_be
+
+config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64  || BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64
+
+config BR2_PACKAGE_SPIDERMONKEY
+	bool "spidermonkey"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
+	depends on BR2_USE_MMU # fork in executable tools.
+	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # No way to check for fenv support.
+	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_PYTHON
+	select BR2_PACKAGE_HOST_PYTHON_SSL
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_ZLIB
+	help
+	  SpiderMonkey is the code-name for Mozilla Firefox's C++
+	  implementation of JavaScript. It is intended to be embedded in
+	  other applications that provide host environments for
+	  JavaScript.
+
+	  https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey
+
+comment "spidermonkey needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on BR2_USE_MMU || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+	!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/spidermonkey/spidermonkey.hash b/package/spidermonkey/spidermonkey.hash
new file mode 100644
index 0000000000..ccb0265861
--- /dev/null
+++ b/package/spidermonkey/spidermonkey.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 f51039c997415fd0f13f8e01966b4a8ff80cbf90deb8b14c18827104a369cc0d mozjs-60.5.2.tar.bz2
+sha256 aaac93a33bec26d5d1a9c5efc1e7dc6bd215d8a4f1e1a7fc5315a67adfd51338 moz.configure
diff --git a/package/spidermonkey/spidermonkey.mk b/package/spidermonkey/spidermonkey.mk
new file mode 100644
index 0000000000..583ccb803f
--- /dev/null
+++ b/package/spidermonkey/spidermonkey.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# spidermonkey
+#
+################################################################################
+
+# Use a tarball with only the spidermonkey source code and a pre-setup
+# old-configure in src/js.This prevents having to use autoconf 2.13 and
+# makes the package much 31M instead of 257M
+SPIDERMONKEY_VERSION = 60.5.2
+SPIDERMONKEY_SOURCE = mozjs-$(SPIDERMONKEY_VERSION).tar.bz2
+SPIDERMONKEY_SITE = https://gentoo.osuosl.org/distfiles/9a
+SPIDERMONKEY_SUBDIR = js/src
+SPIDERMONKEY_LICENSE = MPL-2.0
+SPIDERMONKEY_INSTALL_STAGING = YES
+SPIDERMONKEY_LICENSE_FILES = moz.configure
+
+SPIDERMONKEY_DEPENDENCIES = \
+	host-perl \
+	host-python \
+	host-zip \
+	libnspr \
+	zlib
+
+SPIDERMONKEY_CONF_ENV += \
+	PYTHON="$(HOST_DIR)/bin/python2"
+
+# spidermonkey mixes up target and host.
+# spidermonkey does not allow building against a system jemalloc,
+# as it causes a conflict with glibc.
+SPIDERMONKEY_CONF_OPTS = \
+	--host=$(GNU_HOST_NAME) \
+	--target=$(GNU_TARGET_NAME) \
+	--disable-jemalloc \
+	--disable-readline \
+	--enable-shared-js \
+	--enable-ion \
+	--with-system-zlib \
+	--with-system-nspr \
+	--with-nspr-exec-prefix="$(STAGING_DIR)/usr"
+
+ifneq ($(BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS),y)
+SPIDERMONKEY_CONF_OPTS += --disable-ion
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+SPIDERMONKEY_CONF_OPTS += --enable-readline
+SPIDERMONKEY_DEPENDENCIES += readline
+endif
+
+# Remove unneeded files
+define SPIDERMONKEY_CLEANUP
+	rm -rf $(TARGET_DIR)/usr/lib/libjs_static.ajs
+	rm -rf $(TARGET_DIR)/usr/bin/js60-config
+endef
+SPIDERMONKEY_POST_INSTALL_TARGET_HOOKS += SPIDERMONKEY_CLEANUP
+
+$(eval $(autotools-package))
-- 
2.23.0
