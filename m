From: Joel Carlson <joelsoncarl@gmail.com>
Date: Tue, 23 Oct 2018 16:00:33 -0600
Subject: [Buildroot] [PATCH v2 1/1] c-capnproto: add package
Message-ID: <20181023220033.13572-1-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the c-capnproto package. This creates a C plugin for the regular
capnproto capnpc compiler. It supports only serialization (no RPC).

Since it depends on capnproto, the package selects capnproto and has the
same requirements as capnproto.

Includes a patch submitted upstream to fix a compilation error hit by
some toolchains.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
Changes v1 -> v2:
- change from the call github hook to using the https URL. To use the
  git submodules variable I had to specify a git site method, but then
  it broke the download using the call github hook. I did not realize
  this was broken because I had a cached copy.
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...r-str.h-include-stdarg.h-for-va_list.patch | 48 +++++++++++++++++++
 package/c-capnproto/Config.in                 | 21 ++++++++
 package/c-capnproto/c-capnproto.hash          |  3 ++
 package/c-capnproto/c-capnproto.mk            | 23 +++++++++
 6 files changed, 97 insertions(+)
 create mode 100644 package/c-capnproto/0001-compiler-str.h-include-stdarg.h-for-va_list.patch
 create mode 100644 package/c-capnproto/Config.in
 create mode 100644 package/c-capnproto/c-capnproto.hash
 create mode 100644 package/c-capnproto/c-capnproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a3d97eb390..57cb7b3a8b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1038,6 +1038,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Joel Carlson <JoelsonCarl@gmail.com>
+F:	package/c-capnproto/
 F:	package/capnproto/
 F:	package/cmocka/
 F:	package/flatcc/
diff --git a/package/Config.in b/package/Config.in
index 710cde6691..1714d9ec27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1590,6 +1590,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
diff --git a/package/c-capnproto/0001-compiler-str.h-include-stdarg.h-for-va_list.patch b/package/c-capnproto/0001-compiler-str.h-include-stdarg.h-for-va_list.patch
new file mode 100644
index 0000000000..f6d65ade38
--- /dev/null
+++ b/package/c-capnproto/0001-compiler-str.h-include-stdarg.h-for-va_list.patch
@@ -0,0 +1,48 @@
+From c9d899c7fbf6e445b44372ba4814dc7c1b8e702d Mon Sep 17 00:00:00 2001
+From: Joel Carlson <JoelsonCarl@gmail.com>
+Date: Tue, 9 Oct 2018 15:40:46 -0600
+Subject: [PATCH] compiler/str.h: include stdarg.h for va_list
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With some toolchains, compilation of str.c produced the following error:
+
+compiler/str.h:56:50: error: unknown type name ?va_list?
+ int str_vaddf(struct str *v, const char *format, va_list ap) ATTR(2,0);
+                                                  ^~~~~~~
+
+One toolchain had the following in its stdarg.h:
+"We deliberately do not define va_list when called from
+stdio.h, because ANSI C says that stdio.h is not supposed to
+define va_list."
+
+str.c includes stdio.h, but none of the prior includes result in the
+inclusion of stdarg.h. Therefore, explicitly include it in str.h to fix
+the issue on toolchains following this ANSI C rule.
+
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+---
+
+Submitted upstream:
+https://github.com/opensourcerouting/c-capnproto/pull/28
+
+---
+ compiler/str.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compiler/str.h b/compiler/str.h
+index 37a95a8..f2763c2 100644
+--- a/compiler/str.h
++++ b/compiler/str.h
+@@ -9,6 +9,7 @@
+ 
+ #include <capnp_c.h>
+ #include <stdlib.h>
++#include <stdarg.h>
+ 
+ struct str {
+ 	char *str;
+-- 
+2.17.1
+
diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
new file mode 100644
index 0000000000..3dd1d13762
--- /dev/null
+++ b/package/c-capnproto/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_C_CAPNPROTO
+	bool "c-capnproto"
+	depends on BR2_USE_MMU
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
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
index 0000000000..c1f5c278f6
--- /dev/null
+++ b/package/c-capnproto/c-capnproto.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	d6a93104bc0b47afa5dbfaaa39ee89319a2f41126d4959b6e772b843a1e0afd8  c-capnproto-c-capnproto-0.3.tar.gz
+sha256	27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/c-capnproto/c-capnproto.mk b/package/c-capnproto/c-capnproto.mk
new file mode 100644
index 0000000000..11ec07b47c
--- /dev/null
+++ b/package/c-capnproto/c-capnproto.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# c-capnproto
+#
+################################################################################
+
+C_CAPNPROTO_SHORT_VERSION = 0.3
+C_CAPNPROTO_VERSION = c-capnproto-$(C_CAPNPROTO_SHORT_VERSION)
+C_CAPNPROTO_SITE = https://github.com/opensourcerouting/c-capnproto.git
+C_CAPNPROTO_SITE_METHOD = git
+C_CAPNPROTO_GIT_SUBMODULES = YES
+C_CAPNPROTO_LICENSE = MIT
+C_CAPNPROTO_LICENSE_FILES = COPYING
+C_CAPNPROTO_INSTALL_STAGING = YES
+# Fetched from Github with no configure script
+C_CAPNPROTO_AUTORECONF = YES
+# As a plugin for capnproto's capnpc, requires capnproto. Needs to be on the
+# host to generate C code from message definitions.
+C_CAPNPROTO_DEPENDENCIES = host-c-capnproto capnproto
+HOST_C_CAPNPROTO_DEPENDENCIES = host-capnproto
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
