From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 23:30:34 +0200
Subject: [Buildroot] [git commit branch/next] package/re2: new package
Message-ID: <20200816213646.E06327FA97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4410ed7a1f519aa8217702f0defb2caf6cb01fbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

RE2 is a fast, safe, thread-friendly alternative to backtracking
regular expression engines like those used in PCRE, Perl, and
Python. It is a C++ library.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in     |  1 +
 package/re2/Config.in | 14 ++++++++++++++
 package/re2/re2.hash  |  3 +++
 package/re2/re2.mk    | 17 +++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b5285a66a2..81ee3273f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1945,6 +1945,7 @@ menu "Text and terminal handling"
 	source "package/pcre/Config.in"
 	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
+	source "package/re2/Config.in"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
 	source "package/tclap/Config.in"
diff --git a/package/re2/Config.in b/package/re2/Config.in
new file mode 100644
index 0000000000..004185a4b6
--- /dev/null
+++ b/package/re2/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_RE2
+	bool "re2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
+	help
+	  RE2 is a fast, safe, thread-friendly alternative
+	  to backtracking regular expression engines like
+	  those used in PCRE, Perl, and Python.
+	  It is a C++ library.
+
+	  https://github.com/google/re2
+
+comment "re2 needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
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
index 0000000000..0a3c204661
--- /dev/null
+++ b/package/re2/re2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# re2
+#
+################################################################################
+
+RE2_VERSION = 2020-08-01
+RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
+RE2_LICENSE = BSD-3-Clause
+RE2_LICENSE_FILES = LICENSE
+RE2_INSTALL_STAGING = YES
+
+RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
+HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
