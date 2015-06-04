From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu,  4 Jun 2015 17:21:54 -0400
Subject: [Buildroot] [PATCH v2 1/3] atf: new package
In-Reply-To: <1433452916-4378-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433452916-4378-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <1433452916-4378-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ATF, or Automated Testing Framework, is a collection of libraries to
write test programs in C, C++ and POSIX shell.

https://github.com/jmmv/atf

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v1 -> v2:
  suggested by Arnout Vandecapelle <arnout@mind.be>:
  - bump the version
  - uses the release archive instead of the github automatic one
  - updates the hash
  - removes host-pkgconf from dependencies
  - changes the license
  - reworks the comment around CONF_ENV to avoid error
---
 package/Config.in     |  1 +
 package/atf/Config.in | 11 +++++++++++
 package/atf/atf.hash  |  2 ++
 package/atf/atf.mk    | 21 +++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/atf/Config.in
 create mode 100644 package/atf/atf.hash
 create mode 100644 package/atf/atf.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..78ed223 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -57,6 +57,7 @@ endif
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/atf/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
diff --git a/package/atf/Config.in b/package/atf/Config.in
new file mode 100644
index 0000000..59712ab
--- /dev/null
+++ b/package/atf/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ATF
+	bool "atf"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  ATF, or Automated Testing Framework, is a collection of
+	  libraries to write test programs in C, C++ and POSIX shell.
+
+	  https://github.com/jmmv/atf
+
+comment "atf needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/atf/atf.hash b/package/atf/atf.hash
new file mode 100644
index 0000000..78cd3c6
--- /dev/null
+++ b/package/atf/atf.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505 atf-0.21.tar.gz
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
new file mode 100644
index 0000000..34a5ca0
--- /dev/null
+++ b/package/atf/atf.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# atf
+#
+################################################################################
+
+ATF_VERSION = 0.21
+ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_AUTORECONF = YES
+ATF_INSTALL_STAGING = YES
+ATF_LICENSE = BSD-3c
+ATF_LICENSE_FILES = COPYING
+
+# ATF_SHELL defaults to the host's bash
+ATF_CONF_ENV = \
+	kyua_cv_getopt_plus=yes \
+	kyua_cv_attribute_noreturn=yes \
+	kyua_cv_getcwd_works=yes \
+	ATF_SHELL=/bin/sh
+
+$(eval $(autotools-package))
-- 
2.4.0
