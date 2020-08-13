From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 13 Aug 2020 16:45:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/re2: new package
In-Reply-To: <20200813144549.1262366-1-buildroot@heine.tech>
References: <20200813144549.1262366-1-buildroot@heine.tech>
Message-ID: <20200813144549.1262366-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RE2 is a fast, safe, thread-friendly alternative to backtracking
regular expression engines like those used in PCRE, Perl, and
Python. It is a C++ library.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/Config.in     |  1 +
 package/re2/Config.in | 12 ++++++++++++
 package/re2/re2.hash  |  3 +++
 package/re2/re2.mk    | 25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/re2/Config.in
 create mode 100644 package/re2/re2.hash
 create mode 100644 package/re2/re2.mk

diff --git a/package/Config.in b/package/Config.in
index c637b5427f..f6e9524a0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1942,6 +1942,7 @@ menu "Text and terminal handling"
 	source "package/pcre/Config.in"
 	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
+	source "package/re2/Config.in"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
 	source "package/tclap/Config.in"
diff --git a/package/re2/Config.in b/package/re2/Config.in
new file mode 100644
index 0000000000..d1dcb693ea
--- /dev/null
+++ b/package/re2/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RE2
+	bool "re2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
+	help
+	  RE2 is a fast, safe, thread-friendly alternative
+	  to backtracking regular expression engines like
+	  those used in PCRE, Perl, and Python.
+	  It is a C++ library.
+
+	  https://github.com/google/re2
diff --git a/package/re2/re2.hash b/package/re2/re2.hash
new file mode 100644
index 0000000000..b8a80513b7
--- /dev/null
+++ b/package/re2/re2.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  6f4c8514249cd65b9e85d3e6f4c35595809a63ad71c5d93083e4d1dcdf9e0cd6  re2-2020-08-01.tar.gz
+sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
new file mode 100644
index 0000000000..d2791a460b
--- /dev/null
+++ b/package/re2/re2.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# Google RE2
+#
+################################################################################
+
+RE2_VERSION = 2020-08-01
+RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
+RE2_LICENSE = BSD
+RE2_LICENSE_FILES = LICENSE
+
+RE2_INSTALL_STAGING = YES
+
+RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
+HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+RE2_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=ON
+HOST_RE2_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=ON
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.25.1
