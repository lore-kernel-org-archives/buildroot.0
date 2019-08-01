From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 11:47:04 +0200
Subject: [Buildroot] [git commit] c-capnproto: add package
Message-ID: <20190801094437.CBF7D814BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6a06140cd128cbfc8b53e0e726d952f8e1c2ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds the c-capnproto package. This creates a C plugin for the regular
capnproto capnpc compiler. It supports only serialization (no RPC).

Since it depends on capnproto, the package selects capnproto and has the
same requirements as capnproto.

The host version is always needed for the code generator, which is what
gets called by packages using it. The target version is also always
needed for the library. Therefore, no Config.in.host option is needed.

We need to use the git download method because the package has
submodules. The submodule is gtest, which is not really needed, but it's
complicated to remove the dependency.

The version is the latest upstream git hash. It is version 0.3 with just
two patches applied: one to the README file, and a fix submitted by us.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
[Arnout:
 - use latest upstream version which has patch already applied;
 - mark in Config.in that dependencies come from capnproto;
 - add some newlines to .mk file;
 - updated commit message.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/c-capnproto/Config.in        | 21 +++++++++++++++++++++
 package/c-capnproto/c-capnproto.hash |  3 +++
 package/c-capnproto/c-capnproto.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05711ba678..78cdae8f3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1139,6 +1139,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Joel Carlson <JoelsonCarl@gmail.com>
+F:	package/c-capnproto/
 F:	package/capnproto/
 F:	package/cmocka/
 F:	package/flatcc/
diff --git a/package/Config.in b/package/Config.in
index 9b2cc7522d..6e0ddfd8d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1662,6 +1662,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
new file mode 100644
index 0000000000..acad5a69c8
--- /dev/null
+++ b/package/c-capnproto/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_C_CAPNPROTO
+	bool "c-capnproto"
+	depends on BR2_USE_MMU # capnproto
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # capnproto
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # capnproto
+	depends on BR2_INSTALL_LIBSTDCPP # capnproto
+	depends on BR2_TOOLCHAIN_HAS_THREADS # capnproto
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # capnproto
+	select BR2_PACKAGE_CAPNPROTO
+	help
+	  A C plugin for Cap'n Proto. Generates the code generator
+	  plugin for C. Requires regular Cap'n Proto and only
+	  provides serialization (no RPC).
+
+comment "c-capnproto needs host and target gcc >= 4.8 w/ C++, threads, atomic"
+	depends on BR2_USE_MMU
+	depends on!BR2_HOST_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
new file mode 100644
index 0000000000..75edaebf91
--- /dev/null
+++ b/package/c-capnproto/c-capnproto.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  88c454f4f4bad87c9b60cd739c7da5605c1085c0e92b317dd72d547bbb804279  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d.tar.gz
+sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/c-capnproto/c-capnproto.mk b/package/c-capnproto/c-capnproto.mk
new file mode 100644
index 0000000000..c144a4becc
--- /dev/null
+++ b/package/c-capnproto/c-capnproto.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# c-capnproto
+#
+################################################################################
+
+C_CAPNPROTO_VERSION = 9053ebe6eeb2ae762655b982e27c341cb568366d
+C_CAPNPROTO_SITE = https://github.com/opensourcerouting/c-capnproto.git
+C_CAPNPROTO_SITE_METHOD = git
+C_CAPNPROTO_GIT_SUBMODULES = YES
+C_CAPNPROTO_LICENSE = MIT
+C_CAPNPROTO_LICENSE_FILES = COPYING
+C_CAPNPROTO_INSTALL_STAGING = YES
+
+# Fetched from git with no configure script
+C_CAPNPROTO_AUTORECONF = YES
+
+# As a plugin for capnproto's capnpc, requires capnproto. Needs to be on the
+# host to generate C code from message definitions.
+C_CAPNPROTO_DEPENDENCIES = host-c-capnproto capnproto
+HOST_C_CAPNPROTO_DEPENDENCIES = host-capnproto
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
