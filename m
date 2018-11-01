From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 18:12:22 +0100
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.16.1
Message-ID: <20181101171501.EAF7D866C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdebaef22f7820cdf2c55f723d34477ba582bfcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches:

- 0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
  (Upstream accepted, see [1])

- 0005-libv4lconvert-fix-compiler-warning.patch
  (From upstream, see [2])

- 0006-v4l2-ctl-fix-glibc-2.28-build.patch
  (From upstream, see [3])

Disable new qvidcap for now.

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=c28248deeb2d7fe43fcde948c00b9b8fa2bc1e8f
[2] https://git.linuxtv.org/v4l-utils.git/commit/?id=380fe7d4548a99bfcfc1594b6f0b3dd2369978f1
[3] https://git.linuxtv.org/v4l-utils.git/commit/?id=65e7b2a4076845d3932b88cb9c76f1fa4b78c32c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: pass --disable-qvidcap only once.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch | 39 -------------------
 .../0005-libv4lconvert-fix-compiler-warning.patch  | 45 ----------------------
 .../0006-v4l2-ctl-fix-glibc-2.28-build.patch       | 30 ---------------
 package/libv4l/libv4l.hash                         |  4 +-
 package/libv4l/libv4l.mk                           |  4 +-
 5 files changed, 4 insertions(+), 118 deletions(-)

diff --git a/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch b/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
deleted file mode 100644
index cd22be15c4..0000000000
--- a/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From abfe3e7b2b4af1de9b891f3a7a996b70533b0a27 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 4 Mar 2018 09:07:51 +0100
-Subject: [PATCH] libdvbv5: add optional copy of TEMP_FAILURE_RETRY macro (fix
- musl compile)
-
-Fixes:
-
-  ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'
-
-[Upstream: https://www.mail-archive.com/linux-media at vger.kernel.org/msg127134.html]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- lib/libdvbv5/dvb-dev-local.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
-index 8bc99d1..7a76d65 100644
---- a/lib/libdvbv5/dvb-dev-local.c
-+++ b/lib/libdvbv5/dvb-dev-local.c
-@@ -44,6 +44,15 @@
- # define _(string) string
- #endif
- 
-+/* taken from glibc unistd.h */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; })
-+#endif
-+
- struct dvb_dev_local_priv {
- 	dvb_dev_change_t notify_dev_change;
- 
--- 
-2.16.2
-
diff --git a/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch b/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch
deleted file mode 100644
index 941a51e638..0000000000
--- a/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 380fe7d4548a99bfcfc1594b6f0b3dd2369978f1 Mon Sep 17 00:00:00 2001
-From: Hans Verkuil <hans.verkuil@cisco.com>
-Date: Sun, 1 Apr 2018 12:10:33 +0200
-Subject: [PATCH] libv4lconvert: fix compiler warning
-
-  CC       control/libv4lconvert_la-libv4lcontrol.lo
-control/libv4lcontrol.c: In function ???v4lcontrol_get_usb_info???:
-control/libv4lcontrol.c:391:13: warning: In the GNU C Library, "minor" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "minor", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "minor", you should undefine it after including <sys/types.h>.
-       c == '\n' && minor_dev == minor(st.st_rdev))
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Dropped the '#if defined(MAJOR_IN_SYSMACROS)' to ensure that sysmacros.h
-is always included. It seems that #if is no longer needed. At least,
-nobody complained when I removed it in other places earlier :-)
-
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 380fe7d4548a9
-
- lib/libv4lconvert/control/libv4lcontrol.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/control/libv4lcontrol.c
-index 1e784eda8a92..59f28b137b98 100644
---- a/lib/libv4lconvert/control/libv4lcontrol.c
-+++ b/lib/libv4lconvert/control/libv4lcontrol.c
-@@ -20,9 +20,7 @@
-  */
- 
- #include <sys/types.h>
--#if defined(MAJOR_IN_SYSMACROS)
- #include <sys/sysmacros.h>
--#endif
- #include <sys/mman.h>
- #include <fcntl.h>
- #include <sys/stat.h>
--- 
-2.18.0
-
diff --git a/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch b/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch
deleted file mode 100644
index c66f4d8033..0000000000
--- a/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f7eb207a3b90fef6a9c8fbdc506e809cc9757bd1 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 20 Sep 2018 21:20:16 +0200
-Subject: [PATCH] v4l2-ctl: fix glibc 2.28 build
-
-Include header needed for the major/minor macros in glibc 2.28+.
-
-This patch is extracted from upstream commit 65e7b2a4076845d (v4l2-ctl: show
-media/entity info if available).
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- utils/v4l2-ctl/v4l2-ctl.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
-index e02dc756..12a19bc7 100644
---- a/utils/v4l2-ctl/v4l2-ctl.cpp
-+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
-@@ -33,6 +33,7 @@
- #include <errno.h>
- #include <sys/ioctl.h>
- #include <sys/time.h>
-+#include <sys/sysmacros.h>
- #include <dirent.h>
- #include <math.h>
- 
--- 
-2.14.4
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 5e0df1f7a9..5dd5e45003 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.14.2.tar.bz2.asc
-sha256 e6b962c4b1253cf852c31da13fd6b5bb7cbe5aa9e182881aec55123bae680692  v4l-utils-1.14.2.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.1.tar.bz2.asc
+sha256 c7e4d6f4b4b7f278a6fa4bf56385526920d40fbd9e3e2827b75ddcd41da0504a  v4l-utils-1.16.1.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 55f02b7e8e..4e82dea6ad 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.14.2
+LIBV4L_VERSION = 1.16.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
 # We're patching contrib/test/Makefile.am
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
