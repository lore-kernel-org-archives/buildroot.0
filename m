From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:52:22 +0200
Subject: [Buildroot] [git commit] capnproto: new package
Message-ID: <20180716145113.032D5886D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21fc68228945c04fbaf57d88d1062d266648649a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds the capnproto package. This also builds a host variant to generate
the capnp compiler that can be used to compile message definitions into
C++ code. Includes a patch from upstream to fix an issue with uclibc.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
[Thomas: only link with -latomic when BR2_TOOLCHAIN_HAS_LIBATOMIC=y.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 .../0001-Do-not-use-execinfo-h-with-uclibc.patch   | 30 ++++++++++++++++++++++
 package/capnproto/Config.in                        | 24 +++++++++++++++++
 package/capnproto/capnproto.hash                   |  3 +++
 package/capnproto/capnproto.mk                     | 25 ++++++++++++++++++
 6 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f37efa457a..de09979999 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -983,6 +983,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Joel Carlson <JoelsonCarl@gmail.com>
+F:	package/capnproto/
 F:	package/cmocka/
 F:	package/flatcc/
 
@@ -1117,6 +1118,7 @@ N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
 N:	Koen Martens <gmc@sonologic.nl>
+F:	package/capnproto/
 F:	package/linuxconsoletools/
 
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
diff --git a/package/Config.in b/package/Config.in
index c980e81003..eedce83616 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1514,6 +1514,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
new file mode 100644
index 0000000000..6bb7702a58
--- /dev/null
+++ b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
@@ -0,0 +1,30 @@
+From e651ac5febc59e3e2b5d3365ededbe5362756da2 Mon Sep 17 00:00:00 2001
+From: Koen Martens <gmc@sonologic.nl>
+Date: Wed, 12 Jul 2017 18:49:32 +0200
+Subject: [PATCH] Do not use execinfo.h with uclibc (#511)
+
+Upstream commit: https://github.com/capnproto/capnproto/commit/e651ac5febc59e3e2b5d3365ededbe5362756da2
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+
+---
+ c++/src/kj/exception.c++ | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/c++/src/kj/exception.c++ b/c++/src/kj/exception.c++
+index 218f1db..339601a 100644
+--- a/c++/src/kj/exception.c++
++++ b/c++/src/kj/exception.c++
+@@ -33,7 +33,7 @@
+ #endif
+ #include "io.h"
+ 
+-#if (__linux__ && __GLIBC__) || __APPLE__
++#if (__linux__ && __GLIBC__ && !__UCLIBC__) || __APPLE__
+ #define KJ_HAS_BACKTRACE 1
+ #include <execinfo.h>
+ #endif
+-- 
+2.7.4
+
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
new file mode 100644
index 0000000000..00328fa6ce
--- /dev/null
+++ b/package/capnproto/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_CAPNPROTO
+	bool "capnproto"
+	depends on BR2_USE_MMU
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	help
+	  Cap'n Proto is an insanely fast data interchange format
+	  and capability-based RPC system. Think JSON, except
+	  binary. Or think Protocol Buffers, except faster. In
+	  fact, in benchmarks, Cap???n Proto is INFINITY TIMES
+	  faster than Protocol Buffers.
+
+	  https://capnproto.org/index.html
+
+comment "capnproto needs host and target gcc >= 4.8 w/ C++, threads, atomic"
+	depends on BR2_USE_MMU
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
new file mode 100644
index 0000000000..1a65cdd401
--- /dev/null
+++ b/package/capnproto/capnproto.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-v0.6.1.tar.gz
+sha256	16194222e9412c3aa14d2287953f7fc89a1dcbcdd266d1534ba35060d4cde5b6  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
new file mode 100644
index 0000000000..ff7a5bc15b
--- /dev/null
+++ b/package/capnproto/capnproto.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# capnproto
+#
+################################################################################
+
+CAPNPROTO_VERSION = v0.6.1
+CAPNPROTO_SITE = $(call github,capnproto,capnproto,$(CAPNPROTO_VERSION))
+CAPNPROTO_LICENSE = MIT
+CAPNPROTO_LICENSE_FILES = LICENSE
+CAPNPROTO_INSTALL_STAGING = YES
+# Fetched from Github with no configure script
+CAPNPROTO_AUTORECONF = YES
+CAPNPROTO_CONF_OPTS = --with-external-capnp
+# Needs the capnproto compiler on the host to generate C++ code from message
+# definitions
+CAPNPROTO_DEPENDENCIES = host-autoconf host-capnproto
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CAPNPROTO_CONF_ENV += LIBS=-latomic
+endif
+# The actual source to be compiled is within a 'c++' subdirectory
+CAPNPROTO_SUBDIR = c++
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
