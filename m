From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:22:57 +0200
Subject: [Buildroot] [PATCH 4/6] package/ceph: new package
In-Reply-To: <cover.1368137904.git.yann.morin.1998@free.fr>
References: <cover.1368137904.git.yann.morin.1998@free.fr>
Message-ID: <dc815657095c7fab454a982e2fb2effbcb4a606e.1368137905.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/ceph/Config.in                     | 25 ++++++++++++
 package/ceph/ceph-no-envz.patch            | 63 ++++++++++++++++++++++++++++++
 package/ceph/ceph-no-getloadavg.patch      | 61 +++++++++++++++++++++++++++++
 package/ceph/ceph-no-posix_fallocate.patch | 50 ++++++++++++++++++++++++
 package/ceph/ceph.mk                       | 57 +++++++++++++++++++++++++++
 6 files changed, 257 insertions(+)
 create mode 100644 package/ceph/Config.in
 create mode 100644 package/ceph/ceph-no-envz.patch
 create mode 100644 package/ceph/ceph-no-getloadavg.patch
 create mode 100644 package/ceph/ceph-no-posix_fallocate.patch
 create mode 100644 package/ceph/ceph.mk

diff --git a/package/Config.in b/package/Config.in
index f5d68c5..f55801e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
+source "package/ceph/Config.in"
 source "package/chrony/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
