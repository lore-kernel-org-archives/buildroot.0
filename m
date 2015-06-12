From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:34:28 +0200
Subject: [Buildroot] [git commit] atf: new package
Message-ID: <20150612201536.9171080411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f2a7b54edfcb7c052033c7ffa0ba9dd81d7f218
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ATF, or Automated Testing Framework, is a collection of libraries to
write test programs in C, C++ and POSIX shell.

https://github.com/jmmv/atf

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/atf/Config.in |   11 +++++++++++
 package/atf/atf.hash  |    2 ++
 package/atf/atf.mk    |   24 ++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a17901f..d111a82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1005,6 +1005,7 @@ menu "Other"
 	source "package/apr-util/Config.in"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
+	source "package/atf/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
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
index 0000000..ed2080e
--- /dev/null
+++ b/package/atf/atf.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# atf
+#
+################################################################################
+
+ATF_VERSION = 0.21
+ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_INSTALL_STAGING = YES
+ATF_LICENSE = BSD-2c, BSD-3c
+ATF_LICENSE_FILES = COPYING
+# Ships a beta libtool version hence our patch doesn't apply.
+ATF_AUTORECONF = YES
+# Do not install precompiled tests.
+ATF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+
+# ATF_SHELL defaults to the host's bash
+ATF_CONF_ENV = \
+	kyua_cv_getopt_plus=yes \
+	kyua_cv_attribute_noreturn=yes \
+	kyua_cv_getcwd_works=yes \
+	ATF_SHELL=/bin/sh
+
+$(eval $(autotools-package))
