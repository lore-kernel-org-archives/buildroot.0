From: Koen Martens <gmc@sonologic.nl>
Date: Fri, 12 Jul 2017 18:21:14 +0200
Subject: [Buildroot] [PATCH v2] capnproto: new package
Message-ID: <201707121621.v6CGLFiv023177@mx1.sonologic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cap'n Proto is an insanely fast data interchange format
and capability-based RPC system. Think JSON, except
binary. Or think Protocol Buffers, except faster. In
fact, in benchmarks, Cap?n Proto is INFINITY TIMES
faster than Protocol Buffers.

https://capnproto.org/index.html
Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Do-not-use-execinfo-h-with-uclibc.patch   | 36 ++++++++++++++++++++++
 package/capnproto/Config.in                        | 22 +++++++++++++
 package/capnproto/capnproto.hash                   |  2 ++
 package/capnproto/capnproto.mk                     | 22 +++++++++++++
 6 files changed, 84 insertions(+)
 create mode 100644 package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
 create mode 100644 package/capnproto/Config.in
 create mode 100644 package/capnproto/capnproto.hash
 create mode 100644 package/capnproto/capnproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f392838..f5e041e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1024,6 +1024,7 @@ N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
 N:	Koen Martens <gmc@sonologic.nl>
+F:	package/capnproto/
 F:	package/linuxconsoletools/
 
 N:	Laurent Cans <laurent.cans@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index db943df..3166791 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1377,6 +1377,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/capnproto/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
new file mode 100644
index 0000000..dddc923
--- /dev/null
+++ b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
@@ -0,0 +1,36 @@
+From: Koen Martens <gmc@sonologic.nl>
+Date: Thu, 11 Jul 2017 20:44:18 +0200
+Subject: [PATCH] Do not use execinfo.h with uclibc
+
+Capnproto assumes that if __GLIBC__ is defined then
+execinfo.h is available. uClibc does not implement
+execinfo.h, but does define __GLIBC__ in features.h
+(documented as an acceptable lie).
+
+uClibc also defines __UCLIBC__ in features.h, so we
+check for that macro to be defined and skip the
+features that depend on execinfo.h when it is
+defined.
+
+This patch has been submitted upstream.
+
+Because the directory structure of the release tarball
+is different from the git repository, this patch has
+not been generated with git format-patch.
+
+https://github.com/capnproto/capnproto/pull/511
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+diff --git a/src/kj/exception.c++ b/src/kj/exception.c++
+index 218f1db..d10ce8d 100644
+--- a/src/kj/exception.c++
++++ b/src/kj/exception.c++
+@@ -33,7 +33,7 @@
+ #endif
+ #include "io.h"
+ 
+-#if (__linux__ && __GLIBC__) || __APPLE__
++#if (__linux__ && __GLIBC__ && !__UCLIBC__) || __APPLE__
+ #define KJ_HAS_BACKTRACE 1
+ #include <execinfo.h>
+ #endif
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
new file mode 100644
index 0000000..ef0e380
--- /dev/null
+++ b/package/capnproto/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CAPNPROTO
+	bool "capnproto"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Cap'n Proto is an insanely fast data interchange format
+	  and capability-based RPC system. Think JSON, except
+	  binary. Or think Protocol Buffers, except faster. In
+	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
+	  faster than Protocol Buffers.
+
+	  https://capnproto.org/index.html
+
+comment "capnproto needs host and target gcc >= 4.8 w/ C++, threads"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
new file mode 100644
index 0000000..451baaa
--- /dev/null
+++ b/package/capnproto/capnproto.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8082040cd8c3b93c0e4fc72f2799990c72fdcf21c2b5ecdae6611482a14f1a04	capnproto-c++-0.6.1.tar.gz
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
new file mode 100644
index 0000000..6221d4e
--- /dev/null
+++ b/package/capnproto/capnproto.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# capnproto
+#
+################################################################################
+
+CAPNPROTO_VERSION = 0.6.1
+CAPNPROTO_SOURCE = capnproto-c++-$(CAPNPROTO_VERSION).tar.gz
+CAPNPROTO_SITE = https://capnproto.org
+CAPNPROTO_LICENSE = MIT
+CAPNPROTO_LICENSE_FILES = LICENSE.txt
+CAPNPROTO_INSTALL_STAGING = YES
+CAPNPROTO_AUTORECONF = YES
+CAPNPROTO_CONF_OPTS = --with-external-capnp
+CAPNPROTO_DEPENDENCIES = host-autoconf host-capnproto
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CAPNPROTO_CONF_ENV += LIBS=-latomic
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