diff --git a/package/ceph/Config.in b/package/ceph/Config.in
new file mode 100644
index 0000000..68c0e75
--- /dev/null
+++ b/package/ceph/Config.in
@@ -0,0 +1,25 @@
+comment "ceph requires C++, largefiles, threads, wide chars"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_avr32 && !BR2_microblaze
+
+config BR2_PACKAGE_CEPH
+	bool "ceph"
+	depends on BR2_INSTALL_LIBSTDCPP            # boost
+	depends on BR2_LARGEFILE                    # boost, libnss, util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS        # boost, libnss
+	depends on BR2_USE_WCHAR                    # util-linux
+	depends on !BR2_avr32 && !BR2_microblaze    # keyutils
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBEDIT2
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Ceph is a distributed object store and file system designed to
+	  provide excellent performance, reliability and scalability.
+	  
+	  http://ceph.com/
diff --git a/package/ceph/ceph-no-envz.patch b/package/ceph/ceph-no-envz.patch
new file mode 100644
index 0000000..c0369ba
--- /dev/null
+++ b/package/ceph/ceph-no-envz.patch
@@ -0,0 +1,63 @@
+tools+base: do not include envz.h on uClibc
+
+uClibc does not have envz, and no envz function is in fact used.
+So, simply do not include it under uClibc.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+--- ceph-0.51.orig/src/tools/common.cc	2012-09-09 00:13:32.128838177 +0200
++++ ceph-0.51/src/tools/common.cc	2012-09-09 00:13:59.432064556 +0200
+@@ -17,9 +17,9 @@
+ #include <string>
+ using namespace std;
+ 
+-#if !defined(DARWIN) && !defined(__FreeBSD__)
++#if !defined(DARWIN) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+ #include <envz.h>
+-#endif // DARWIN
++#endif // DARWIN || __UCLIBC__
+ 
+ #include <memory>
+ #include <sys/types.h>
+--- ceph-0.51.orig/src/ceph_syn.cc	2012-09-09 00:25:23.302722032 +0200
++++ ceph-0.51/src/ceph_syn.cc	2012-09-09 00:24:39.702892463 +0200
+@@ -31,9 +31,9 @@
+ #include "common/ceph_argparse.h"
+ #include "common/pick_address.h"
+ 
+-#if !defined(DARWIN) && !defined(__FreeBSD__)
++#if !defined(DARWIN) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+ #include <envz.h>
+-#endif // DARWIN || __FreeBSD__
++#endif // DARWIN || __FreeBSD__ || __UCLIBC__
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
+--- ceph-0.51.orig/src/ceph_fuse.cc	2012-09-09 00:43:46.875065556 +0200
++++ ceph-0.51/src/ceph_fuse.cc	2012-09-09 00:44:21.161597834 +0200
+@@ -32,9 +32,9 @@
+ #include "global/global_init.h"
+ #include "common/safe_io.h"
+        
+-#ifndef DARWIN
++#if !defined(DARWIN) && !defined(__UCLIBC__)
+ #include <envz.h>
+-#endif // DARWIN
++#endif // DARWIN || __UCLIBC__
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
+--- ceph-0.51.orig/src/testmsgr.cc	2012-09-09 00:44:48.108158886 +0200
++++ ceph-0.51/src/testmsgr.cc	2012-09-09 00:45:18.218040882 +0200
+@@ -28,9 +28,9 @@
+ #include "global/global_init.h"
+ #include "common/ceph_argparse.h"
+ 
+-#ifndef DARWIN
++#if !defined(DARWIN) && !defined(__UCLIBC__)
+ #include <envz.h>
+-#endif // DARWIN
++#endif // DARWIN || __UCLIBC__
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
diff --git a/package/ceph/ceph-no-getloadavg.patch b/package/ceph/ceph-no-getloadavg.patch
new file mode 100644
index 0000000..4d19b62
--- /dev/null
+++ b/package/ceph/ceph-no-getloadavg.patch
@@ -0,0 +1,61 @@
+OSD: do not use getloadavg(3) on uClibc
+
+getloadavg(3) is not available on uClibc, so do not use it.
+
+getloadavg is used in two places:
+  - once to log the loadavg in the heartbeat logs: we simply remove this;
+  - once to decide whether to schedule scrub (whatever it is) or not: we
+    simply use the existing coin-flip random choice in this case.
+
+The second change will probably have an impact on performances... :-(
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ceph-0.51.orig/src/osd/OSD.cc ceph-0.51/src/osd/OSD.cc
+--- ceph-0.51.orig/src/osd/OSD.cc	2012-08-26 00:58:06.000000000 +0200
++++ ceph-0.51/src/osd/OSD.cc	2012-09-08 23:56:31.396177885 +0200
+@@ -15,6 +15,7 @@
+ #include <fstream>
+ #include <iostream>
+ #include <errno.h>
++#include <features.h> /* For __ULIBC__ */
+ #include <sys/stat.h>
+ #include <signal.h>
+ #include <boost/scoped_ptr.hpp>
+@@ -1942,10 +1943,12 @@
+ {
+   dout(30) << "heartbeat" << dendl;
+ 
++#ifndef __UCLIBC__
+   // get CPU load avg
+   double loadavgs[1];
+   if (getloadavg(loadavgs, 1) == 1)
+     logger->set(l_osd_loadavg, 100 * loadavgs[0]);
++#endif
+ 
+   dout(30) << "heartbeat checking stats" << dendl;
+ 
+@@ -3216,6 +3219,7 @@
+ 
+ bool OSDService::scrub_should_schedule()
+ {
++#ifndef __UCLIBC__
+   double loadavgs[1];
+ 
+   // TODOSAM: is_active should be conveyed to OSDService
+@@ -3249,6 +3253,15 @@
+ 	   << " < max " << g_conf->osd_scrub_load_threshold
+ 	   << " = yes" << dendl;
+   return loadavgs[0] < g_conf->osd_scrub_load_threshold;
++#else // ! defined  __UCLIBC__
++  bool coin_flip = (rand() % 3) == whoami % 3;
++  if (coin_flip) {
++    dout(20) << "scrub_should_schedule randomly yes" << dendl;
++  } else {
++    dout(20) << "scrub_should_schedule randomly backing off" << dendl;
++  }
++  return coin_flip;
++#endif // ! defined  __UCLIBC__
+ }
+ 
+ void OSD::sched_scrub()
diff --git a/package/ceph/ceph-no-posix_fallocate.patch b/package/ceph/ceph-no-posix_fallocate.patch
new file mode 100644
index 0000000..17b1a51
--- /dev/null
+++ b/package/ceph/ceph-no-posix_fallocate.patch
@@ -0,0 +1,50 @@
+Do not call posix_fallocate() on uClibc
+
+Based on a patch by Thomas, for lttng-babeltrace, in which he states:
+
+    uClibc does not implement posix_fallocate(), and posix_fallocate() is
+    mostly only an hint to the kernel that we will need such or such
+    amount of space inside a file. So we just don't call posix_fallocate()
+    when building against uClibc.
+
+Just do the same here.
+
+NOTE! IMHO, this patch is not correct, because overcommit (eg. for sparse
+files) on the underlying filesystem may cause allocation failures later on,
+which is exactly the situation that posix_fallocate is supposed to avoid.
+But, as uClibc still lacks posix_fallocate, we have no choice.
+
+If you really are concerned about this issue, there exists a posix_fallocate
+patch that is not upstream, but is used by the AlpineLinux distribution:
+    http://git.alpinelinux.org/cgit/aports/tree/main/libc0.9.32/posix_fallocate.patch?id=98a000b8e92b3aa1e0b7a5f94a74910bb0993c4d
+    http://git.alpinelinux.org/cgit/aports/tree/main/libc0.9.32/posix_fallocate-fix.patch?id=98a000b8e92b3aa1e0b7a5f94a74910bb0993c4d
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ceph-0.50.orig/src/os/FileJournal.cc ceph-0.50/src/os/FileJournal.cc
+--- ceph-0.50.orig/src/os/FileJournal.cc	2012-08-13 18:43:14.000000000 +0200
++++ ceph-0.50/src/os/FileJournal.cc	2012-09-08 23:07:12.597910027 +0200
+@@ -23,6 +23,7 @@
+ #include "include/compat.h"
+ 
+ #include <fcntl.h>
++#include <features.h>
+ #include <limits.h>
+ #include <sstream>
+ #include <stdio.h>
+@@ -303,6 +304,7 @@
+ 	   << newsize << " bytes: " << cpp_strerror(err) << dendl;
+       return -err;
+     }
++#ifndef __UCLIBC__
+     ret = ::posix_fallocate(fd, 0, newsize);
+     if (ret < 0) {
+       int err = errno;
+@@ -310,6 +312,7 @@
+ 	   << newsize << " bytes: " << cpp_strerror(err) << dendl;
+       return -err;
+     }
++#endif
+     max_size = newsize;
+   }
+   else {
diff --git a/package/ceph/ceph.mk b/package/ceph/ceph.mk
new file mode 100644
index 0000000..2d1a42c
--- /dev/null
+++ b/package/ceph/ceph.mk
@@ -0,0 +1,57 @@
+#############################################################
+#
+# ceph
+#
+#############################################################
+
+CEPH_VERSION         = 0.56.2
+CEPH_SOURCE          = ceph-$(CEPH_VERSION).tar.bz2
+CEPH_SITE            = http://ceph.com/download/
+CEPH_LICENSE         = LGPLv2.1 CC-BY-SA Apache-2.0 GPLv2 LGPLv2+ BSD-3c MIT
+CEPH_LICENSE_FILES   = COPYING
+CEPH_INSTALL_STAGING = YES
+
+# Bundled ./configure and Makefile.in file are not in sync
+# with the corresponding configure.ac and Makefile.am
+CEPH_AUTORECONF      = YES
+
+CEPH_DEPENDENCIES    = \
+    boost              \
+    expat              \
+    keyutils           \
+    libedit2           \
+    libnss             \
+    util-linux
+
+# We disable everything for now, because the dependency tree can become
+# quite deep if we try to enable some features, and I have not tested that.
+# We need@least one crypto lib, and the currently only one available in
+# BR, that ceph can use, is libnss
+CEPH_CONF_OPT =                 \
+    --with-nss                  \
+    --without-profiler          \
+    --without-debug             \
+    --without-tcmalloc          \
+    --without-hadoop            \
+    --without-libatomic-ops     \
+    --without-system-leveldb    \
+    --without-system-libs3      \
+    --without-rest-bench        \
+    --without-cryptopp          \
+    --with-ocf
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+CEPH_DEPENDENCIES += libfuse
+CEPH_CONF_OPT     += --with-fuse
+else
+CEPH_CONF_OPT     += --without-fuse
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAIO),y)
+CEPH_DEPENDENCIES += libaio
+CEPH_CONF_OPT     += --with-libaio
+else
+CEPH_CONF_OPT     += --without-libaio
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.2
