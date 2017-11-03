From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:03:18 +0100
Subject: [Buildroot] [git commit] lxc: bump to version 2.1.1
Message-ID: <20171103205557.36AA881053@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abc292a625f0b7372b89cdb5a6876a7457ea6aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-conf-fix-build-without-libcap.patch (already in 2.1.1)
Add 0001-Fix-compilation-on-toolchain-without-prlimit.patch (merged
upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-compilation-on-toolchain-without-prlimit.patch | 98 ++++++++++++++++++++++
 .../lxc/0001-conf-fix-build-without-libcap.patch   | 31 -------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  4 +-
 4 files changed, 102 insertions(+), 33 deletions(-)

diff --git a/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch b/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
new file mode 100644
index 0000000..031f775
--- /dev/null
+++ b/package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
@@ -0,0 +1,98 @@
+From f48b5fd8ab03c200eaf5e3a9b03bcd01b2659cf3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 Nov 2017 16:00:33 +0100
+Subject: [PATCH] Fix compilation on toolchain without prlimit
+
+Some toolchains which are not bionic like uclibc does not support
+prlimit or prlimit64. In this case, return an error.
+Moreover, if prlimit64 is available, use lxc implementation of prlimit.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac        |  4 ++++
+ src/lxc/Makefile.am |  6 ++++++
+ src/lxc/conf.c      | 12 +++++++++---
+ 3 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 642b78e7..63df7466 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -671,6 +671,10 @@ AC_CHECK_FUNCS([prlimit],
+ 	AM_CONDITIONAL(HAVE_PRLIMIT, true)
+ 	AC_DEFINE(HAVE_PRLIMIT,1,[Have prlimit]),
+ 	AM_CONDITIONAL(HAVE_PRLIMIT, false))
++AC_CHECK_FUNCS([prlimit64],
++	AM_CONDITIONAL(HAVE_PRLIMIT64, true)
++	AC_DEFINE(HAVE_PRLIMIT64,1,[Have prlimit64]),
++	AM_CONDITIONAL(HAVE_PRLIMIT64, false))
+ 
+ # Check for some libraries
+ AC_SEARCH_LIBS(sem_open, [rt pthread])
+diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
+index fff32ae4..8f0c11ec 100644
+--- a/src/lxc/Makefile.am
++++ b/src/lxc/Makefile.am
+@@ -45,7 +45,10 @@ noinst_HEADERS += \
+ 	../include/ifaddrs.h \
+ 	../include/openpty.h \
+ 	../include/lxcmntent.h
++endif
++
+ if !HAVE_PRLIMIT
++if HAVE_PRLIMIT64
+ noinst_HEADERS += ../include/prlimit.h
+ endif
+ endif
+@@ -143,7 +146,10 @@ liblxc_la_SOURCES += \
+ 	../include/ifaddrs.c ../include/ifaddrs.h \
+ 	../include/openpty.c ../include/openpty.h \
+ 	../include/lxcmntent.c ../include/lxcmntent.h
++endif
++
+ if !HAVE_PRLIMIT
++if HAVE_PRLIMIT64
+ liblxc_la_SOURCES += ../include/prlimit.c ../include/prlimit.h
+ endif
+ endif
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 44d97843..8a66f2d0 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -97,13 +97,14 @@
+ 
+ #if IS_BIONIC
+ #include <../include/lxcmntent.h>
+-#ifndef HAVE_PRLIMIT
+-#include <../include/prlimit.h>
+-#endif
+ #else
+ #include <mntent.h>
+ #endif
+ 
++#if !defined(HAVE_PRLIMIT) && defined(HAVE_PRLIMIT64)
++#include <../include/prlimit.h>
++#endif
++
+ lxc_log_define(lxc_conf, lxc);
+ 
+ #if HAVE_LIBCAP
+@@ -2399,10 +2400,15 @@ int setup_resource_limits(struct lxc_list *limits, pid_t pid) {
+ 			return -1;
+ 		}
+ 
++#if HAVE_PRLIMIT || HAVE_PRLIMIT64
+ 		if (prlimit(pid, resid, &lim->limit, NULL) != 0) {
+ 			ERROR("failed to set limit %s: %s", lim->resource, strerror(errno));
+ 			return -1;
+ 		}
++#else
++		ERROR("Cannot set limit %s as prlimit is missing", lim->resource);
++		return -1;
++#endif
+ 	}
+ 	return 0;
+ }
+-- 
+2.14.1
+
diff --git a/package/lxc/0001-conf-fix-build-without-libcap.patch b/package/lxc/0001-conf-fix-build-without-libcap.patch
deleted file mode 100644
index 7e7c010..0000000
--- a/package/lxc/0001-conf-fix-build-without-libcap.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bc5b27d6f6d166d2a6df47982cbe36041ce6b735 Mon Sep 17 00:00:00 2001
-From: Dima Krasner <dima@securingsam.com>
-Date: Sun, 14 May 2017 12:24:59 +0300
-Subject: [PATCH] conf: fix build without libcap
-
-Signed-off-by: Dima Krasner <samdima@securingsam.com>
-[Upstream commit: https://github.com/lxc/lxc/commit/bc5b27d6f6d166d2a6df47982cbe36041ce6b735]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/lxc/conf.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 35bdb249b..76a190120 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -130,6 +130,14 @@ lxc_log_define(lxc_conf, lxc);
- #define LO_FLAGS_AUTOCLEAR 4
- #endif
- 
-+#ifndef CAP_SETUID
-+#define CAP_SETUID 7
-+#endif
-+
-+#ifndef CAP_SETGID
-+#define CAP_SETGID 6
-+#endif
-+
- /* needed for cgroup automount checks, regardless of whether we
-  * have included linux/capability.h or not */
- #ifndef CAP_SYS_ADMIN
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 086b139..8adccaf 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	lxc-2.0.8.tar.gz
+sha256	68663a67450a8d6734e137eac54cc7077209fb15c456eec401a2c26e6386eff6	lxc-2.1.1.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 03e9431..a65c166 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LXC_VERSION = 2.0.8
+LXC_VERSION = 2.1.1
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
+# We're patching configure.ac
+LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
