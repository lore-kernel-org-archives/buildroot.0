From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed,  3 Jun 2015 14:47:54 -0400
Subject: [Buildroot] [PATCH 1/3] atf: new package
In-Reply-To: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <1433357276-7083-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
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
index 0000000..cd929b8
--- /dev/null
+++ b/package/atf/atf.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 3677cf957d7f574835b8bdd385984ba928d5695b3ff28f958e4227f810483ab7 atf-0.20.tar.gz
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
new file mode 100644
index 0000000..af691f5
--- /dev/null
+++ b/package/atf/atf.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# atf
+#
+################################################################################
+
+ATF_VERSION = 0.20
+ATF_SOURCE = atf-$(ATF_VERSION).tar.gz
+ATF_SITE = https://github.com/jmmv/atf/archive
+ATF_DEPENDENCIES = host-pkgconf
+ATF_AUTORECONF = YES
+ATF_INSTALL_STAGING = YES
+ATF_LICENSE = BSD
+ATF_LICENSE_FILES = COPYING
+ATF_CONF_ENV = \
+	kyua_cv_getopt_plus=yes \
+	kyua_cv_attribute_noreturn=yes \
+	kyua_cv_getcwd_works=yes \
+	ATF_SHELL=/bin/sh # default is /usr/bin/bash
+
+$(eval $(autotools-package))
-- 
2.4.0
