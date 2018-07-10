From: Joel Carlson <joelsoncarl@gmail.com>
Date: Mon,  9 Jul 2018 19:22:57 -0600
Subject: [Buildroot] [PATCH v3 1/1] capnproto: new package
Message-ID: <1531185777-23485-1-git-send-email-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the capnproto package. This also builds a host variant to generate
the capnp compiler that can be used to compile message definitions into
C++ code. Includes a patch from upstream to fix an issue with uclibc.

The top level of the repository is not where compilation occurs, but
rather within a 'c++' folder, so the package extraction commands are
altered to only extract the c++ folder so that the rest of the autotools
framework will work correctly. Extraction also saves the LICENSE file
that was in the top-level.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
This is me digging up yet another old patch...
Original v2 is here: https://patchwork.ozlabs.org/patch/787341/

Changes v2->v3:
  - commit message about the package and not reiterating the help text
  - changed to grab source from github, and modify extraction to get
    appropriate directories
  - modified patch to fix uclibc issue and point at upstream commit
  - change order of dependencies to list hardware (MMU) first

Tested with test-pkg -a: 47 builds, 5 skipped, 0 build failed, 0 legal-info failed
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 .../0001-Do-not-use-execinfo-h-with-uclibc.patch   | 33 ++++++++++++++++
 package/capnproto/Config.in                        | 22 +++++++++++
 package/capnproto/capnproto.hash                   |  2 +
 package/capnproto/capnproto.mk                     | 44 ++++++++++++++++++++++
 6 files changed, 104 insertions(+)
 create mode 100644 package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
 create mode 100644 package/capnproto/Config.in
 create mode 100644 package/capnproto/capnproto.hash
 create mode 100644 package/capnproto/capnproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 82accbb..064fde4 100644
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
index 20fe5ad..5d61f8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1504,6 +1504,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
new file mode 100644
index 0000000..d4f3e56
--- /dev/null
+++ b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
@@ -0,0 +1,33 @@
+From e651ac5febc59e3e2b5d3365ededbe5362756da2 Mon Sep 17 00:00:00 2001
+From: Koen Martens <gmc@sonologic.nl>
+Date: Wed, 12 Jul 2017 18:49:32 +0200
+Subject: [PATCH] Do not use execinfo.h with uclibc (#511)
+
+Upstream commit: https://github.com/capnproto/capnproto/commit/e651ac5febc59e3e2b5d3365ededbe5362756da2
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+
+---
+This patch has been hand-edited as the git repository at the top level has a
+'c++' folder that the 'src' folder resides within, but the buildroot package
+is setup to extract the internals of the 'c++' folder only.
+---
+ src/kj/exception.c++ | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/kj/exception.c++ b/src/kj/exception.c++
+index 218f1db..339601a 100644
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
+-- 
+2.7.4
+
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
new file mode 100644
index 0000000..be5154c
--- /dev/null
+++ b/package/capnproto/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CAPNPROTO
+	bool "capnproto"
+	depends on BR2_USE_MMU
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
+	depends on BR2_USE_MMU
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
new file mode 100644
index 0000000..3b0e55b
--- /dev/null
+++ b/package/capnproto/capnproto.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-v0.6.1.tar.gz
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
new file mode 100644
index 0000000..09b1f91
--- /dev/null
+++ b/package/capnproto/capnproto.mk
@@ -0,0 +1,44 @@
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
+CAPNPROTO_AUTORECONF = YES
+CAPNPROTO_CONF_OPTS = --with-external-capnp
+# Needs the capnproto compiler on the host to generate C++ code from message
+# definitions
+CAPNPROTO_DEPENDENCIES = host-autoconf host-capnproto
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CAPNPROTO_CONF_ENV += LIBS=-latomic
+endif
+
+# The actual source to be compiled is within a 'c++' folder at the top-level,
+# so extract just that c++ folder. But the LICENSE file is in the top-level
+# directory, so extract that as well.
+define CAPNPROTO_EXTRACT_CMDS
+	$(TAR) -C $(CAPNPROTO_DIR) --strip-components=2 $(TAR_OPTIONS) \
+		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
+		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/c++
+	$(TAR) -C $(CAPNPROTO_DIR) --strip-components=1 $(TAR_OPTIONS) \
+		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
+		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/LICENSE
+endef
+
+define HOST_CAPNPROTO_EXTRACT_CMDS
+	$(TAR) -C $(HOST_CAPNPROTO_DIR) --strip-components=2 $(TAR_OPTIONS) \
+		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
+		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/c++
+	$(TAR) -C $(HOST_CAPNPROTO_DIR) --strip-components=1 $(TAR_OPTIONS) \
+		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
+		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/LICENSE
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
