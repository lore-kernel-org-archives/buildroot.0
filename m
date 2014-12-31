From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 17:58:09 +0100
Subject: [Buildroot] [git commit] ding-libs: new package
Message-ID: <20141231170047.1985C807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3af1d306bdc4144e243e453221a7ab5a49b14e56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Remove unneeded comment in Config.in
 - Remove select if libiconv, not needed
 - Add dependency on wchar, needed when we depend on gettext
 - Improve Config.in help text
 - Fix the format of the hash file to make it actually useful
 - Fix the comment header in the .mk file
 - Remove useless commented line in .mk file
 - Fixup license information: it's not under GPLv3, but under LGPLv3+
   (library) and GPLv3+ (test programs)
 - Add host-pkgconf to the dependencies, remove libiconv from the
   dependencies.
 - Add a comment to explain why autoreconf is needed.
 - Remove usage of $(MAKE1) that does look necessary.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/ding-libs/Config.in      |   21 +++++++++++++++++++++
 package/ding-libs/ding-libs.hash |    2 ++
 package/ding-libs/ding-libs.mk   |   18 ++++++++++++++++++
 4 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b49145f..ae6ffd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -881,6 +881,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
new file mode 100644
index 0000000..bb4fa24
--- /dev/null
+++ b/package/ding-libs/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_DING_LIBS
+	bool "ding-libs"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_USE_WCHAR if BR2_NEEDS_GETTEXT
+	help
+	  The ding-libs packages contain a set of libraries used by
+	  the System Security Services Daemon (SSSD) and other
+	  projects and provide functions to manipulate filesystem
+	  pathnames (libpath_utils), a hash table to manage storage
+	  and access time properties (libdhash), a data type to
+	  collect data in a hierarchical structure (libcollection), a
+	  dynamically growing, reference-counted array (libref_array),
+	  and a library to process configuration files in
+	  initialization format (INI) into a library collection data
+	  structure (libini_config).
+
+	  https://git.fedorahosted.org/git/ding-libs.git
+
+comment "ding-libs needs a toolchain w/ wchar"
+	depends on BR2_NEEDS_GETTEXT
+	depends on !BR2_USE_WCHAR
diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
new file mode 100644
index 0000000..6e35697
--- /dev/null
+++ b/package/ding-libs/ding-libs.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 639984a57d6f936a6551c842712619692febaebf4515033fc929620a241ffa6a ding_libs-0_4_0.tar.xz
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
new file mode 100644
index 0000000..d7977ee
--- /dev/null
+++ b/package/ding-libs/ding-libs.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ding-libs
+#
+################################################################################
+
+DING_LIBS_VERSION = 0_4_0
+DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
+DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
+DING_LIBS_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext) host-pkgconf
+DING_LIBS_INSTALL_STAGING = YES
+DING_LIBS_LICENSE = LGPLv3+ (library),GPLv3+ (test programs)
+DING_LIBS_LICENSE_FILES = COPYING COPYING.LESSER
+
+# autoconf/automake generated files not present in tarball
+DING_LIBS_AUTORECONF = YES
+
+$(eval $(autotools-package))
